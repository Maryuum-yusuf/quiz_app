import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/results.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  // List<String> questions = [
  //   'The Amazon is the longest river in the world.',
  //   'The Great Wall of China can be seen from space.',
  //   'Mount Everest is the highest mountain in the world.',
  //   'The human skeleton is made up of less than 100 bones.',
  // ];
  // List<bool> answers = [
  //   false,
  //   true,
  //   false,
  //   true,
  // ];
  List<Question> questions = [
    Question(
      q: 'The Great Wall of China can be seen from space.',
      a: true,
    ),
    Question(
      q: 'The Amazon is the longest river in the world.',
      a: false,
    ),
    Question(
      q: 'The human skeleton is made up of less than 100 bones.',
      a: true,
    ),
  ];

  int questionIndex = 0;
  int correctAnswers = 0;
  int falseAnswers = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff081c15),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                questions[questionIndex].questionName!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: 22.0, letterSpacing: 2.0),
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      margin: EdgeInsets.only(left: 22, right: 22),
                      height: 65,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          onPressed: () {
                            final IsCorrect =
                                questions[questionIndex].questionAnswer;
                            setState(() {
                              if (questionIndex < questions.length - 1)
                                questionIndex++;
                              else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Result(
                                        answer: correctAnswers,
                                        falses: falseAnswers),
                                  ),
                                );
                              }
                            });
                            if (IsCorrect == true) {
                              print('wa saxday');
                              setState(() {
                                correctAnswers = correctAnswers + 1;
                              });
                            } else {
                              print('wa qalady');
                              setState(() {
                                falseAnswers = falseAnswers + 1;
                              });
                            }
                          },
                          child: Text(
                            'True',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ))))
            ],
          )),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                          margin:
                              EdgeInsets.only(left: 22, right: 22, bottom: 16),
                          height: 65,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                              onPressed: () {
                                final IsFalse =
                                    questions[questionIndex].questionAnswer;
                                setState(() {
                                  if (questionIndex < questions.length - 1)
                                    questionIndex++;
                                  else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Result(
                                            answer: correctAnswers,
                                            falses: falseAnswers),
                                      ),
                                    );
                                  }
                                });
                                if (IsFalse == false) {
                                  print('wa sax');
                                  setState(() {
                                    correctAnswers = correctAnswers + 1;
                                  });
                                } else {
                                  print('wa qaladay');
                                  setState(() {
                                    falseAnswers = falseAnswers + 1;
                                  });
                                }
                              },
                              child: Text(
                                'false',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ))))
                ],
              ))
        ],
      ),
    );
  }
}

/*The human skeleton is made up of less than 100 bones.
 False 
Mount Everest is the highest mountain in the world.
True 
The Great Wall of China can be seen from space.
 False 
The Amazon is the longest river in the world.
False */