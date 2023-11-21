// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/claims_repository.dart';
import 'package:vemare/app/domain/model/complaints_categories_model.dart';
import 'package:vemare/app/domain/model/complaints_model.dart';
import 'package:vemare/app/domain/utils/value_validators.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/claims/providers/claims_provider.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class ClaimsPage extends StatelessWidget {
  const ClaimsPage({
    Key? key,
  }) : super(key: key);

  static const route = '/claims';

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      body: MyBody(
        child: ChangeNotifierProvider(
            create: (context1) => ClaimsProvider(getIt.get<ClaimsRepository>()),
            child: Consumer<ClaimsProvider>(
                builder: (context2, provider, child){

                  TextStyle styleSub = AppTextStyle.h12Style.copyWith(
                    fontWeight: FontWeight.normal,fontSize: 20
                  );


                  return SingleChildScrollView(
                    controller: scrollController,
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
                              if(provider.loadData)...[
                                const MyShimmer(
                                  margin: EdgeInsets.zero,
                                  height: 500,
                                  borderRadius: 12,
                                ),
                              ] else...[
                                if(provider.hash.isEmpty)...[
                                  formTypeProcess(provider: provider),
                                  spacerXs,
                                  formTypeDenuncia(provider: provider),
                                  spacerXs,
                                  if(provider.complaintSelected != null)...[
                                    formDataPersonal(provider: provider),
                                    spacerXs,
                                    formDocuments(provider: provider),
                                    spacerL,
                                    MyButton(
                                      onPressed: () {
                                        FocusScope.of(context).requestFocus(FocusNode());
                                        sendData(provider: provider,context: context,scrollController: scrollController);
                                      },
                                      text: 'Enviar denuncia ',
                                      width: double.infinity,
                                      disabled: !(provider.complaintsCategoriesSelected != null && provider.complaintSelected != null),
                                      isLoading: provider.loadSend,
                                      childCenter: SizedBox(
                                        width: 25,height: 25,
                                        child: Image.asset('assets/icons/Mail.png', color: AppColor.white,),
                                      ),
                                    ),
                                  ],
                                ]else...[
                                  formSuccess(provider: provider,context: context),
                                ],
                              ],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacerM,
        const Text('Tipo de contacto*',style: AppTextStyle.inputLabelStyle,),
        spacerS,
        MyCustomDropdownButton<ComplaintsModel>(
          hint: 'Seleccionar',
          dropdownItems: provider.complaints.map((item) => DropdownMenuItem(
            value: item,
            child: Text(item.nombre ?? '',overflow: TextOverflow.ellipsis,maxLines: 1,
              style: AppTextStyle.inputStyle,
            ),
          )).toList(),
          buttonWidth: double.infinity,
          value: provider.complaintSelected,
          onChanged: (value) {
            if(value != null){
              provider.complaintSelected = value;
            }
          },
        ),
      ],
    );
  }

  Widget formTypeDenuncia({required ClaimsProvider provider}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacerM,
        const Text('Relación con Vemare*',style: AppTextStyle.inputLabelStyle,),
        spacerS,
        MyCustomDropdownButton<ComplaintsCategoriesModel>(
          hint: 'Seleccionar',
          dropdownItems: provider.complaintsCategories.map((item) => DropdownMenuItem(
            value: item,
            child: Text(item.nombre ?? '',overflow: TextOverflow.ellipsis,maxLines: 1,
              style: AppTextStyle.inputStyle,
            ),
          )).toList(),
          buttonWidth: double.infinity,
          value: provider.complaintsCategoriesSelected,
          onChanged: (value) {
            if(value != null){
              provider.complaintsCategoriesSelected = value;
            }
          },
        ),
      ],
    );
  }

  Widget formDataPersonal({required ClaimsProvider provider}){

    bool isAnonymus = false;
    if(provider.complaintSelected != null){
      isAnonymus = provider.complaintSelected!.anonimo ?? false;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        spacerM,
        Text('Primer apellido${isAnonymus ? '' : '*'}',style: AppTextStyle.inputLabelStyle,),
        MyInput(
          key: const Key('Primer apellido*'),
          label: '',
          hintText: 'Escriba aquí',
          onChanged: (value){},
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          initialValue: null,
          readOnly: false,
          controller: provider.controllerApellido1,
        ),
        Text('Segundo apellido${isAnonymus ? '' : '*'}',style: AppTextStyle.inputLabelStyle,),
        MyInput(
          key: const Key('Segundo apellido*'),
          label: '',
          hintText: 'Escriba aquí',
          onChanged: (value){},
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          initialValue: null,
          readOnly: false,
          controller: provider.controllerApellido2,
        ),
        Text('Nombre${isAnonymus ? '' : '*'}',style: AppTextStyle.inputLabelStyle,),
        MyInput(
          key: const Key('Nombre*'),
          label: '',
          hintText: 'Escriba aquí',
          onChanged: (value){},
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          initialValue: null,
          readOnly: false,
          controller: provider.controllerNombre,
        ),
        const Text('CIF',style: AppTextStyle.inputLabelStyle,),
        MyInput(
          key: const Key('CIF*'),
          label: '',
          hintText: 'Escriba aquí',
          onChanged: (value){},
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          initialValue: null,
          readOnly: false,
          controller: provider.controllerCIF,
        ),
        Text('E-mail${isAnonymus ? '' : '*'}',style: AppTextStyle.inputLabelStyle,),
        MyInput(
          key: const Key('E-mail*'),
          label: '',
          hintText: 'Escriba aquí',
          onChanged: (value){},
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          initialValue: null,
          inputType: TextInputType.emailAddress,
          readOnly: false,
          controller: provider.controllerEmail,
        ),
        const Text('Teléfono',style: AppTextStyle.inputLabelStyle,),
        MyInput(
          key: const Key('Teléfono*'),
          label: '',
          hintText: 'Escriba aquí',
          onChanged: (value){},
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          initialValue: null,
          inputType: TextInputType.phone,
          readOnly: false,
          controller: provider.controllerTelefono,
        ),
        const Text('Dirección',style: AppTextStyle.inputLabelStyle,),
        MyInput(
          key: const Key('Dirección*'),
          label: '',
          hintText: 'Escriba aquí',
          onChanged: (value){},
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          initialValue: null,
          readOnly: false,
          controller: provider.controllerDireccion,
        ),
        const Text('Asunto de la denuncia*',style: AppTextStyle.inputLabelStyle,),
        MyInput(
          key: const Key('Asunto de la denuncia*'),
          label: '',
          hintText: 'Escriba aquí',
          onChanged: (value){},
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          initialValue: null,
          readOnly: false,
          controller: provider.controllerAsunto,
        ),
        const Text('Detalle de la denuncia*',style: AppTextStyle.inputLabelStyle,),
        MyInput(
          key: const Key('Detalle de la denuncia*'),
          label: '',
          hintText: 'Escriba aquí',
          onChanged: (value){},
          textInputAction: TextInputAction.next,
          textCapitalization: TextCapitalization.sentences,
          initialValue: null,
          maxLines: 5,
          readOnly: false,
          controller: provider.controllerDetalle,
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
          hintText: provider.nameFile == null ? '' : provider.nameFile!.path.split('/').last,
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

  Future sendData({required ClaimsProvider provider, required BuildContext context, required ScrollController scrollController}) async {
    String error = '';

    bool isAnonymus = false;
    if(provider.complaintSelected != null){
      isAnonymus = provider.complaintSelected!.anonimo ?? false;
    }

    if(provider.complaintsCategoriesSelected == null){
      error = 'Debe seleccionar alguna Relación con Vemare';
    }

    if(error.isEmpty && !isAnonymus && provider.controllerApellido1.text.isEmpty){
      error = 'Primer apellido requerido';
    }

    if(error.isEmpty && !isAnonymus && provider.controllerApellido2.text.isEmpty){
      error = 'Segundo apellido requerido';
    }

    if(error.isEmpty && !isAnonymus && provider.controllerNombre.text.isEmpty){
      error = 'Nombre requerido';
    }

    if(error.isEmpty && !isAnonymus && provider.controllerEmail.text.isEmpty){
      error = 'E-Mail requerido';
    }

    if(error.isEmpty && !isAnonymus && validateEmailAddress(email: provider.controllerEmail.text)['valid']){
      error = validateEmailAddress(email: provider.controllerEmail.text)['sms'];
    }

    if(error.isEmpty && provider.controllerAsunto.text.isEmpty){
      error = 'Asunto de la denuncia requerido';
    }

    if(error.isEmpty && provider.controllerDetalle.text.isEmpty){
      error = 'Detalle de la denuncia requerido';
    }


    if(error.isEmpty){
      Map result = await provider.sendData();
      if(result['response'] == 'success'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enviado con exito!!')));
        provider.hash = result['hash'];
        scrollController.animateTo(scrollController.position.minScrollExtent + 200,duration: const Duration(milliseconds: 100),
            curve: Curves.bounceIn);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result['message'])));
      }
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
    }

  }

  Widget formSuccess({required ClaimsProvider provider, required BuildContext context}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        spacerM,spacerM,
        Container(
          height: 60,width: 60,
          decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColor.success200),
          child: Image.asset('assets/icons/Thumb_Up.png',scale: 3,),
        ),
        Center(
            child: Text('¡Mensaje enviado con éxito!',
                style: AppTextStyle.h2Style.copyWith(
                  fontSize: 30
                )),
        ),
        spacerS,
        Center(
            child: Text(
              'Hemos recibido su comunicación correctamente. Procederemos a realizar el estudio de la misma a la mayor brevedad posible.',
              style: AppTextStyle.defaultStyle.copyWith(
                fontSize: 20
              ),
              textAlign: TextAlign.center,
            )),
        spacerS,spacerS,
        Center(
            child: Text('Referencia:',
                style: AppTextStyle.h2Style.copyWith(
                  fontSize: 30
                )),
        ),
        spacerS,
        Center(
            child: GestureDetector(
              onLongPress: () async {
                Clipboard.setData(ClipboardData(text: provider.hash));
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Copiado!!")));
              },
              child: Text(
                provider.hash,
                style: AppTextStyle.defaultStyle.copyWith(
                  fontSize: 18
                ),
                textAlign: TextAlign.center,
              ),
            )),
        spacerM,spacerM,
      ],
    );
  }
}