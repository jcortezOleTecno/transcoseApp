import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:vemare/app/data/work_with_us_repository.dart';
import 'package:vemare/app/domain/utils/validators.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/work_with_us/bloc/work_with_us_cubit.dart';
import 'package:vemare/app/view/work_with_us/bloc/work_with_us_state.dart';
import 'package:vemare/config/service_locator.dart';

class WorkWithUsPage extends StatefulWidget {
  const WorkWithUsPage._();

  static const route = '/workWithUs';

  static Widget create() {
    return BlocProvider(
      create: (context) => WorkWithUsCubit(
        getIt.get<WorkWithUsRepository>(),
      ),
      child: const WorkWithUsPage._(),
    );
  }

  @override
  State<WorkWithUsPage> createState() => _WorkWithUsPageState();
}

class _WorkWithUsPageState extends State<WorkWithUsPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WorkWithUsCubit>();
    return BlocConsumer<WorkWithUsCubit, WorkWithUsState>(
      listener: (context, state) {
        if (state.status == FormStatus.done) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message ?? '')));
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return MyTapToHideKeyboard(
          child: Scaffold(
            body: MyBody(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyBackButton(),
                    const Image(
                      image: AssetImage('assets/imgs/trabaconnosotrosIMG.png'),
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Trabaja con nosotros',
                              style: AppTextStyle.h2Style,
                            ),
                            spacerS,
                            const Text(
                              '''Bienvenido a Grupo Vemare, compañía líder en la zona centro en la distribución de recambio de automóvil original y equipamiento para el taller. ¿Te gustaría trabajar con nosotros?
                                    
                                    Por favor, cumplimenta el siguiente formulario. En cuanto iniciemos un proceso de selección que se ajuste a tu perfil, nos pondremos en contacto contigo. Gracias.''',
                              style: AppTextStyle.defaultStyle,
                            ),
                            spacerS,
                            const Text(
                              'Formulario',
                              style: AppTextStyle.h3Style,
                            ),
                            spacerS,
                            MyInput(
                              label: 'Nombre',
                              hintText: 'Nombre de la empresa',
                              required: true,
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                              inputType: TextInputType.name,
                              onChanged: cubit.name,
                              hasError: state.status == FormStatus.error,
                            ),
                            spacerS,
                            MyInput(
                              label: 'Teléfono',
                              hintText: '123456789',
                              required: true,
                              textInputAction: TextInputAction.next,
                              inputType: TextInputType.phone,
                              onChanged: cubit.phone,
                              hasError: state.status == FormStatus.error,
                            ),
                            spacerS,
                            MyInput(
                              label: 'E-mail',
                              hintText: 'email@email.com',
                              inputType: TextInputType.emailAddress,
                              required: true,
                              onChanged: cubit.email,
                              hasError: state.status == FormStatus.error,
                              validator: validateEmail,
                            ),
                            spacerS,
                            if (state.opciones?.zones != null) ...[
                              const Text(
                                '¿En cual zona te gustaria trabajar?',
                                style: AppTextStyle.inputLabelStyle,
                              ),
                              MyCustomDropdownButton(
                                buttonWidth: double.infinity,
                                hint: 'Selecciona una zona',
                                hintStyle: AppTextStyle.inputStyle,
                                dropdownItems: state.opciones!.zones!
                                    .map((item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(item,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: AppTextStyle.inputStyle),
                                        ))
                                    .toList(),
                                value: state.zone,
                                onChanged: cubit.zone,
                              )
                            ],
                            if (state.opciones?.jobs != null) ...[
                              spacerL,
                              const Text(
                                '¿En cual puesto te gustaria trabajar?',
                                style: AppTextStyle.inputLabelStyle,
                              ),
                              MyCustomDropdownButton(
                                hint: 'Selecciona un puesto',
                                buttonWidth: double.infinity,
                                hintStyle: AppTextStyle.inputStyle,
                                dropdownItems: state.opciones!.jobs!
                                    .map((item) => DropdownMenuItem(
                                          value: item,
                                          child: Text(item,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: AppTextStyle.inputStyle),
                                        ))
                                    .toList(),
                                value: state.job,
                                onChanged: cubit.job,
                              ),
                              spacerL,
                            ],
                            if (state.doc != null) ...[
                              spacerS,
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      state.doc!.uri.pathSegments.last,
                                      style: AppTextStyle.defaultStyle,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: cubit.deleteDoc,
                                      icon: Image.asset(
                                        'assets/icons/Trash.png',
                                        scale: 2,
                                      ))
                                ],
                              )
                            ],
                            spacerS,
                            MyIconButton(
                              onPressed: cubit.attachFile,
                              text: 'Adjuntar CV',
                              icon: Image.asset(
                                'assets/icons/adjuntar.png',
                                scale: 2,
                              ),
                              variant: MyButtonVariant.outlinedBold,
                            ),
                            spacerS,
                            MyButton(
                              onPressed: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                if (_formKey.currentState!.validate()) {
                                  cubit.sendData();
                                }
                              },
                              text: 'Enviar',
                              width: double.infinity,
                              disabled: !state.isComplete,
                              isLoading: state.status == FormStatus.loading,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
