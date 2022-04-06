import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  getUserData() async{
    
  }
}