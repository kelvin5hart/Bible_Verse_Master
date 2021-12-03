import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final int highestScore;
  final VoidCallback onPressed;
  final bool gameWon;

  ResultPage(
      {required this.score,
      required this.onPressed,
      required this.highestScore, required this.gameWon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: gameWon == false ? Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child:Text(
                'Highest Score: $highestScore',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  'Your Score is',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.teal,
                  ),
                ),
                Text(
                  '$score',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.teal,
                  ),
                ),
                RaisedButton(
                  onPressed: onPressed,
                  color: Colors.teal,
                  child: Text(
                    'Restart',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ) : Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
            child:Text(
              'You are a Grand Master',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                color: Colors.teal,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Image.asset('assets/images/onboarding_three.png'),
          RaisedButton(
            onPressed: onPressed,
            color: Colors.teal,
            child: Text(
              'Restart',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
