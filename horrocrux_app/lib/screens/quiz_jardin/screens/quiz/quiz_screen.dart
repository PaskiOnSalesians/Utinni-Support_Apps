import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horrocrux_app/screens/quiz_jardin/controllers/question_controller_jardin.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController_jardin _controller = Get.put(QuestionController_jardin());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(onPressed: _controller.nextQuestion, child: const Text("Skip")),
        ],
      ),
      body: const Body(),
    );
  }
}
