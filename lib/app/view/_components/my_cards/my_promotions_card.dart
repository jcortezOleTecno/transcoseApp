import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MySingleCard extends StatelessWidget {
  const MySingleCard({
    this.icon,
    required this.title,
    required this.content,
    this.margin,
    this.isHtml = true,
    this.iconFormation,
    this.onTap,
    this.maxLines,
    this.styleTitle = AppTextStyle.linkStyle,
    this.heightD,
    Key? key,
  }) : super(key: key);

  final EdgeInsetsGeometry? margin;
  final void Function()? onTap;
  final Widget? icon;
  final Widget? iconFormation;
  final String title;
  final String content;
  final bool isHtml;
  final int? maxLines;
  final TextStyle styleTitle;
  final double? heightD;

  @override
  Widget build(BuildContext context) {

    String description = content;
    if(content.split('</p><p>').length > 1){
      description = '${content.split('</p><p>')[0]}</p>';
    }


    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: heightD,
        child: Card(
            margin: margin ?? const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (icon != null)
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.blue100,
                      ),
                      height: 40,
                      width: 40,
                      child: icon,
                    ),
                  spacerS,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (iconFormation != null)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.blue100,
                            ),
                            height: 40,
                            width: 40,
                            child: iconFormation,
                          ),
                        spacerXs,spacerXs,
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text(
                            title,
                            style: styleTitle
                          ),
                        ),
                        isHtml
                            ? MyHtml(text: description, bodyFontSize: 18,maxLines: maxLines,)
                            : Text(
                                description,
                                style: AppTextStyle.contentCard,
                                maxLines: maxLines,
                              )
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
