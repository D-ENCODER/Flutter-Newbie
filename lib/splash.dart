import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/home.dart';

class SecondClass extends StatefulWidget {
  @override
  _SecondClassState createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MyHomePage();
                },
              ),
            );
            Timer(
              Duration(milliseconds: 300),
              () {
                scaleController.reset();
              },
            );
          }
        },
      );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 12).animate(scaleController);

    Timer(Duration(seconds: 2), () {
      setState(() {
        scaleController.forward();
      });
    });
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b6767),
      body: Center(
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 30.0),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'WELCOME',
                textStyle: TextStyle(color: Colors.white),
                speed: Duration(milliseconds: 150),
              ),
            ],
            isRepeatingAnimation: false,
            repeatForever: false,
            displayFullTextOnTap: false,
          ),
        ),
      ),
    );
  }
}
