import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MySingleCardRegistered extends StatelessWidget {
  const MySingleCardRegistered({
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
    required this.type,
    this.cantRegister = 0,
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
  final int type;
  final int cantRegister;

  @override
  Widget build(BuildContext context) {

    String description = content;
    if(content.split('</p><p>').length > 1){
      description = '${content.split('</p><p>')[0]}</p>';
    }

    Widget widgetType = Container();
    if(type != 0){
      widgetType = containerType1();
    }


    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: heightD,
        child: Card(
            margin: margin ?? const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Padding(
              padding: EdgeInsets.only(top: type != 0 ? 0 : 10,bottom: 10,left: 5),
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
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              if (iconFormation != null)...[
                                Container(
                                  margin: type != 0 ? const EdgeInsets.only(left: 5,top: 30) : const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.blue100,
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: iconFormation,
                                ),
                              ],
                              Expanded(child: Container(),),
                              widgetType
                            ],
                          ),
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

  Widget containerType1(){

    String title = '';
    String complement = cantRegister > 1 ? 'inscripciones' : 'inscripcion';
    if(type == 1){
      title = '$cantRegister  $complement   ';
    }
    if(type == 2){
      title = 'Inscrito  ';
    }


    return Container(
      padding: const EdgeInsets.only(right: 20.0,left: 20,top: 5,bottom: 5),
      decoration: const BoxDecoration(
        color: AppColor.primary,
        borderRadius:  BorderRadius.only(
          topLeft: Radius.circular(30),bottomLeft: Radius.circular(30),
          topRight: Radius.circular(0.0),bottomRight: Radius.circular(0.0)
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title,style: styleTitle.copyWith(color: AppColor.white,fontSize: 18)),
          SizedBox(
            height: 25,width: 25,
            child: Image.asset(
              'assets/icons/check_promo.png',color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
