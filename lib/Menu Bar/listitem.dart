import 'package:flutter/material.dart';
import 'package:flutter_blog/Constants/constants.dart';

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
