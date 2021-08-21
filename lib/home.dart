import 'package:flutter/material.dart';
import 'package:flutter_blog/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MenuBar(),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'What is Flutter?',
                      style: TextStyle(
                        color: Color(0xff2b6767),
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Flutter is a free and open-source mobile UI framework created by Google and released in May 2017. In a few words, it allows you to create a native mobile application with only one codebase. This means that you can use one programming language and one codebase to create two different apps (for iOS and Android).',
                      style: TextStyle(
                        color: Color(0xff2b6767),
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
              child: Footer(),
            ),
          ],
        ),
      ),
    );
  }
}
