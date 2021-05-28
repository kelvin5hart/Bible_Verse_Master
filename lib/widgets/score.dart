import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final int score;

  ScoreWidget({this.score});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        margin: EdgeInsets.only(bottom: 50),
        padding: EdgeInsets.only(right: 30, top: 10,),
        alignment: Alignment.centerRight,
        child: Text(
          '$score',
          style: TextStyle(fontSize: 40, color: Colors.teal),
        )
    );
  }
}
