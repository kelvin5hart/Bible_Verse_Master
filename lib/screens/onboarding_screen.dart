import 'package:flutter/material.dart';
import 'package:bible_verse_master/size_config.dart';
import 'package:bible_verse_master/screens/components/body.dart';

class OnBoardingScreen extends StatelessWidget {
  static String routeName = "/onboarding_Screen";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
