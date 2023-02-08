import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/register/register_page.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String route = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool acceptTermins = false;
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
              SvgPicture.asset('assets/icons/logo_login.svg', width: 125),
              spacerS,
              const Text(
                'Iniciar sesión',
                textAlign: TextAlign.center,
                style: AppTextStyle.h1Style,
              ),
              spacerM,
              const MyInput(
                  label: 'E-mail', hintText: 'Escribe tu correo electrónico'),
              spacerS,
              const MyInput(
                label: 'Contraseña',
                hintText: 'Escribe tu contraseña',
                hideInput: true,
              ),
              MyButton(
                onPressed: () {},
                text: 'He olvidado mi contraseña',
                variant: MyButtonVariant.containedSecondary,
              ),
              CheckboxListTile(
                onChanged: (value) => setState(() => acceptTermins = value!),
                value: acceptTermins,
                title: const Text('Recordar mis datos'),
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: AppColor.white,
                contentPadding: EdgeInsets.zero,
                checkColor: AppColor.blue,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              spacerS,
              MyButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  HomePage.route,
                  arguments: true,
                ),
                text: 'Iniciar sesión',
              ),
              spacerS,
              MyButton(
                onPressed: () => Navigator.pushNamed(
                  context,
                  RegisterPage.route,
                ),
                text: 'Aún no tengo cuenta',
                variant: MyButtonVariant.outlinedBold,
              ),
              spacerS,
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    HomePage.route,
                    arguments: false,
                  );
                },
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
