import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyHtml extends StatelessWidget {
  const MyHtml({
    Key? key,
    this.bodyFontSize,
    required this.text,
    this.color,
    this.fontWeight,
  }) : super(key: key);

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? bodyFontSize;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: text,
      style: {
        // tables will have the below background color
        "p": Style(
          fontSize: FontSize(24),
          color: color,
          fontWeight: fontWeight,
        ),
        "body": Style(
          fontSize: FontSize(bodyFontSize ?? 22),
          color: color,
          fontWeight: fontWeight,
        ),
        "li": Style(
          fontSize: FontSize(26),
          color: color,
          fontWeight: fontWeight,
        ),
        "b": Style(
          fontSize: FontSize(22),
          color: color,
          fontWeight: fontWeight,
        ),
        "hr": Style(
          margin: Margins.symmetric(vertical: 0),
        ),
        "span": Style(
          fontSize: FontSize(26),
        ),
        "br": Style(
          lineHeight: const LineHeight(0.2, units: "px"),
          whiteSpace: WhiteSpace.normal,
        ),
      },
      onLinkTap: (url, context, attributes) {
        launchUrlString(url ?? '');
      },
    );
  }
}
