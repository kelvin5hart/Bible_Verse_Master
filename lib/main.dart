import 'package:flutter/material.dart';
import 'package:bible_verse_master/routes.dart';

void main() => runApp(
      MaterialApp(
        title: 'Memory Verse Master',
        debugShowCheckedModeBanner: false,
        // home: OnBoardingScreen(),
        initialRoute: "/onboarding_Screen",
        routes: routes,
      ),
    );
