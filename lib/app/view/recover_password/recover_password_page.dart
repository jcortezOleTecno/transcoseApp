import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/domain/utils/validators.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';

import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/recover_password_cubit.dart';
import 'bloc/recover_password_state.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage._();
  static const route = '/recover_password_page';

  static Widget create() {
    return BlocProvider(
      create: (context) => RecoverPasswordCubit(
        getIt<AuthRepository>(),
      ),
      child: const RecoverPasswordPage._(),
    );
  }

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RecoverPasswordCubit>();
    return BlocBuilder<RecoverPasswordCubit, RecoverPasswordState>(
      // listener: (context, state) {
      //   if (state.status == FormStatus.done) {
      //     ScaffoldMessenger.of(context)
      //         .showSnackBar(SnackBar(
      //             content: Text(
      //           state.successMessage ?? '',
      //           style: AppTextStyle.defaultStyle,
      //           textAlign: TextAlign.justify,
      //         )))
      //         .closed
      //         .then((_) => Navigator.pop(context));
      //   }
      // },
      builder: (context, state) {
        return MyTapToHideKeyboard(
          child: Scaffold(
            body: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MySpacer(height: 120),
                          Center(
                              child: SvgPicture.asset(
                                  'assets/icons/logo_login.svg',
                                  width: 150)),
                          spacerM,
                          const Text(
                            '¿Olvidaste tu contraseña? No hay problema. Solo indícanos tu dirección de correo electrónico y te enviaremos un enlace para restablecerla, el cual te permitirá elegir una nueva.',
                            style: AppTextStyle.defaultStyle,
                            textAlign: TextAlign.justify,
                          ),
                          spacerM,
                          if (state.status == FormStatus.error) ...[
                            Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.error300),
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.error200,
                                ),
                                child: Text(
                                  state.errorMessage ?? '',
                                  textAlign: TextAlign.justify,
                                  style: AppTextStyle.defaultStyle,
                                )),
                            spacerM
                          ],
                          if (state.status == FormStatus.done) ...[
                            Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: AppColor.success300),
                                  color: AppColor.success200,
                                ),
                                child: Text(
                                  state.successMessage ?? '',
                                  textAlign: TextAlign.justify,
                                  style: AppTextStyle.defaultStyle,
                                )),
                            spacerM
                          ],
                          MyInput(
                            label: 'E-mail',
                            hintText: 'Escribe tu e-mail',
                            inputType: TextInputType.emailAddress,
                            onChanged: cubit.email,
                            validator: validateEmail,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: MyButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            cubit.recoverPassword();
                          }
                        },
                        text: 'ENVIAR LINK',
                        isLoading: state.status == FormStatus.loading,
                        width: double.infinity),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
