import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen/question_screen.dart';
import 'package:quiz_app/results_screen/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  String _currentScreen = 'start_screen';
  final List<String> _selectedAnswers = [];

  void switchScreen() {
    setState(() {
      _currentScreen = 'question_screen';
    });
  }

  void restartQuiz() {
    setState(() {
      _currentScreen = 'start_screen';
      _selectedAnswers.clear();
    });
  }

  void getAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _currentScreen = 'results_screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(onPressed: switchScreen);

    if (_currentScreen == 'question_screen') {
      screenWidget = QuestionScreen(onSelectedAnswer: getAnswer);
    } else if (_currentScreen == 'results_screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 91, 160, 217),
                Color.fromARGB(255, 50, 50, 50),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
