import 'package:flutter/material.dart';
import 'package:flutter_blog/Footer/footer.dart';
import 'package:flutter_blog/Menu%20Bar/menubar.dart';

class HiddingAppbar extends StatefulWidget {
  const HiddingAppbar({Key? key}) : super(key: key);

  @override
  _HiddingAppbarState createState() => _HiddingAppbarState();
}

class _HiddingAppbarState extends State<HiddingAppbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MenuBar(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
