import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:bible_verse_master/widgets/timer.dart';
import 'package:bible_verse_master/data/bible_verses.dart';
import 'package:bible_verse_master/widgets/bible_verse_text.dart';
import 'package:bible_verse_master/widgets/options_button.dart';
import 'package:bible_verse_master/widgets/result.dart';
import 'dart:math';
import 'package:bible_verse_master/widgets/score.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key key}) : super(key: key);
  static String routeName = "/quiz_Screen";

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  CountDownController _controller = CountDownController();
  int _duration = 15;
  int counter = 0;
  int score = 0;
  int highestScore = 0;
  var continueGame = true;
  List answeredQuestions = [0, 1, 2];
  List optionsAnswer = [0, 1, 2, 3];

  void changeVerse(optionSelected, correctAnswer) {
    setState(() {
      //used to check for the correct answer in the quiz
      if (optionSelected == correctAnswer) {
        score = score + 1;
        generateQuestions();
        shuffleOptions();
        _controller.restart(duration: _duration);
      } else {
        continueGame = false;
      }

      //used to set the highest score of the game.
      if (highestScore < score) {
        highestScore = score;
      } else {
        highestScore = highestScore;
      }
    });
  }

  //What happens when the timer counts down and the player doesn't choose an answer.
  void timerFinished() {
    setState(() {
      continueGame = false;
    });
  }

  //Used to restart the game
  void resetFunction() {
    setState(() {
      counter = 0;
      score = 0;
      continueGame = true;
      answeredQuestions = [0, 1, 2];
    });
  }

  //used to generate random numbers for the counter variable
  void generateQuestions() {
    if (counter < answeredQuestions[2]) {
      counter = counter + 1;
    } else {
      Random random = new Random();
      int randomNumber = random.nextInt(bibleVerse.length);
      while (answeredQuestions.contains(randomNumber)) {
        randomNumber = random.nextInt(bibleVerse.length);
      }
      answeredQuestions.add(randomNumber);
      counter = randomNumber;
    }
  }

  //Shuffle the way the options show up
  void shuffleOptions() {
    optionsAnswer.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: continueGame == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ScoreWidget(
                    score: score,
                  ),
                  Timer(
                    duration: _duration,
                    controller: _controller,
                    onComplete: timerFinished,
                  ),
                  BibleVerseText(
                    bibleVerse: bibleVerse,
                    counter: counter,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OptionsButton(
                        onPressed: () => changeVerse(
                            bibleVerse[counter]['options'][optionsAnswer[0]],
                            bibleVerse[counter]['verse']),
                        counter: counter,
                        bibleVerse: bibleVerse,
                        optionNumber: optionsAnswer[0],
                      ),
                      OptionsButton(
                        onPressed: () => changeVerse(
                            bibleVerse[counter]['options'][optionsAnswer[1]],
                            bibleVerse[counter]['verse']),
                        counter: counter,
                        bibleVerse: bibleVerse,
                        optionNumber: optionsAnswer[1],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OptionsButton(
                        onPressed: () => changeVerse(
                            bibleVerse[counter]['options'][optionsAnswer[2]],
                            bibleVerse[counter]['verse']),
                        counter: counter,
                        bibleVerse: bibleVerse,
                        optionNumber: optionsAnswer[2],
                      ),
                      OptionsButton(
                        onPressed: () => changeVerse(
                            bibleVerse[counter]['options'][optionsAnswer[3]],
                            bibleVerse[counter]['verse']),
                        counter: counter,
                        bibleVerse: bibleVerse,
                        optionNumber: optionsAnswer[3],
                      )
                    ],
                  ),
                ],
              )
            : ResultPage(
                score: score,
                onPressed: resetFunction,
                highestScore: highestScore,
              ),
      ),
    );
  }
}
