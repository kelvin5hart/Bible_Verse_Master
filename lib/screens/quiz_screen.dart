import 'package:bible_verse_master/ad_state.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:bible_verse_master/widgets/timer.dart';
import 'package:bible_verse_master/data/bible_verses.dart';
import 'package:bible_verse_master/widgets/bible_verse_text.dart';
import 'package:bible_verse_master/widgets/options_button.dart';
import 'package:bible_verse_master/widgets/result.dart';
import 'dart:math';
import 'package:bible_verse_master/widgets/score.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class QuizScreen extends StatefulWidget {
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
  BannerAd? bannerAd;
  bool _isLoaded = false;
  bool gameWon = false;

  void changeVerse(optionSelected, correctAnswer) {
    print(optionSelected);
    print(correctAnswer);
    setState(() {
      //used to check for the correct answer in the quiz
      if (optionSelected == correctAnswer) {
        score = score + 1;
        generateQuestions();
        shuffleOptions();
        _controller.restart(duration: _duration);
      } else {
        continueGame = false;
        print(continueGame);
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
      gameWon = false;
    });
  }

  //used to generate random numbers for the counter variable
  void generateQuestions() {
    if (answeredQuestions.length < bibleVerse.length) {
      if (counter < answeredQuestions[2]) {
        print(counter);
        counter = counter + 1;
      } else {
        Random random = new Random();
        int randomNumber = random.nextInt(bibleVerse.length);
        while (answeredQuestions.contains(randomNumber)) {
          randomNumber = random.nextInt(bibleVerse.length);
        }
        answeredQuestions.add(randomNumber);
        print(answeredQuestions);
        print(randomNumber);
        counter = randomNumber;
      }
    } else {
      gameWon = true;
    }
  }

  //Shuffle the way the options show up
  void shuffleOptions() {
      optionsAnswer.shuffle();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((value) {
      setState(() {
        bannerAd = BannerAd(
          request: AdRequest(),
          size: AdSize.banner,
          adUnitId: adState.bannerAdUnitId,
          listener: adState.adListener
        )..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: continueGame && gameWon == false
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ScoreWidget(
                          score: score,
                        ),
                      ),
                      Expanded(
                        child: Timer(
                          duration: _duration,
                          controller: _controller,
                          onComplete: timerFinished,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: BibleVerseText(
                          bibleVerse: bibleVerse,
                          counter: counter,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OptionsButton(
                              onPressed: () => changeVerse(
                                  bibleVerse[counter]['options']
                                      [optionsAnswer[0]],
                                  bibleVerse[counter]['verse']),
                              counter: counter,
                              bibleVerse: bibleVerse,
                              optionNumber: optionsAnswer[0],
                            ),
                            OptionsButton(
                              onPressed: () => changeVerse(
                                  bibleVerse[counter]['options']
                                      [optionsAnswer[1]],
                                  bibleVerse[counter]['verse']),
                              counter: counter,
                              bibleVerse: bibleVerse,
                              optionNumber: optionsAnswer[1],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OptionsButton(
                              onPressed: () => changeVerse(
                                  bibleVerse[counter]['options']
                                      [optionsAnswer[2]],
                                  bibleVerse[counter]['verse']),
                              counter: counter,
                              bibleVerse: bibleVerse,
                              optionNumber: optionsAnswer[2],
                            ),
                            OptionsButton(
                              onPressed: () => changeVerse(
                                  bibleVerse[counter]['options']
                                      [optionsAnswer[3]],
                                  bibleVerse[counter]['verse']),
                              counter: counter,
                              bibleVerse: bibleVerse,
                              optionNumber: optionsAnswer[3],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                  : ResultPage(
                gameWon: gameWon,
                      score: score,
                      onPressed: resetFunction,
                      highestScore: highestScore,
                    )
            ),
            bannerAd != null
                ? Container(
              height: 50,
              child: AdWidget(
                ad: bannerAd!,
              ),
            )
                : SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
