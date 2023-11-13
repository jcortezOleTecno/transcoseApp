import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/claims/providers/claims_provider.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class ClaimsPage extends StatelessWidget {
  const ClaimsPage({
    Key? key,
  }) : super(key: key);

  static const route = '/claims';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: ChangeNotifierProvider(
            create: (context1) => ClaimsProvider(),
            child: Consumer<ClaimsProvider>(
                builder: (context2, provider, child){

                  TextStyle styleSub = AppTextStyle.h12Style.copyWith(
                    fontWeight: FontWeight.normal,fontSize: 20
                  );

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Canal de denuncias', style: AppTextStyle.h1Style),
                              spacerS,
                              Text('Honestidad y compromiso son valores destacados de Vemare y que impulsan la creación de este canal de denuncias, con compromiso por ser una empresa mejor, no solo con foco en las personas sino además en la sociedad, clientes, proveedores y accionistas.',
                                  style: styleSub),
                              spacerS,
                              Text('A través de este canal puedes comunicar conductas irregulares o actos ilícitos que se refieran o afecten al ámbito de actividad de Vemare.',
                                  style: styleSub),
                              spacerS,
                              Text('Puede realizar su denuncia a través del formulario de denuncias a continuación.',
                                  style: styleSub),
                              spacerL,
                              Text('Formulario de denuncias', style: AppTextStyle.h1Style.copyWith(
                                fontSize: 24,
                              )),
                              spacerS,
                              Text('Indique, por favor, si desea realizar una nueva denuncia o hacer seguimiento de una denuncia anterior:',
                                  style: styleSub),
                              spacerXs,
                              formTypeProcess(provider: provider),
                              spacerXs,
                              formTypeDenuncia(provider: provider),
                              spacerXs,
                              formDataPersonal(provider: provider),
                              spacerXs,
                              formDocuments(provider: provider),
                              spacerL,
                              MyButton(
                                onPressed: () {
                                  FocusScope.of(context).requestFocus(FocusNode());

                                },
                                text: 'Enviar denuncia ',
                                width: double.infinity,
                                disabled: false,
                                isLoading: false,
                                childCenter: SizedBox(
                                  width: 25,height: 25,
                                  child: Image.asset('assets/icons/Mail.png', color: AppColor.white,),
                                ),
                              ),
                              spacerL,
                            ],
                          ),
                        ),
                        const Footer(),
                      ],
                    ),
                  );
                }
            )
        ),
      ),
    );
  }

  Widget formTypeProcess({required ClaimsProvider provider}){

    List<String> listSt = ['Nueva denuncia'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacerM,
        const Text('Tipo de procedimiento',style: AppTextStyle.inputLabelStyle,),
        spacerS,
        MyCustomDropdownButton<String>(
          hint: 'Nueva denuncia',
          dropdownItems: listSt.map((item) => DropdownMenuItem(
            value: item,
            child: Text(item,overflow: TextOverflow.ellipsis,maxLines: 1,
              style: AppTextStyle.inputStyle,
            ),
          )).toList(),
          buttonWidth: double.infinity,
          value: provider.typeProcess,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget formTypeDenuncia({required ClaimsProvider provider}){

    List<String> listSt = ['Identificado'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacerM,
        const Text('Tipo de denuncia*',style: AppTextStyle.inputLabelStyle,),
        spacerS,
        MyCustomDropdownButton<String>(
          hint: 'Identificado',
          dropdownItems: listSt.map((item) => DropdownMenuItem(
            value: item,
            child: Text(item,overflow: TextOverflow.ellipsis,maxLines: 1,
              style: AppTextStyle.inputStyle,
            ),
          )).toList(),
          buttonWidth: double.infinity,
          value: provider.typeDenuncia,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget formDataPersonal({required ClaimsProvider provider}){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacerM,
        const Text('Nombre*',style: AppTextStyle.inputLabelStyle,),
        MyInput(
          key: const Key('Nombre*'),
          label: '',
          hintText: 'Escriba aquí',
          onChanged: (value){},
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          initialValue: '',
          readOnly: false,
          //variant: MyInputVariant.backgroundBlue,
        ),
        const Text('Apellidos*',style: AppTextStyle.inputLabelStyle,),
        MyInput(
          key: const Key('Apellidos*'),
          label: '',
          hintText: 'Escriba aquí',
          onChanged: (value){},
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          initialValue: '',
          readOnly: false,
          //variant: MyInputVariant.backgroundBlue,
        ),
        const Text('Observaciones*',style: AppTextStyle.inputLabelStyle,),
        MyInput(
          key: const Key('Observaciones*'),
          label: '',
          hintText: 'Escriba aquí',
          onChanged: (value){},
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          initialValue: '',
          readOnly: false,
          //variant: MyInputVariant.backgroundBlue,
        ),
      ],
    );
  }

  Widget formDocuments({required ClaimsProvider provider}){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacerM,
        const Text('Si dispone de un documento o archivo que asista a su comunicación, puede cargarlos a continuación:',
          style: AppTextStyle.inputLabelStyle,),
        MyInput(
          key: const Key('Selecciona un archivo*'),
          label: '',
          hintText: 'Selecciona un archivo',
          onChanged: (value){},
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          initialValue: '',
          readOnly: true,
          onPressed: (){
            provider.attachFile();
          },
          //variant: MyInputVariant.backgroundBlue,
        ),
        MyIconButton(
          onPressed: (){
            provider.attachFile();
          },
          text: 'Adjuntar CV',
          icon: Image.asset(
            'assets/icons/adjuntar.png',
            scale: 2,
          ),
          variant: MyButtonVariant.outlinedBold,
        ),
      ],
    );
  }




}