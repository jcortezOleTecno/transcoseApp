import 'dart:convert';
import 'dart:developer';
// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signature/signature.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

Future<dynamic> myDialogSignature(BuildContext context,
    {required Future<void> Function(String name, String nif, String signature)
        sign}) {
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          insetPadding: const EdgeInsets.all(15),
          alignment: Alignment.bottomCenter,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: MySignature(sign),
        );
      });
}

class MySignature extends StatefulWidget {
  const MySignature(this.sign, {super.key});

  final Future<void> Function(String name, String nif, String signature) sign;

  @override
  State<MySignature> createState() => _MySignatureState();
}

class _MySignatureState extends State<MySignature> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 1.5,
    penColor: Colors.blue[900]!,
    exportBackgroundColor: Colors.white,
    exportPenColor: AppColor.primaryBlue,
  );

  String name = '';
  String nif = '';
  Uint8List? signature;
  bool signIsEmpty = true;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        signIsEmpty = _controller.value.isEmpty;
      });
    });
  }

  @override
  void dispose() {
    // IMPORTANT to dispose of the controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyTapToHideKeyboard(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: AppColor.primaryBlue,
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(
                  'Firma aquí:',
                  style: AppTextStyle.titleCard.copyWith(color: Colors.white),
                ),
              ),
            ),
            //SIGNATURE CANVAS
            Signature(
              key: const Key('signature'),
              controller: _controller,
              height: 250,
              backgroundColor: Colors.grey[100]!,
            ),
            //OK AND CLEAR BUTTONS

            _buttons(),
            spacerS,
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  MyInput(
                    label: 'Nombre',
                    textCapitalization: TextCapitalization.sentences,
                    textInputAction: TextInputAction.next,
                    inputType: TextInputType.name,
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  MyInput(
                    label: 'NIF',
                    textInputAction: TextInputAction.next,
                    inputType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        nif = value;
                      });
                    },
                  ),
                  spacerS,
                  MyButton(
                    onPressed: () async {
                      setState(() {
                        loading = true;
                      });

                      FocusScope.of(context).requestFocus(FocusNode());

                      signature = await _controller.toPngBytes();
                      await widget.sign(name, nif,
                          'data:image/png;base64,${base64Encode(signature!.toList())}');
                      setState(() {
                        loading = false;
                      });
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                    },
                    disabled: (name == '' || nif == '') || signIsEmpty,
                    text: 'Firmar',
                    variant: MyButtonVariant.outlinedBold,
                    width: double.infinity,
                    isLoading: loading,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buttons() {
    return Container(
      height: 50,
      decoration: const BoxDecoration(color: AppColor.primaryBlue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          //SHOW EXPORTED IMAGE IN NEW ROUTE

          IconButton(
            icon: const Icon(Icons.undo),
            color: Colors.white,
            onPressed: () {
              setState(() => _controller.undo());
            },
            tooltip: 'Undo',
            splashRadius: 0.1,
          ),
          IconButton(
            icon: const Icon(Icons.redo),
            color: Colors.white,
            splashRadius: 0.1,
            onPressed: () {
              setState(() => _controller.redo());
            },
            tooltip: 'Redo',
          ),
          //CLEAR CANVAS
          IconButton(
            key: const Key('clear'),
            icon: const Icon(Icons.clear),
            splashRadius: 0.1,
            color: AppColor.error500,
            onPressed: () {
              setState(() => _controller.clear());
            },
            tooltip: 'Clear',
          ),
        ],
      ),
    );
  }
}
