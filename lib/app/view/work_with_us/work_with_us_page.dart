import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/work_with_us_repository.dart';
import 'package:vemare/app/domain/model/work_with_us.dart';
import 'package:vemare/app/domain/utils/validators.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/domain/widgets_utils/web_view_privacy_policies.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/work_with_us/bloc/work_with_us_cubit.dart';
import 'package:vemare/app/view/work_with_us/bloc/work_with_us_state.dart';
import 'package:vemare/app/view/work_with_us/provider/work_with_us_provider.dart';
import 'package:vemare/config/service_locator.dart';

import '../theme/color.dart';

class WorkWithUsPage extends StatefulWidget {
  const WorkWithUsPage._();

  static const route = '/workWithUs';

  static Widget create(WorkWithUs workWithUs) {
    return BlocProvider(
      create: (context) => WorkWithUsCubit(
        getIt.get<WorkWithUsRepository>(),
        workWithUs,
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

    return ChangeNotifierProvider(
        create: (context1) => WorkWithUsProvider(),
        child: Consumer<WorkWithUsProvider>(
            builder: (context2, provider, child){
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
                      body: BlocBuilder<WorkWithUsCubit, WorkWithUsState>(
                        builder: (context, state) {

                          bool isCheck = !state.isComplete;
                          if(!isCheck){
                            if(provider.checkData){
                              isCheck = false;
                            }else{
                              isCheck = true;
                            }
                          }

                          return MyBody(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MyBackButton(),
                                  MyNetworkImage(
                                    image: state.workWithUs?.image ?? '',
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
                                          Text(
                                            state.workWithUs?.title ?? '',
                                            style: AppTextStyle.h2Style,
                                          ),
                                          spacerS,
                                          MyHtml(
                                              text: state.workWithUs?.description ?? ''),
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
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style:
                                                    AppTextStyle.inputStyle),
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
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style:
                                                    AppTextStyle.inputStyle),
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
                                          spacerM,
                                          ProtectionPolicy(
                                            onChange: cubit.acceptPolicy,
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
                                            disabled: isCheck,
                                            isLoading: state.status == FormStatus.loading,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            }
        )
    );



  }
}

class ProtectionPolicy extends StatefulWidget {
  const ProtectionPolicy({
    required this.onChange,
    Key? key,
  }) : super(key: key);

  final Function(bool) onChange;

  @override
  State<ProtectionPolicy> createState() => _ProtectionPolicyState();
}

class _ProtectionPolicyState extends State<ProtectionPolicy> {
  bool accept = false;

  @override
  Widget build(BuildContext context) {

    WorkWithUsProvider workWithUsProvider = Provider.of<WorkWithUsProvider>(context);

    return Column(
      children: [
        const Text(
          'De conformidad con el REGLAMENTO (UE) 2016/679 DEL PARLAMENTO EUROPEO, le informamos que los datos y documentos que usted nos proporciona a través de los formularios de solicitud de empleo y a través de su currículum vitae, serán utilizados para poder participar en la selección del puesto de trabajo que usted nos solicita, sin que puedan ser utilizados para otra finalidad. Estos datos serán incorporados en un fichero cuyo responsable es VEMARE, S.L.Si no fuera seleccionado en este proceso, mantendremos sus datos personales con posterioridad, durante dos años, a fin de poder utilizarlos en futuros procesos de selección.En cualquier momento, usted puede ejercer los derechos de acceso, rectificación, supresión y oposición, limitar el tratamiento de sus datos, o directamente oponerse al tratamiento, o ejercer el derecho a la portabilidad de los mismos. Todo ello, mediante escrito, acompañado de copia de documento oficial que le identifique, dirigido al RESPONSABLE del fichero. En caso de disconformidad con el tratamiento, también tiene derecho a presentar una reclamación ante la Agencia Española de Protección de Datos.',
          textAlign: TextAlign.center,
        ),
        CheckboxListTile(
          onChanged: (value) {
            setState(() {
              accept = value!;
            });
            widget.onChange(value!);
          },
          value: accept,
          title: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'Estoy de acuerdo con la',
                ),
                TextSpan(
                  text: ' política de protección de alto.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: AppColor.white,
          contentPadding: EdgeInsets.zero,
          checkColor: AppColor.blue,
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        const SizedBox(height: 10),
        const Text(
          'Protección de datos personales',
          style: AppTextStyle.h12StyleNeu40W700,
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: double.infinity,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Utilizaremos sus datos para participar en procesos de selección. Para más información sobre el tratamiento y sus derechos, consulte la ',
                style: AppTextStyle.checkStyle,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Política de Privacidad.',
                    style: AppTextStyle.checkStyleBlue,
                    recognizer: TapGestureRecognizer()..onTap = (){
                      Navigator.push(context, MaterialPageRoute(builder:
                          (BuildContext context) => const WebViewPrivacyPolicies()));
                    },
                  ),
                ]
            ),
          ),
        ),
        const SizedBox(height: 10),
        CheckboxListTile(
          onChanged: (value) { workWithUsProvider.checkData = value!; },
          value: workWithUsProvider.checkData,
          title: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'Acepto el tratamiento de datos para gestionar la cuenta de usuario.',
                ),
              ],
            ),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: AppColor.white,
          contentPadding: EdgeInsets.zero,
          checkColor: AppColor.blue,
          checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
