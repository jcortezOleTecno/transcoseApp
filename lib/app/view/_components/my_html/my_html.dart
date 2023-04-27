import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class MyHtml extends StatelessWidget {
  const MyHtml({
    Key? key,
    required this.text,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  final String text;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: text,
      style: {
        // tables will have the below background color
        "p": Style(
          fontSize: FontSize(26),
          color: color,
          fontWeight: fontWeight,
        ),
        "body": Style(
          fontSize: FontSize(32),
          color: color,
          fontWeight: fontWeight,
        ),
        "li": Style(
          fontSize: FontSize(32),
          color: color,
          fontWeight: fontWeight,
        ),
        "b": Style(
          fontSize: FontSize(30),
          color: color,
          fontWeight: fontWeight,
        ),
      },
    );
  }
}
