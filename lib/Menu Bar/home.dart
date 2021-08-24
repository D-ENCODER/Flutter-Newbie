import 'package:flutter/material.dart';
import 'package:flutter_blog/Constants/constants.dart';
import 'package:flutter_blog/Footer/footer.dart';

import 'menubar.dart';

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
            Image.asset('assets/cover.png'),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                children: [
                  MainHeading(
                    text: 'What is Flutter?',
                  ),
                  SubHeading(
                    text:
                        '\nFlutter is a free and open-source mobile UI framework created by Google and released in May 2017. In a few words, it allows you to create a native mobile application with only one codebase. This means that you can use one programming language and one codebase to create two different apps (for iOS and Android).',
                  ),
                  SubHeading(
                    text:
                        '\nTo develop with Flutter, you will use a programming language called Dart. The language was created by Google in October 2011, but it has improved a lot over these past years.',
                  ),
                  SubHeading(
                    text:
                        '\nDart focuses on front-end development, and you can use it to create mobile and web applications. If you know a bit of programming, Dart is a typed object programming language. You can compare Dart\'s syntax to JavaScript.\n',
                  ),
                  MainHeading(
                    text: 'Why you should learn Flutter?',
                  ),
                  SubHeading(
                    text:
                        '\nI selected some of the reasons why I like Flutter and why I want to use it next year. I will give you details and my feedback below.',
                  ),
                  Image.asset('assets/companies-using-flutter.png'),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Simple to learn and use',
                      style: textStyle().copyWith(fontSize: 30),
                    ),
                  ),
                  SubHeading(
                    text:
                        '\nFlutter is a modern framework, and you can feel it! It’s way simpler to create mobile applications with it. If you have used Java, Swift, or React Native, you\'ll notice how Flutter is different.\n\nI personally never liked mobile application development before I started using Flutter.\n\nWhat I love about Flutter is that you can create a real native application without a bunch of code.\n',
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Quick compilation: maximum productivity',
                      style: textStyle().copyWith(
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SubHeading(
                    text:
                        '\nThanks to Flutter, you can change your code and see the results in real-time. It’s called Hot-Reload. It only takes a short amount of time after you save to update the application itself.\n\nSignificant modifications force you to reload the app. But if you do work like design, for example, and change the size of an element, it’s in real-time!\n',
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ideal for startup MVPs',
                      style: textStyle().copyWith(fontSize: 30),
                    ),
                  ),
                  SubHeading(
                    text:
                        '\nIf you want to show your product to investors as soon as possible, Flutter is a good choice.\n\nHere are my top 4 reasons to use it for your MVP:\n\n\u2022 It’s cheaper to develop a mobile application with Flutter because you don’t need to create and maintain two mobile apps (one for iOS and one for Android).\n\n\u2022 One developer is all you need to create your MVP.\n\n\u2022 It’s performant – you won\'t notice the difference between a native application and a Flutter app.\n\n\u2022 It’s beautiful – you can easily use widgets provided by Flutter and personalize it to create a valuable UI for your customers (you can find examples of applications made with Flutter in our blog section)\n',
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Good documentation',
                      style: textStyle().copyWith(fontSize: 30),
                    ),
                  ),
                  SubHeading(
                    text:
                        '\nIt’s important for new technology to have good documentation. But it’s not always the case that it has it!\n\nYou can learn a lot from Flutter\'s documentation, and everything is very detailed with easy examples for basic use cases. Each time I’ve had a problem with one of my widgets in my code, I have been able to check the documentation and the answer was there.\n',
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'A growing community',
                      style: textStyle().copyWith(fontSize: 30),
                    ),
                  ),
                  SubHeading(
                    text:
                        '\nFlutter has a robust community, and it’s only the beginning!\n\nAs you may know, I love to share my knowledge and useful content on programming on my website. I need to know I’m working on a technology full of potential with a lot of backers.\n\nWhen I started using Flutter, the first thing I did was search for communities, and to my surprise… there are a considerable number of places to exchange info on Flutter.\n\nI will give you some examples of places I love to check daily. Feel free to send me a message on Twitter with your suggestions.\n',
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Supported by Android Studio and VS Code',
                      style: textStyle().copyWith(fontSize: 30),
                    ),
                  ),
                  SubHeading(
                    text:
                        '\nFlutter is available on different IDEs. The two main code editors for developing with this technology are Android Studio (IntelliJ) and VS Code.\n\nAndroid Studio is a complete software with everything already integrated. You have to download Flutter and Dart plugins to start.\n\nVS Code is a lightweight tool, and everything is configurable through plugins from the marketplace.\n\nI use Android Studio because I don’t need to configure a lot of things to work.\n\nYou are free to choose your preferred IDE!\n',
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Freelance',
                      style: textStyle().copyWith(fontSize: 30),
                    ),
                  ),
                  SubHeading(
                    text:
                        '\nIf you want to start doing some freelance work, you should think about using Flutter.\n\nIn 2020, I believe that this technology is going to explode. And that means a lot of people are going to search for developers who know how to use it.\n\nThe biggest platform for freelancers in France, called Malt, recently published the tech trends of this year. Flutter has grown by +303% on this platform between 2018 and 2019.',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
