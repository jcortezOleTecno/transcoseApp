import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/workshops_repository.dart';
import 'package:vemare/app/domain/model/workshop.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_gallery/my_galery.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/my_video_player/my_video_player.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/workshop_networks/bloc/workshop_networks_cubit.dart';
import 'package:vemare/app/view/workshop_networks/bloc/workshop_networks_state.dart';
import 'package:vemare/config/service_locator.dart';

class WorkshopNetworksPage extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final cubit = context.read<WorkshopNetworksCubit>();
    return BlocConsumer<WorkshopNetworksCubit, WorkshopNetworksState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: MyBody(
            child: SingleChildScrollView(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Solicitar más información',
                            style: AppTextStyle.h2Style),
                        spacerS,
                        MyInput(label: 'Nombre'),
                        MyInput(label: 'E-mail'),
                        MyInput(label: 'Teléfono'),
                        const MyInput(
                          label: 'Observaciones',
                          required: true,
                          maxLines: 6,
                          inputType: TextInputType.multiline,
                        ),
                        spacerM,
                        MyButton(
                          onPressed: () {},
                          text: 'Enviar',
                          width: double.infinity,
                        ),
                        spacerXL,
                      ],
                    ),
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
                              spacerXs,
                              Text(
                                state.workShop?.description ?? '',
                                style: AppTextStyle.defaultStyle,
                              ),
                            ],
                          ))
                        ],
                      ),
                      spacerM,
                      MyIconButton(
                        onPressed: () {},
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
                Visibility(
                  visible: state.workShop?.gallery != null,
                  child: MyImageGallery(
                    isNetwork: true,
                    title: 'Imágenes',
                    imgs: state.workShop?.gallery
                            ?.map((e) => e.imagen)
                            .toList() ??
                        [],
                  ),
                ),
                Visibility(
                  visible: state.workShop?.videoLink != null,
                  child: MyVideoPlayer(video: state.workShop?.videoLink ?? ''),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
