import 'package:flutter/material.dart';

class OptionsButton extends StatelessWidget {
  final Function onPressed;
  final List bibleVerse;
  final int counter;
  final int optionNumber;

  OptionsButton(
      {this.onPressed, this.bibleVerse, this.counter, this.optionNumber});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.teal[700]),
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: onPressed,
        child: Container(
          height: 100,
          width: MediaQuery
              .of(context)
              .size
              .width / 2.6,
          child: Center(
            child: Text(
              bibleVerse[counter]['options'][optionNumber],
         style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
          ),
        ));
  }
}
