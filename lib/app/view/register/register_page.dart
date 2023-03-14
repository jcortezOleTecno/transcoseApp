import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/domain/model/enterprise.dart';
import 'package:vemare/app/domain/model/user_rol.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/register/bloc/register_cubit.dart';
import 'package:vemare/app/view/register/bloc/register_state.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage._();

  static const String route = '/register';

  static Widget create() {
    return BlocProvider(
      create: (context) => RegisterCubit(
        getIt.get<AuthRepository>(),
      ),
      child: const RegisterPage._(),
    );
  }

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isEmpresa = true;
  String type = 'Empresa';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return MyTapToHideKeyboard(
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          /*if (state.status == FormStatus.error) {
          }*/
          if (state.status == FormStatus.done) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Cuenta Creada')));
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
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
                  spacerM,
                  Visibility(
                    visible: state.status == FormStatus.error,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        state.msgError ??
                            'El correo electrónico o la contraseña son incorrectos. Inténtalo de nuevo.',
                        style: AppTextStyle.inputLabelStyle
                            .copyWith(color: AppColor.error),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  spacerL,
                  isEmpresa
                      ? MyInput(
                          label: 'Nombre de la empresa',
                          hintText: 'Nombre de la empresa',
                          required: true,
                          hasError: state.status == FormStatus.error,
                          onChanged: cubit.name,
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text('Nombre de la empresa *',
                                style: AppTextStyle.inputLabelStyle),
                            MyCustomDropdownButton<Enterprise>(
                              hint: 'Seleccione una empresa',
                              value: state.selectedEnterprise,
                              dropdownItems: state.enterprises
                                  .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item.name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: AppTextStyle.inputStyle,
                                        ),
                                      ))
                                  .toList(),
                              onChanged: cubit.enterprise,
                            ),
                            spacerM,
                          ],
                        ),
                  spacerS,
                  Visibility(
                    visible: isEmpresa,
                    replacement: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Rol profesional *',
                            style: AppTextStyle.inputLabelStyle),
                        MyCustomDropdownButton<UserRol>(
                          hint: 'Seleccione una opción',
                          value: state.selectedRol,
                          dropdownItems: state.roles
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item.name,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: AppTextStyle.inputStyle,
                                    ),
                                  ))
                              .toList(),
                          onChanged: cubit.rol,
                        ),
                        spacerM,
                      ],
                    ),
                    child: MyInput(
                      label: 'CIF',
                      hintText: 'Código de identificación fiscal',
                      required: true,
                      onChanged: cubit.cif,
                      hasError: state.status == FormStatus.error,
                    ),
                  ),
                  spacerS,
                  MyInput(
                    label: 'E-mail',
                    hintText: 'Dirección de correo electrónico',
                    required: true,
                    onChanged: cubit.email,
                    hasError: state.status == FormStatus.error,
                  ),
                  spacerS,
                  MyInput(
                    label: 'Teléfono',
                    hintText: 'Número de teléfono',
                    required: true,
                    onChanged: cubit.phone,
                    hasError: state.status == FormStatus.error,
                    inputType: TextInputType.phone,
                  ),
                  spacerS,
                  MyInput(
                    label: 'Nombre',
                    hintText: 'Nombre completo',
                    required: true,
                    onChanged: cubit.responsibleName,
                    hasError: state.status == FormStatus.error,
                  ),
                  spacerS,
                  MyInput(
                    label: 'Apellidos',
                    hintText: 'Apellidos completos',
                    required: true,
                    onChanged: cubit.responsibleLastName,
                    hasError: state.status == FormStatus.error,
                  ),
                  spacerS,
                  MyInput(
                    label: 'Contraseña',
                    hintText: 'Contraseña',
                    onChanged: cubit.password,
                    required: true,
                    hideInput: true,
                    hasError: state.status == FormStatus.error,
                  ),
                  spacerS,
                  MyInput(
                    label: 'Confirma tu contraseña',
                    hintText: 'Confirma tu contraseña',
                    required: true,
                    hideInput: true,
                    onChanged: cubit.confirmPassword,
                    hasError: state.status == FormStatus.error,
                  ),
                  CheckboxListTile(
                    onChanged: cubit.privacyPolicy,
                    value: state.privacyPolicy,
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
                    onChanged: cubit.receiveInformation,
                    value: state.receiveInformation,
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
                    text: 'Crear cuenta',
                    isLoading: state.status == FormStatus.loading,
                    disabled: isEmpresa
                        ? !state.isCompletedEnterprise
                        : !state.isCompletedEmployee,
                    onPressed: isEmpresa
                        ? cubit.registerEnterprise
                        : cubit.registerEmployee,
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
          );
        },
      ),
    );
  }
}
