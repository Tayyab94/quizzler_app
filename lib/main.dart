import 'package:flutter/material.dart';
import 'question.dart';
import 'Quizz_Brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizzBrain quizzBrain = QuizzBrain();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Center(child: Text('Quizzer')),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
//
//  List<Icon> ScoreKeeper = [
//    Icon(
//      Icons.check,
//      color: Colors.green,
//    ),
//    Icon(
//      Icons.check,
//      color: Colors.green,
//    ),
//    Icon(
//      Icons.clear,
//      color: Colors.red,
//    ),
//    Icon(
//      Icons.check,
//      color: Colors.green,
//    ),
//    Icon(
//      Icons.check,
//      color: Colors.green,
//    )
//  ];

  List<Icon> ScoreKeeper = [];
//  List<String>questions=[
//    'You can lead a cow down stairs but not up stairs.',
//        'Approximately one quarter of human bones are in the feet.',
//    'A slug\'s blood is green.'
//  ];
//
//  List<bool>answers=[
//   false,
//    true,
//    true,
//  ];

//List<Question> QuestionBank=[
//  Question(q:'You can lead a cow down stairs but not up stairs.',a:false),
//  Question(q:'Approximately one quarter of human bones are in the feet.',a:true),
//  Question(q:'A slug\'s blood is green.',a:true)
//];

  // int question_No = 0;
  void CheckAnswer(bool original) {
    bool answer = quizzBrain.Get_Answer();
    setState(() {
      if (quizzBrain.isFinish() == true) {
        Alert(
          context:context,
          title: 'Finished!',
          desc: 'Your Quiz has been finished  Now....',
        ).show();
        quizzBrain.reset();

        ScoreKeeper=[];
      } else {
        if (original == answer) {
          ScoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else
          ScoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );

        quizzBrain.CheckQuestionNo();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(12.6),
            child: Center(
              child: Text(
                quizzBrain.Get_Question(),
                // questions.first,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25.8),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'Ture',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              onPressed: () {
                CheckAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              onPressed: () {
                CheckAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: ScoreKeeper,
        )
      ],
    );
  }
}
