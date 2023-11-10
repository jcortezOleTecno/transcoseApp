import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/text_style.dart';

Future<bool?> successDialog(
  BuildContext context, {
  required String title,
  required String content,
}) async {
  return await showDialog<bool>(
      context: context,
      builder: (context) {
        return Dialog(
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                spacerM,
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white30),
                  child: Image.asset(
                    'assets/icons/check_success.png',
                    scale: 1,
                  ),
                ),
                spacerM,
                Text(
                  title,
                  style: AppTextStyle.h1Style.copyWith(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                spacerM,
                Text(
                  content,
                  style: AppTextStyle.defaultStyle.copyWith(fontSize: 18),
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
