import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            child: Quizzler(),
          ),
        ),
      ),
    );
  }
}

class Quizzler extends StatefulWidget {
  Quizzler({Key? key}) : super(key: key);
  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Widget> scoreKeeper = [
    Icon(
      Icons.close,
      color: Colors.red,
    ),
  ];
  List<String> questions = [
    'Boy you are one tough MF',
    'is this year our year?',
    'the Slug\'s color is green',
  ];
  List<String> Answers = [
    'False',
    'True',
    'True',
  ];
  int questionTracker = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
                questions[questionTracker],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'True',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              onPressed: () {
                String correctAnswer = Answers[questionTracker];
                if(correctAnswer == 'True'){
                  print('the user got it right');
                }else{
                  print('the user got it wrong!');
                }
                setState(() {
                  
                  questionTracker++;
                  print(questionTracker);
                });
              },
              
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {
                 String correctAnswer = Answers[questionTracker];
                if(correctAnswer == 'False'){
                  print('the user got it right');
                }else{
                  print('the user got it wrong!');
                }
                setState(() {
                  questionTracker++;
                });
              },
              child: Text(
                'False',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}