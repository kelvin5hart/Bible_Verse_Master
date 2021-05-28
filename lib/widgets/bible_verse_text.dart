import 'package:flutter/material.dart';

class BibleVerseText extends StatelessWidget {
  final List bibleVerse;
  final int counter;
  BibleVerseText({this.bibleVerse, this.counter});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: 10),
        child: Center(
          child: Text(
      bibleVerse[counter]['passage'],
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
    ),
        ));
  }
}
