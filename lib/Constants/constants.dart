import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color textPrimary = Color(0xFF2B6767);

class ReadMoreButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color colour;

  ReadMoreButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.colour})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hover = false;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return MouseRegion(
        onHover: (event) => setState(() => hover = true),
        onExit: (event) => setState(() => hover = false),
        // ignore: deprecated_member_use
        child: OutlineButton(
          onPressed: onPressed as void Function()?,
          highlightedBorderColor: colour,
          hoverColor: colour,
          borderSide: BorderSide(color: colour, width: 2),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  fontSize: 18,
                  color: hover ? Color(0xffFFFFFF) : colour,
                  letterSpacing: 1),
            ),
          ),
        ),
      );
    });
  }
}

BoxShadow myBoxShadow() {
  return BoxShadow(
    color: Color(0xff000000).withOpacity(0.7),
    blurRadius: 25,
    offset: Offset(5, 10),
  );
}

const EdgeInsets marginBottom24 = EdgeInsets.only(bottom: 24);
const EdgeInsets marginBottom12 = EdgeInsets.only(bottom: 12);
TextStyle bodyTextStyle = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontSize: 18,
    color: textPrimary,
  ),
);
TextStyle headlineTextStyle = GoogleFonts.montserrat(
    textStyle: TextStyle(
        fontSize: 28,
        color: textPrimary,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w300));

class ImageWrapper extends StatelessWidget {
  final String image;

  const ImageWrapper({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 24),
      child: Image.asset(
        image,
        width: width,
        height: width / 1.618,
        fit: BoxFit.cover,
      ),
    );
  }
}

class TextBody extends StatelessWidget {
  final String text;

  const TextBody({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginBottom24,
      child: Text(
        text,
        style: bodyTextStyle,
      ),
    );
  }
}

// ignore: must_be_immutable
class SubHeading extends StatelessWidget {
  String text;
  SubHeading({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: textStyle().copyWith(fontSize: 20),
      ),
    );
  }
}

// ignore: must_be_immutable
class MainHeading extends StatelessWidget {
  String text;
  MainHeading({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: textStyle(),
      ),
    );
  }
}

TextStyle textStyle() {
  return TextStyle(
    color: Color(0xff2b6767),
    fontSize: 40,
  );
}

TextStyle fontStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 30,
  );
}

InputDecoration inputMethod() {
  return InputDecoration(
    hintText: 'Enter your name',
    hintStyle: TextStyle(
      fontWeight: FontWeight.w100,
      color: Colors.white,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(32.0),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff52ab98), width: 1.0),
      borderRadius: BorderRadius.all(
        Radius.circular(32.0),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xff52ab98), width: 2.0),
      borderRadius: BorderRadius.all(
        Radius.circular(32.0),
      ),
    ),
  );
}
