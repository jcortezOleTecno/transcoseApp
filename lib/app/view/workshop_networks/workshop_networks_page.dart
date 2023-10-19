import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/workshops_repository.dart';
import 'package:vemare/app/domain/model/workshop.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_gallery/my_galery.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/my_video_player/my_video_player.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/access_denied/access_denied_page.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/workshop_networks/bloc/workshop_networks_cubit.dart';
import 'package:vemare/app/view/workshop_networks/bloc/workshop_networks_state.dart';
import 'package:vemare/config/service_locator.dart';

class WorkshopNetworksPage extends StatefulWidget {
  const WorkshopNetworksPage._();
  static const route = '/workshop_networks_page';

  static Widget create(int? idWorkShop) => BlocProvider(
        create: (context) => WorkshopNetworksCubit(
          getIt.get<WorkShopsRepository>(),
          idWorkShop,
        ),
        child: const WorkshopNetworksPage._(),
      );

  @override
  State<WorkshopNetworksPage> createState() => _WorkshopNetworksPageState();
}

class _WorkshopNetworksPageState extends State<WorkshopNetworksPage> {
  late TextEditingController tcName;
  late TextEditingController tcEmail;
  late TextEditingController tcPhone;
  late TextEditingController tcObserv;

  @override
  void initState() {
    tcName = TextEditingController();
    tcEmail = TextEditingController();
    tcPhone = TextEditingController();
    tcObserv = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    tcName.dispose();
    tcEmail.dispose();
    tcPhone.dispose();
    tcObserv.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WorkshopNetworksCubit>();
    final permissions = LocalDataRepository().user?.permissions;
    final isEmpleado = LocalDataRepository().user?.role?.id == 4;
    return BlocBuilder<WorkshopNetworksCubit, WorkshopNetworksState>(
      builder: (context, state) {
        return MyTapToHideKeyboard(
          child: Scaffold(
            body: MyBody(
              child: permissions!.where((e) => e.id == 3).isEmpty && isEmpleado
                  ? const AccessDeniedWidget()
                  : SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MyBackButton(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Nuestras redes de talleres',
                                    style: AppTextStyle.h1Style),
                                spacerS,
                                MyCustomDropdownButton<WorkShop>(
                                  buttonWidth: double.infinity,
                                  hint: 'Elige una opción',
                                  dropdownItems: state.workShops
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(
                                              e.name ?? '',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: AppTextStyle.defaultStyle,
                                            ),
                                          ))
                                      .toList(),
                                  value: state.workShop,
                                  onChanged: cubit.workShop,
                                ),
                              ],
                            ),
                          ),
                          const _Info(),
                          spacerL,
                          if (state.workShop != null)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Visibility(
                                visible: state.status != FormStatus.done,
                                replacement:
                                    const MessageSentSuccesfullyWidget(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Solicitar más información',
                                        style: AppTextStyle.h2Style),
                                    spacerS,
                                    MyInput(
                                      label: 'Nombre',
                                      required: true,
                                      onChanged: cubit.name,
                                      hintText: 'Escribe tu nombre',
                                      controller: tcName,
                                      textInputAction: TextInputAction.next,
                                      inputType: TextInputType.name,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      hasError:
                                          state.status == FormStatus.error,
                                    ),
                                    MyInput(
                                      label: 'E-mail',
                                      hintText: 'Escribe tu e-mail',
                                      required: true,
                                      controller: tcEmail,
                                      textInputAction: TextInputAction.next,
                                      inputType: TextInputType.emailAddress,
                                      onChanged: cubit.email,
                                      hasError:
                                          state.status == FormStatus.error,
                                    ),
                                    MyInput(
                                      label: 'Teléfono',
                                      hintText: 'Escribe tu teléfono',
                                      required: true,
                                      controller: tcPhone,
                                      textInputAction: TextInputAction.next,
                                      inputType: TextInputType.phone,
                                      onChanged: cubit.phone,
                                      // inputFormatters: [
                                      //   MaskedInputFormatter('### ### ###'),
                                      // ],
                                      hasError:
                                          state.status == FormStatus.error,
                                    ),
                                    MyInput(
                                      label: 'Observaciones',
                                      maxLines: 6,
                                      hintText: 'Escribe aquí',
                                      controller: tcObserv,
                                      onChanged: cubit.observation,
                                      hasError:
                                          state.status == FormStatus.error,
                                      inputType: TextInputType.multiline,
                                    ),
                                    spacerM,
                                    MyButton(
                                      onPressed: () {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        cubit.sendForm();
                                      },
                                      text: 'Enviar',
                                      width: double.infinity,
                                      isLoading:
                                          state.status == FormStatus.loading,
                                      disabled: !state.isComplete,
                                    ),
                                    spacerXL,
                                  ],
                                ),
                              ),
                            ),
                          const _Multimedia(),
                          const Footer(),
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

class _Info extends StatelessWidget {
  const _Info({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkshopNetworksCubit, WorkshopNetworksState>(
      builder: (context, state) {
        return Visibility(
          visible: state.workShop != null,
          child: FadeIn(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spacerM,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(state.workShop?.image ?? ''),
                          ),
                          spacerS,
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.workShop?.name ?? '',
                                style: AppTextStyle.titleCard,
                              ),
                              // spacerXs,
                              MyHtml(text: state.workShop?.description ?? '')
                              // Text(
                              //   state.workShop?.description ?? '',
                              //   style: AppTextStyle.defaultStyle,
                              // ),
                            ],
                          ))
                        ],
                      ),
                      spacerM,
                      MyIconButton(
                        onPressed: () {
                          launchUrlString(
                            state.workShop?.externalLink ??
                                'https://www.google.com',
                          );
                        },
                        text: 'Más detalles',
                        icon: Image.asset(
                          'assets/icons/link.png',
                          scale: 2,
                        ),
                        variant: MyButtonVariant.outlinedBold,
                      ),
                      spacerS,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Multimedia extends StatelessWidget {
  const _Multimedia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkshopNetworksCubit, WorkshopNetworksState>(
      builder: (context, state) {
        return Column(
          children: [
            Visibility(
              visible: state.workShop?.gallery != null,
              child: MyImageGallery(
                isNetwork: true,
                title: 'Imágenes',
                imgs: state.workShop?.gallery?.map((e) => e.imagen).toList() ??
                    [],
              ),
            ),
            if (state.workShop?.videoLink != "https://youtube.com")
              Visibility(
                visible: state.workShop?.videoLink != null,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: MyVideoPlayer(video: state.workShop?.videoLink ?? ''),
                ),
              ),
            spacerM,
          ],
        );
      },
    );
  }
}

class MessageSentSuccesfullyWidget extends StatelessWidget {
  const MessageSentSuccesfullyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Solicitar más información', style: AppTextStyle.h2Style),
        spacerM,
        Container(
          height: 80,
          width: 80,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColor.success200),
          child: Image.asset(
            'assets/icons/Thumb_Up.png',
            scale: 2,
          ),
        ),
        const Center(
            child: Text('¡Mensaje enviado con éxito!',
                style: AppTextStyle.h2Style)),
        spacerS,
        const Center(
            child: Text(
          'Nuestro equipo Vemare contestará a tu email lo antes posible.',
          style: AppTextStyle.defaultStyle,
          textAlign: TextAlign.center,
        )),
        spacerM,
      ],
    );
  }
}
