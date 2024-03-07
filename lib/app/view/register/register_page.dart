import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/_base_api_url.dart';
import 'package:vemare/app/data/auth_repository.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/domain/widgets_utils/web_view_global.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/home/home_page.dart';
import 'package:vemare/app/view/register/bloc/register_cubit.dart';
import 'package:vemare/app/view/register/bloc/register_state.dart';
import 'package:vemare/app/view/register/providers/register_provider.dart';
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
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();
  TextEditingController controllerPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return ChangeNotifierProvider(
      create: (context1) => RegisterProvider(),
        child: Consumer<RegisterProvider>(
            builder: (context2, provider, child){


              return MyTapToHideKeyboard(
                child: BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state.status == FormStatus.done) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text('Cuenta Creada')));
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {

                    bool isCheck = !state.isCompletedEnterprise;
                    if(!isCheck){
                      if(provider.checkData){
                        isCheck = false;
                      }else{
                        isCheck = true;
                      }
                    }

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
                            spacerM,
                            MyInput(
                              label: 'Nombre de la empresa',
                              hintText: 'Nombre de la empresa',
                              required: true,
                              hasError: state.status == FormStatus.error,
                              onChanged: cubit.name,
                            ),
                            MyInput(
                              label: 'CIF',
                              hintText: 'Código de identificación fiscal',
                              required: true,
                              onChanged: cubit.cif,
                              hasError: state.status == FormStatus.error,
                            ),
                            MyInput(
                              label: 'Nombre',
                              hintText: 'Nombre completo',
                              required: true,
                              onChanged: cubit.responsibleName,
                              hasError: state.status == FormStatus.error,
                            ),
                            MyInput(
                              label: 'Apellidos',
                              hintText: 'Apellidos completos',
                              required: true,
                              onChanged: cubit.responsibleLastName,
                              hasError: state.status == FormStatus.error,
                            ),
                            MyInput(
                              label: 'E-mail',
                              hintText: 'Dirección de correo electrónico',
                              required: true,
                              onChanged: cubit.email,
                              hasError: state.status == FormStatus.error,
                            ),
                            MyInput(
                              label: 'Teléfono móvil',
                              hintText: 'Número de teléfono móvil (6XX XXX XXX)',
                              required: true,
                              controller: controllerPhone,
                              hasError: state.status == FormStatus.error,
                              inputType: TextInputType.phone,
                              inputFormatters: [
                                MaskTextInputFormatter(mask: "### ### ###")
                              ],
                            ),
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
                            const Text(
                              'Protección de datos personales',
                              style: AppTextStyle.h12StyleNeu40W700,
                            ),
                            const SizedBox(height: 2),
                            SizedBox(
                              width: double.infinity,
                              child: RichText(
                                text: TextSpan(
                                    text: 'Utilizaremos sus datos para gestionar sus compras online en base a las condiciones generales de contratación, gestionar los servicios prestados y realizar encuestas de satisfacción. Para más información sobre el tratamiento y sus derechos, consulte la ',
                                    style: AppTextStyle.h12StyleNeu40,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Política de Privacidad.',
                                        style: AppTextStyle.h12StyleBlue,
                                        recognizer: TapGestureRecognizer()..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(builder:
                                              (BuildContext context) => WebViewGlobal(url: '$BASE_API_URL/politicas-de-privacidad',backActive: true,)));
                                        },
                                      ),
                                    ]
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01,),
                              child: CheckboxListTile(
                                onChanged: (value){ provider.checkData = value!; },
                                value: provider.checkData,
                                title: const Text(
                                    'Acepto el tratamiento de datos para gestionar la cuenta de usuario.'),
                                controlAffinity: ListTileControlAffinity.leading,
                                activeColor: AppColor.white,
                                contentPadding: EdgeInsets.zero,
                                checkColor: AppColor.blue,
                                checkboxShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ),
                            SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: state.privacyPolicy,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)),
                                      onChanged: cubit.privacyPolicy,
                                      activeColor: AppColor.white,
                                      checkColor: AppColor.blue,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.03,),
                                    Expanded(
                                      child: RichText(
                                        text: TextSpan(
                                            text: 'Estoy de acuerdo con la ',
                                            style: AppTextStyle.checkStyle,
                                            recognizer: TapGestureRecognizer()..onTap = (){
                                              cubit.privacyPolicy;
                                            },
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: 'política de Privacidad.',
                                                style: AppTextStyle.checkStyleBlue,
                                                recognizer: TapGestureRecognizer()..onTap = (){
                                                  Navigator.push(context, MaterialPageRoute(builder:
                                                      (BuildContext context) => WebViewGlobal(url: '$BASE_API_URL/politicas-de-privacidad',backActive: true,)));
                                                },
                                              ),
                                            ]
                                        ),
                                      ),
                                    )
                                  ],
                                )
                            ),
                            Container(
                              margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01,),
                              child: CheckboxListTile(
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
                            ),
                            spacerS,
                            MyButton(
                              text: 'Crear cuenta',
                              isLoading: state.status == FormStatus.loading,
                              disabled: isCheck,
                              onPressed: (){
                                cubit.phone(controllerPhone.text);
                                cubit.registerEnterprise();
                              },
                            ),
                            spacerM,
                            MyButton(
                              onPressed: () => Navigator.of(context).pop(),
                              text: 'Ya tengo cuenta',
                              variant: MyButtonVariant.outlinedBold,
                            ),
                            spacerM,
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
                    );
                  },
                ),
              );
            }
        )
    );
  }
}
