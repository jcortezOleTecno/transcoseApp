import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const String route = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isEmpresa = true;
  String type = 'Empresa';
  bool acceptTermins = false;
  bool receiveInfo = false;
  @override
  Widget build(BuildContext context) {
    return MyTapToHideKeyboard(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const MySpacer(height: 60),
              SvgPicture.asset(
                'assets/icons/logo_login.svg',
                width: 125,
              ),
              spacerS,
              const Text(
                'Crear una cuenta',
                textAlign: TextAlign.center,
                style: AppTextStyle.h1Style,
              ),
              spacerM,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: RadioGroup<String>.builder(
                  groupValue: type,
                  activeColor: AppColor.blue,
                  direction: Axis.horizontal,
                  horizontalAlignment: MainAxisAlignment.center,
                  textStyle: AppTextStyle.inputLabelStyle,
                  onChanged: (value) {
                    setState(() {
                      isEmpresa = !isEmpresa;
                      type = value!;
                    });
                  },
                  items: const ['Empresa', 'Empleado'],
                  itemBuilder: (value) => RadioButtonBuilder(
                    value,
                    textPosition: RadioButtonTextPosition.right,
                  ),
                ),
              ),
              spacerL,
              const MyInput(
                label: 'Nombre de la empresa',
                hintText: 'Nombre de la empresa',
                required: true,
              ),
              spacerS,
              Visibility(
                visible: isEmpresa,
                replacement: const MyInput(
                  label: 'Rol profesional',
                  hintText: 'Selecciona una opción',
                  required: true,
                ),
                child: const MyInput(
                  label: 'CIF',
                  hintText: 'Código de identificación fiscal',
                  required: true,
                ),
              ),
              spacerS,
              const MyInput(
                label: 'E-mail',
                hintText: 'Dirección de correo electrónico',
                required: true,
              ),
              spacerS,
              const MyInput(
                label: 'Teléfono',
                hintText: 'Número de teléfono',
                required: true,
              ),
              spacerS,
              const MyInput(
                label: 'Nombre',
                hintText: 'Nombre completo',
                required: true,
              ),
              spacerS,
              const MyInput(
                label: 'Apellidos',
                hintText: 'Apellidos completos',
                required: true,
              ),
              spacerS,
              const MyInput(
                label: 'Contraseña',
                hintText: 'Contraseña',
                required: true,
                hideInput: true,
              ),
              spacerS,
              const MyInput(
                label: 'Confirma tu contraseña',
                hintText: 'Confirma tu contraseña',
                required: true,
                hideInput: true,
              ),
              CheckboxListTile(
                onChanged: (value) => setState(() => acceptTermins = value!),
                value: acceptTermins,
                title: const Text(
                    'Estoy de acuerdo con la política de privacidad.'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: AppColor.white,
                contentPadding: EdgeInsets.zero,
                checkColor: AppColor.blue,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              CheckboxListTile(
                onChanged: (value) => setState(() => receiveInfo = value!),
                value: receiveInfo,
                title: const Text(
                    'Quiero recibir información sobre Grupo Vemare.'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: AppColor.white,
                contentPadding: EdgeInsets.zero,
                checkColor: AppColor.blue,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              spacerS,
              MyButton(
                onPressed: () {},
                text: 'Crear cuenta',
              ),
              spacerM,
              MyButton(
                onPressed: () => Navigator.of(context).pop(),
                text: 'Ya tengo cuenta',
                variant: MyButtonVariant.outlinedBold,
              ),
              spacerM,
              TextButton.icon(
                onPressed: () {},
                label: Image.asset(
                  'assets/icons/arrow_next.png',
                  scale: 2,
                ),
                icon: const Text(
                  'Continuar sin iniciar sesión',
                  style: AppTextStyle.linkStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
