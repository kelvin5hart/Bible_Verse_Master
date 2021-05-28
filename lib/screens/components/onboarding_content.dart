import 'package:flutter/material.dart';
import 'package:bible_verse_master/size_config.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
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
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        )
      ],
    );
  }
}
