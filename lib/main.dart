import 'package:flutter/material.dart';
import 'quuz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
QuuzBrain quuzBrain = QuuzBrain();

void main() => runApp(Quizzler());


class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade900,
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
  List<Icon> ScoreKeeper =[];
  void checkAwnser(bool userPickedAwnser){
    bool carrectAnswer = quuzBrain.getcarrectAnswer();
    setState(() {
    if(userPickedAwnser == carrectAnswer){
      ScoreKeeper.add(Icon(Icons.check,color: Colors.green,));
    }else{
      ScoreKeeper.add(Icon(Icons.close,color: Colors.red,));
    }


      quuzBrain.nextQuestion();
    });




  }
  // List<String> questions =[
  //   'You can lead a cow down stairs but not up stairs.',
  //        'Approximately one quarter of human bones are in the feet.',
  //       'A slug\'s blood is green.'
  // ];
  // List<bool> answer = [false, true, true,];
  // Question q1 = Question(q:'You can lead a cow down stairs but not up stairs.',a: false  );




  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quuzBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
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
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAwnser(true);
                // quuzBrain.questionBank[questionNumber].questionAnswer =true;

                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAwnser(false);
                //The user picked false.
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

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
