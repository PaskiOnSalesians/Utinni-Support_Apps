import 'package:flutter/material.dart';
import 'package:horrocrux_app/screens/quiz_jardin/Quiz/QuizAnswer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _questionIndex = 0;
  int _totalScore = 0;
  bool answerWasSelected = false;
  bool endOfQuiz = false;
  bool correctAnswerSelected = false;

  void _questionAnswered(bool answerScore) {
    //setState(() {
      answerWasSelected = true;
      if (answerScore) {
        _totalScore++;
        correctAnswerSelected = true;
      }
      if (_questionIndex + 1 == _questions.length) {
        endOfQuiz = true;
      }
    //});
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex++;
      answerWasSelected = false;
      correctAnswerSelected = false;
    });
    if (_questionIndex >= _questions.length) {
      _resetQuiz();
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      endOfQuiz = false;
    });
  }

  @override
  void initState(){
    super.initState();
    setState(() {
      answerWasSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Horrocrux Quiz Game',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '${_totalScore.toString()}/${_questions.length}',
                style: const TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity,
              height: 130.0,
              margin: const EdgeInsets.only(bottom: 10.0, left: 30.0, right: 30.0),
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  _questions[_questionIndex]['question'].toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ...(_questions[_questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map(
              (answer) => Answer(
                answerText: answer['answerText'].toString(),
                answerColor: answerWasSelected
                    ? answer['score'] != null
                        ? Colors.green
                        : Colors.red
                    : null,
                answerTap: () {
                  if (answerWasSelected) {
                    return;
                  }
                  _questionAnswered(answer['score'] != null);
                },
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40.0),
              ),
              onPressed: () {
                if (!answerWasSelected) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        'Please select an answer before going to the next question'),
                  ));
                  return;
                }
                _nextQuestion();
              },
              child: Text(endOfQuiz ? 'Restart Quiz' : 'Next Question'),
            ),
            if (answerWasSelected && !endOfQuiz)
              Container(
                height: 100,
                width: double.infinity,
                color: correctAnswerSelected ? Colors.green : Colors.red,
                child: Center(
                  child: Text(
                    correctAnswerSelected
                        ? 'Well done, you got it right!'
                        : 'Wrong :/',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (endOfQuiz)
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.black,
                child: Center(
                  child: Text(
                    _totalScore > 4
                        ? 'Congratulations! Your final score is: $_totalScore'
                        : 'Your final score is: $_totalScore. Better luck next time!',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: _totalScore > 4 ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

const _questions = [
  {
    'question': 'Qué escoba recibió Harry en su primer año?',
    'answers': [
      {'answerText': 'Nimbus 2000', 'score': true},
      {'answerText': 'Nimbus 2001', 'score': false},
      {'answerText': 'Saeta de fuego', 'score': false},
    ],
  },
  {
    'question': 'De parte de quien recibió Harry su primera escoba?',
    'answers': [
      {'answerText': 'Rubeus Hagrid', 'score': false},
      {'answerText': 'Albus Dumbledore', 'score': false},
      {'answerText': 'Minerva McGonagall', 'score': true},
    ],
  },
  {
    'question': 'Cuantos puntos recibe el equipo que pasa una bola por un aro?',
    'answers': [
      {'answerText': '20', 'score': false},
      {'answerText': '5', 'score': false},
      {'answerText': '10', 'score': true},
    ],
  },
  {
    'question': 'Cuantos tipos de bolas hay?',
    'answers': [
      {'answerText': '2', 'score': false},
      {'answerText': '3', 'score': true},
      {'answerText': '4', 'score': false},
    ],
  },
  {
    'question': 'Qué rol tenía Oliver Wood en su equipo?',
    'answers': [
      {'answerText': 'Buscador', 'score': false},
      {'answerText': 'Guardián', 'score': true},
      {'answerText': 'Golpeador', 'score': false},
    ],
  },
  {
    'question': 'Cuantos puntos proporciona la Snitch Dorada?',
    'answers': [
      {'answerText': '150', 'score': true},
      {'answerText': '100', 'score': false},
      {'answerText': '200', 'score': false},
    ],
  },
];
