import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blog/Constants/constants.dart';
import 'package:flutter_blog/Footer/footer.dart';
import 'package:flutter_blog/Menu%20Bar/menubar.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

void _doSomething() async {
  Timer(Duration(seconds: 3), () {
    _btnController.success();
  });
}

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

final RoundedLoadingButtonController _btnController =
    RoundedLoadingButtonController();

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MenuBar(),
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xff2b6767),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                width: width * 0.75,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Contact Form',
                            style: fontStyle(),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Your Name:-',
                                      style: fontStyle().copyWith(fontSize: 17),
                                    ),
                                  ),
                                ),
                                TextField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: inputMethod(),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'E-mail:-',
                                      style: fontStyle().copyWith(fontSize: 17),
                                    ),
                                  ),
                                ),
                                TextField(
                                  style: TextStyle(color: Colors.white),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: inputMethod()
                                      .copyWith(hintText: 'Enter your E-mail'),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 8, 0, 8),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Phone-No.',
                                      style: fontStyle().copyWith(fontSize: 17),
                                    ),
                                  ),
                                ),
                                TextField(
                                  style: TextStyle(color: Colors.white),
                                  keyboardType: TextInputType.number,
                                  decoration: inputMethod().copyWith(
                                      hintText: 'Enter your phone number'),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 8),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Message:-',
                                      style: fontStyle().copyWith(fontSize: 17),
                                    ),
                                  ),
                                ),
                                TextField(
                                  minLines: 10,
                                  maxLines: 50,
                                  style: TextStyle(color: Colors.white),
                                  decoration: inputMethod().copyWith(
                                      hintText: 'Leave your message here !'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      RoundedLoadingButton(
                        valueColor: Color(0xff52ab98),
                        color: Colors.white,
                        child: Text(
                          'Tap me!',
                          style: TextStyle(
                            color: Color(0xff2b6767),
                          ),
                        ),
                        controller: _btnController,
                        onPressed: _doSomething,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}
