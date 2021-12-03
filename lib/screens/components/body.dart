import 'package:bible_verse_master/screens/quiz_screen.dart';
import 'package:bible_verse_master/size_config.dart';
import 'package:flutter/material.dart';
import 'onboarding_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> onboardingData = [
    {
      "text":
          'Welcome to Bible Verse Master! How well do you know your memory verses?',
      "image": 'assets/images/onboarding_one.png'
    },
    {
      "text": "Choose the correct bible passage before the time runs out",
      "image": 'assets/images/onboarding_two.png'
    },
    {
      "text": "Are you the next Bible Verse Master?",
      "image": 'assets/images/onboarding_three.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'BIBLE VERSE MASTER',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(36),
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  text: onboardingData[index]['text'],
                  image: onboardingData[index]['image'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                    children: List.generate(onboardingData.length,
                        (index) => buildDot(index: index)),
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, QuizScreen.routeName);
                    },
                    child: Text(
                      'Start',
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(30)),
                    ),
                    style: TextButton.styleFrom(primary: Colors.teal),
                  ),
                  Spacer(),
                  Image.asset('assets/images/KAHStudios.png', height: getProportionateScreenHeight(100),
                    width: getProportionateScreenWidth(100),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: currentPage == index ? 25 : 15,
      decoration: BoxDecoration(
          color: currentPage == index ? Colors.teal : Colors.black38,
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
