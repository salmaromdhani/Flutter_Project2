import 'package:flutter/material.dart';
import 'package:second_app/questions_screen.dart';
import 'package:second_app/start_screen.dart';
import 'package:second_app/data/questions.dart';
import 'package:second_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // ***********vid 10 ***********
  //Widget activeScreen = const StartScreen(switchScreen);
  /* -> 
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen =  StartScreen(switchScreen);
    super.initState();
  }

  @override
  void initState() {
    activeScreen =  StartScreen(switchScreen);
    super.initState();
  }
  */
//**************vid12 ******************/
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {
    //********vid num 13  */
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    } else if (activeScreen == 'results-screen') {
      screenWidget =  ResultsScreen(chosenAnswers:selectedAnswers , restart: switchScreen);
      selectedAnswers = [];
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          // vid  10 :
          // child: activeScreen,

          /* vid 12 :
            child: activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : const QuestionsScreen(),*/

          //vid 13 :
          child: screenWidget,
        ),
      ),
    );
  }
}
