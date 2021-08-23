import 'package:flutter/material.dart';
import 'package:flutter_blog/Menu%20Bar/blogpage.dart';
import 'package:flutter_blog/Menu%20Bar/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyHomePage();
                    },
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/flutter.png'),
                          backgroundColor: Color(0xffFFFFFF),
                          radius: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Flutter Newbie",
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.montserrat(
                            color: textPrimary,
                            fontSize: 50,
                            letterSpacing: 3,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Wrap(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReadMoreButton(
                          text: 'HOME',
                          colour: Color(0xff2b6767),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MyHomePage();
                                },
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReadMoreButton(
                          text: 'BLOG',
                          colour: Color(0xff2b6767),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BlogPage();
                                },
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReadMoreButton(
                          text: 'SUGGESTIONS',
                          colour: Color(0xff2b6767),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return BlogPage();
                                },
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReadMoreButton(
                          colour: Color(0xff2b6767),
                          text: 'ABOUT',
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return MyHomePage();
                            //     },
                            //   ),
                            // );
                          }),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ReadMoreButton(
                        colour: Color(0xff2b6767),
                        text: 'CONTACT US',
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return MyHomePage();
                          //     },
                          //   ),
                          // );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 1,
            margin: EdgeInsets.only(bottom: 30),
            color: Color(0xFF2B6767)),
      ],
    );
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

class ListItem extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final String? description;
  final Function onpressed;

  const ListItem(
      {Key? key,
      required this.onpressed,
      required this.title,
      required this.imageUrl,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Column(
        children: <Widget>[
          if (imageUrl != null)
            Container(
              child: ImageWrapper(
                image: imageUrl!,
              ),
            ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: marginBottom12,
                child: Text(
                  title,
                  style: headlineTextStyle,
                ),
              ),
            ),
          ),
          if (description != null)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: marginBottom12,
                  child: Text(
                    description!,
                    style: bodyTextStyle,
                  ),
                ),
              ),
            ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: marginBottom24,
                child: ReadMoreButton(
                  onPressed: onpressed,
                  text: 'READ MORE',
                  colour: Color(0xff2b6767),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
