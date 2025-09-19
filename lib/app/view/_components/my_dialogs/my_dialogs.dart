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
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(child: Container(),),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop(false);
                        },
                        child: Icon(CupertinoIcons.xmark,size: 16,color: AppColor.neutral,),
                      )
                    ],
                  ),
                ),
                Text(
                  'Protección de Datos',
                  style: AppTextStyle.h1Style,
                ),
                spacerM,
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    text: 'A través del uso de este chat ', // Parte inicial
                    style: AppTextStyle.defaultStyle.copyWith(fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'AD TRANSCOSE SOLUCIONES', // Parte en negrita y roja
                        style: AppTextStyle.defaultStyle.copyWith(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' tratará sus datos con la finalidad de contestar a sus consultas, dudas o reclamos.\n\nPuede ejercer sus derechos de acceso, rectificación, supresión, portabilidad, limitación y oposición, como le informamos en nuestras ', // Parte final
                        style: AppTextStyle.defaultStyle.copyWith(fontSize: 16),
                      ),
                      TextSpan(
                        text: 'Política de Privacidad', // Parte final
                        style: AppTextStyle.defaultStyle.copyWith(fontSize: 16,color: AppColor.blue300,fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, MaterialPageRoute(builder:
                                (BuildContext context) => WebViewGlobal(url: '$BASE_API_URL/politicas-de-privacidad')));
                          },
                      ),

                    ],
                  ),
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
                spacerM,
                MyButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  text: 'Continuar a WhatsApp',
                  width: double.infinity,
                )
              ],
            ),
          ),
        );
      });
}
