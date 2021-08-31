import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blog/Constants/constants.dart';
import 'package:flutter_blog/Footer/footer.dart';
import 'package:flutter_blog/Menu%20Bar/menubar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

final RoundedLoadingButtonController _btnController =
    RoundedLoadingButtonController();

class _ContactUsPageState extends State<ContactUsPage> {
  String name = '';
  String email = '';
  String message = '';
  String number = '';
  final _firestore = FirebaseFirestore.instance;
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
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Your Name:-',
                                style: fontStyle().copyWith(fontSize: 17),
                              ),
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              name = value;
                            },
                            style: TextStyle(color: Colors.white),
                            decoration: inputMethod(),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'E-mail:-',
                                style: fontStyle().copyWith(fontSize: 17),
                              ),
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              email = value;
                            },
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                            decoration: inputMethod()
                                .copyWith(hintText: 'Enter your E-mail'),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Phone-No.',
                                style: fontStyle().copyWith(fontSize: 17),
                              ),
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              number = value;
                            },
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.number,
                            decoration: inputMethod()
                                .copyWith(hintText: 'Enter your phone number'),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Message:-',
                                style: fontStyle().copyWith(fontSize: 17),
                              ),
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              message = value;
                            },
                            minLines: 10,
                            maxLines: 50,
                            style: TextStyle(color: Colors.white),
                            decoration: inputMethod().copyWith(
                                hintText: 'Leave your message here !'),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: RoundedLoadingButton(
                          valueColor: Color(0xff52ab98),
                          color: Colors.white,
                          child: Text(
                            'Send',
                            style: TextStyle(
                              color: Color(0xff2b6767),
                            ),
                          ),
                          controller: _btnController,
                          onPressed: () {
                            if (email != '' &&
                                name != '' &&
                                message != '' &&
                                number != '') {
                              try {
                                _firestore.collection('Contact Form').add(
                                  {
                                    'E-mail': email,
                                    'Message': message,
                                    'Name': name,
                                    'Phone No': number,
                                  },
                                );
                                Timer(
                                  Duration(seconds: 3),
                                  () {
                                    _btnController.success();
                                  },
                                );
                                Fluttertoast.showToast(
                                  msg: 'Message sent',
                                  textColor: Colors.white,
                                  webPosition: "center",
                                  webShowClose: true,
                                  webBgColor: "#4caf50",
                                  timeInSecForIosWeb: 5,
                                );
                              } catch (e) {
                                print(e);
                                Timer(
                                  Duration(seconds: 3),
                                  () {
                                    _btnController.error();
                                  },
                                );
                              }
                            } else {
                              Timer(
                                Duration(seconds: 3),
                                () {
                                  _btnController.error();
                                },
                              );
                              Fluttertoast.showToast(
                                msg: 'Please fill all the fields ',
                                textColor: Colors.white,
                                webPosition: "center",
                                webShowClose: true,
                                webBgColor: "#f44336",
                                timeInSecForIosWeb: 5,
                              );
                            }
                            Timer(Duration(seconds: 4), () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      super.widget,
                                ),
                              );
                            });
                          },
                        ),
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
