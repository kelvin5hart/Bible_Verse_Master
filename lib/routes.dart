import 'package:bible_verse_master/screens/onboarding_screen.dart';
import 'package:bible_verse_master/screens/quiz_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  QuizScreen.routeName: (context) => QuizScreen(),
  OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
};
