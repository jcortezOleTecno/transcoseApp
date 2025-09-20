import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/domain/widgets_utils/web_view_global.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

Future<bool?> promotionDialog(
  BuildContext context, {
  required String title,
  required String content,
}) async {
  return await showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                spacerM,
                Text(
                  title,
                  style: AppTextStyle.h1Style,
                ),
                spacerM,
                Text(
                  content,
                  style: AppTextStyle.defaultStyle,
                  textAlign: TextAlign.center,
                ),
                spacerM,
                MyButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  text: 'Aceptar',
                  width: double.infinity,
                )
              ],
            ),
          ),
        );
      });
}

Future<bool?> myDialogWhatsapp(BuildContext context) async {

  Size size = MediaQuery.of(context).size;

  return await showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // SizedBox(
                //   width: double.infinity,
                //   child: Row(
                //     children: [
                //       Expanded(child: Container(),),
                //       InkWell(
                //         onTap: (){
                //           Navigator.of(context).pop(false);
                //         },
                //         child: Icon(CupertinoIcons.xmark,size: 16,color: AppColor.neutral,),
                //       )
                //     ],
                //   ),
                // ),
                SizedBox(height: 15,),
                SizedBox(
                  width: size.width,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.blue100,
                      ),
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        'assets/icons/advert.png',
                        color: AppColor.primaryBlue,
                        scale: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Text(
                  'Protección de Datos',
                  style: AppTextStyle.h1Style.copyWith(fontSize: 28,fontWeight: FontWeight.w800),
                ),
                spacerM,
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'Al usar este chat, AD Transcose Soluciones tratará sus datos únicamente para atender sus consultas, dudas o reclamaciones.\n\n', // Parte inicial
                    style: AppTextStyle.defaultStyle.copyWith(fontSize: 15),
                    children: <TextSpan>[
                      // TextSpan(
                      //   text: 'AD TRANSCOSE SOLUCIONES', // Parte en negrita y roja
                      //   style: AppTextStyle.defaultStyle.copyWith(fontSize: 16,fontWeight: FontWeight.bold),
                      // ),
                      TextSpan(
                        text: 'Puede ejercer en cualquier momento sus derechos de acceso, rectificación, supresión, portabilidad, limitación u oposición, tal y como se detalla en nuestra ', // Parte final
                        style: AppTextStyle.defaultStyle.copyWith(fontSize: 15),
                      ),
                      TextSpan(
                        text: 'Política de Privacidad.\n', // Parte final
                        style: AppTextStyle.defaultStyle.copyWith(fontSize: 15,color: AppColor.blue,fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, MaterialPageRoute(builder:
                                (BuildContext context) => WebViewGlobal(url: '$BASE_API_URL/politicas-de-privacidad')));
                          },
                      ),

                    ],
                  ),
                ),
                spacerS,
                MyButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  text: 'Aceptar',
                  width: double.infinity,
                ),
                spacerM,
                MyButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  text: 'Cancelar',
                  width: double.infinity,
                  variant: MyButtonVariant.outlinedBold,
                ),
                spacerS,
              ],
            ),
          ),
        );
      });
}
