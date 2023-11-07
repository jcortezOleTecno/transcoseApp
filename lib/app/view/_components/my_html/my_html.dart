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
    this.maxLines,
  }) : super(key: key);

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? bodyFontSize;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: text,
      style: {
        // tables will have the below background color
        "p": Style(
          fontSize: FontSize(bodyFontSize ?? 24),
          color: color,
          fontWeight: fontWeight,
          maxLines: maxLines,
        ),
        "body": Style(
          fontSize: FontSize(bodyFontSize ?? 22),
          color: color,
          fontWeight: fontWeight,
          maxLines: maxLines,
        ),
        "li": Style(
          fontSize: FontSize(bodyFontSize ?? 26),
          color: color,
          fontWeight: fontWeight,
          maxLines: maxLines,
        ),
        "b": Style(
          fontSize: FontSize(bodyFontSize ?? 22),
          color: color,
          fontWeight: fontWeight,
          maxLines: maxLines,
        ),
        "hr": Style(
          margin: Margins.symmetric(vertical: 0),
          maxLines: maxLines,
        ),
        "span": Style(
          fontSize: FontSize(bodyFontSize ?? 26),
          maxLines: maxLines,
        ),
        "br": Style(
          lineHeight: const LineHeight(0.2, units: "px"),
          whiteSpace: WhiteSpace.normal,
          maxLines: maxLines,
        ),
      },
      onLinkTap: (url, context, attributes) {
        launchUrlString(url ?? '');
      },
    );
  }
}
