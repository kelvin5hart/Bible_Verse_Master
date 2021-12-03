import 'package:bible_verse_master/ad_state.dart';
import 'package:flutter/material.dart';
import 'package:bible_verse_master/routes.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);

  runApp(
      Provider.value(
        value: adState,
        builder: (context, child) {
          return MaterialApp(
            title: 'Memory Verse Master',
            debugShowCheckedModeBanner: false,
            // home: OnBoardingScreen(),
            initialRoute: "/onboarding_Screen",
            routes: routes,
          );
        },
      )
  );
}
