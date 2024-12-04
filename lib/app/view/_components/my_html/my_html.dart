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
    this.lineHeight,
  }) : super(key: key);

  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? bodyFontSize;
  final int? maxLines;
  final double? lineHeight;

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
            backgroundColor: Colors.transparent
        ),
        "strong": Style(
            fontSize: FontSize(bodyFontSize ?? 24),
            color: color,
            fontWeight: fontWeight,
            maxLines: maxLines,
            backgroundColor: Colors.transparent
        ),
        "ul": Style(
            fontSize: FontSize(bodyFontSize ?? 24),
            color: color,
            fontWeight: fontWeight,
            maxLines: maxLines,
            padding: HtmlPaddings.all(0),
            backgroundColor: Colors.transparent
        ),
        "body": Style(
            fontSize: FontSize(bodyFontSize ?? 22),
            color: color,
            fontWeight: fontWeight,
            maxLines: maxLines,
            backgroundColor: Colors.transparent
        ),
        "li": Style(
            fontSize: FontSize(bodyFontSize ?? 24),
            color: color,
            fontWeight: fontWeight,
            maxLines: maxLines,
            lineHeight: LineHeight.normal,
            listStylePosition: ListStylePosition.inside,
            display: Display.inline,
            padding: HtmlPaddings.all(0),
            backgroundColor: Colors.transparent
        ),
        "b": Style(
            fontSize: FontSize(bodyFontSize ?? 22),
            color: color,
            fontWeight: fontWeight,
            maxLines: maxLines,
            backgroundColor: Colors.transparent
        ),
        "hr": Style(
            margin: Margins.symmetric(vertical: 0),
            maxLines: maxLines,
            backgroundColor: Colors.transparent
        ),
        "span": Style(
            fontSize: FontSize(bodyFontSize ?? 26),
            maxLines: maxLines,
            backgroundColor: Colors.transparent
        ),
        "br": Style(
            lineHeight: const LineHeight(0.2, units: "px"),
            whiteSpace: WhiteSpace.normal,
            maxLines: maxLines,
            backgroundColor: Colors.transparent
        ),
      },
      onLinkTap: (url, context, attributes) {
        launchUrlString(url ?? '');
      },
    );
  }
}
