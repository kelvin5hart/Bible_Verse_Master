import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';


class Timer extends StatelessWidget {
  const Timer({
    Key key,
    @required int duration,
    @required CountDownController controller,
    Function onComplete,
    Function shuffleOptions
  }) : _duration = duration, _controller = controller, onComplete = onComplete, shuffleOptions = shuffleOptions, super(key: key);

  final int _duration;
  final CountDownController _controller;
  final Function onComplete;
  final Function shuffleOptions;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Center(
        child: CircularCountDownTimer(
          backgroundColor: Colors.teal[200],
          width: 100,
          height: 100,
          duration: _duration,
          fillColor: Colors.grey[300],
          ringColor: Colors.teal,
          textStyle: TextStyle(
              fontSize: 33.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
          isReverse: true,
          strokeWidth: 15.0,
          isTimerTextShown: true,
          controller: _controller,
          onComplete: onComplete,
          onStart: shuffleOptions,
        ),
      ),
    );
  }
}