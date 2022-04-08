import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horrocrux_app/components/variables.dart';

class AuthService {
  Dio dio = Dio();

  login(username, password) async{
    try{
      return await dio.post('http://51.83.97.10:3000/api/auth/signin', data: {
        "username": username,
        "password": password
      });
    }
    on DioError catch(e){
      Fluttertoast.showToast(
        msg: e.response!.data['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }

  register(username, email, password) async{
    try{
      return await dio.post('http://51.83.97.10:3000/api/auth/signup', data: {
        "username": username,
        "email": email,
        "password": password
      }, 
      );
    }
    on DioError catch(e){
      Fluttertoast.showToast(
        msg: e.response?.data['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }

  updateFriends(currentUserId, newFriend) async{
    try{
      dio.options.headers['x-access-token'] = currentToken;
      return await dio.put('http://51.83.97.10:3000/api/users/' + currentUserId, data: {
        "id": currentUserId,
        "friends_id": newFriend
      });
    }
    on DioError catch(e){
      Fluttertoast.showToast(
        msg: e.response?.data['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }

  getUserData(currentUserId) async{
    try{
      dio.options.headers['x-access-token'] = currentToken;
      return await dio.get('http://51.83.97.10:3000/api/users/' + currentUserId);
    }
    on DioError catch(e){
      Fluttertoast.showToast(
        msg: e.response?.data['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }
}