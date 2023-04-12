import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/login/bloc/login_cubit.dart';
import 'package:vemare/app/view/login/bloc/login_state.dart';
import 'package:vemare/app/view/register/register_page.dart';
import 'package:vemare/app/view/shared/userbloc/user_cubit.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage._();

  static const String route = '/login';

  static Widget create({String? msgGoBack}) {
    return BlocProvider(
      create: (context) => LoginCubit(
        getIt.get<AuthRepository>(),
        LocalDataRepository(),
        context.read<UserCubit>(),
        msgGoBack,
      ),
      child: const LoginPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return MyTapToHideKeyboard(
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == FormStatus.done) {
              if (state.msgGoBack != null) {
                Navigator.of(context).pop();
              } else {
                Navigator.pushReplacementNamed(context, HomePage.route);
              }
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
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
                  spacerS,
                  Visibility(
                    visible: state.msgGoBack != null,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        state.msgGoBack ?? '',
                        style: AppTextStyle.defaultStyle.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: state.status == FormStatus.error,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        state.msgError ??
                            'El correo electrónico o la contraseña son incorrectos. Inténtalo de nuevo.',
                        style: AppTextStyle.inputLabelStyle
                            .copyWith(color: AppColor.error),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      return MyInput(
                        label: 'E-mail',
                        hintText: 'Escribe tu correo electrónico',
                        initialValue: state.initialEmail,
                        onChanged: cubit.email,
                        hasError: state.status == FormStatus.error,
                      );
                    },
                  ),
                  spacerS,
                  MyInput(
                    label: 'Contraseña',
                    hintText: 'Escribe tu contraseña',
                    hideInput: true,
                    initialValue: state.initialPassword,
                    onChanged: cubit.password,
                    hasError: state.status == FormStatus.error,
                  ),
                  MyButton(
                    onPressed: () {},
                    text: 'He olvidado mi contraseña',
                    variant: MyButtonVariant.containedSecondary,
                  ),
                  Visibility(
                    visible: state.msgGoBack == null,
                    replacement: const SizedBox(height: 50),
                    child: CheckboxListTile(
                      onChanged: cubit.rememberData,
                      value: state.rememberData,
                      title: const Text('Recordar mis datos'),
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColor.white,
                      contentPadding: EdgeInsets.zero,
                      checkColor: AppColor.blue,
                      checkboxShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                  spacerS,
                  MyButton(
                    onPressed: state.isComplete ? cubit.login : () {},
                    text: 'Iniciar sesión',
                    isLoading: state.status == FormStatus.loading,
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
                  Visibility(
                    visible: state.msgGoBack == null,
                    child: TextButton.icon(
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
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
