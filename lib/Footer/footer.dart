import 'package:flutter/material.dart';
import 'package:flutter_blog/Constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final double imgheight = 70;
  final double imgwidth = 50;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 1,
            margin: EdgeInsets.only(bottom: 30),
            color: Color(0xFF2B6767)),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => launch('https://github.com/D-ENCODER'),
                child: Image.asset(
                  'assets/github.png',
                  height: imgheight,
                  width: imgwidth,
                ),
              ),
              GestureDetector(
                onTap: () =>
                    launch('https://www.linkedin.com/in/het-joshi-a9b0801b5'),
                child: Image.asset(
                  'assets/linkdin.png',
                  height: imgheight,
                  width: imgwidth,
                ),
              ),
              GestureDetector(
                onTap: () => launch(
                    'https://www.upwork.com/freelancers/~01e754873e28efed44'),
                child: Image.asset(
                  'assets/upwork.png',
                  height: imgheight,
                  width: imgwidth,
                ),
              ),
              GestureDetector(
                onTap: () => launch('https://twitter.com/Hetjoshi1684'),
                child: Image.asset(
                  'assets/twitter.png',
                  height: imgheight,
                  width: imgwidth,
                ),
              ),
              GestureDetector(
                onTap: () => launch('https://www.instagram.com/dencoder1/'),
                child: Image.asset(
                  'assets/instagram.png',
                  height: imgheight,
                  width: imgwidth,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: TextBody(text: "Copyright © 2021"),
        ),
      ],
    );
  }
}
