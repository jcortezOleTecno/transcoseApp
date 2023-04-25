import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:vemare/app/data/services_repository.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/my_services/events/events_page.dart';
import 'package:vemare/app/view/my_services/formations/formations/formations_page.dart';
import 'package:vemare/app/view/my_services/sat/sat_page.dart';
import 'package:vemare/app/view/my_services/services/bloc/services_cubit.dart';
import 'package:vemare/app/view/my_services/services/bloc/services_state.dart';
import 'package:vemare/app/view/my_services/services/service_general.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/workshop_networks/workshop_networks_page.dart';
import 'package:vemare/config/service_locator.dart';

import '../sat/sat_intro_page.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage._();

  static const route = '/services_page';

  static Widget create() {
    return BlocProvider(
      create: (context) => ServicesCubit(
        getIt.get<ServicesRepository>(),
      ),
      child: const ServicesPage._(),
    );
  }

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  late TextEditingController tcName;
  late TextEditingController tcEmail;
  late TextEditingController tcPhone;
  late TextEditingController tcProvince;
  late TextEditingController tcCity;
  late TextEditingController tcMsg;

  @override
  void initState() {
    tcName = TextEditingController();
    tcEmail = TextEditingController();
    tcPhone = TextEditingController();
    tcProvince = TextEditingController();
    tcCity = TextEditingController();
    tcMsg = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    tcName.dispose();
    tcEmail.dispose();
    tcPhone.dispose();
    tcProvince.dispose();
    tcCity.dispose();
    tcMsg.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ServicesCubit>();
    return BlocConsumer<ServicesCubit, ServicesState>(
      listener: (context, state) {
        if (state.status == FormStatus.done) {
          tcName.clear();
          tcEmail.clear();
          tcPhone.clear();
          tcProvince.clear();
          tcCity.clear();
          tcMsg.clear();
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Su solicitud ha sido enviada')));
        }
      },
      builder: (context, state) {
        return MyTapToHideKeyboard(
          child: Scaffold(
            body: MyBody(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text('Servicios', style: AppTextStyle.h1Style),
                  ),
                  // spacerM,
                  // _CardService(
                  //   title: 'Formaciones',
                  //   onTap: () =>
                  //       Navigator.pushNamed(context, FormationsPage.route),
                  //   image: const AssetImage('assets/imgs/IMGformaciones.png'),
                  // ),
                  // _CardService(
                  //   title: 'Eventos',
                  //   onTap: () => Navigator.pushNamed(context, EventsPage.route),
                  //   image: const AssetImage('assets/imgs/IMGeventos.png'),
                  // ),
                  state.loading
                      ? Column(
                          children: List.generate(
                          4,
                          (_) => const Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: MyShimmer(
                              margin: EdgeInsets.zero,
                              borderRadius: 0,
                              height: 220,
                            ),
                          ),
                        ))
                      : Column(
                          children: state.services
                              .map((e) => _CardService(
                                    title: e.title ?? '',
                                    image: NetworkImage(e.image!),
                                    onTap: () {
                                      if (e.type == 'formacion') {
                                        Navigator.pushNamed(
                                            context, FormationsPage.route);
                                      } else if (e.type == 'evento') {
                                        Navigator.pushNamed(
                                            context, EventsPage.route);
                                      } else {
                                        Navigator.pushNamed(
                                          context,
                                          ServiceGeneralPage.route,
                                          arguments: e,
                                        );
                                      }
                                    },
                                  ))
                              .toList(),
                        ),
                  spacerS,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Te ayudamos', style: AppTextStyle.h2Style),
                        spacerS,
                        Row(
                          children: [
                            Expanded(
                                child: _CardWeHelpYou(
                              name: 'SAT',
                              img: 'assets/imgs/sat.png',
                              onTap: () {
                                Navigator.pushNamed(
                                    context, SatIntroPage.route);
                              },
                            )),
                            spacerS,
                            Expanded(
                              child: _CardWeHelpYou(
                                name: 'Conexión remota',
                                img: 'assets/imgs/conexion_remota.png',
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        spacerM,
                        const Text('Nuestras redes de talleres',
                            style: AppTextStyle.h2Style),
                        spacerS,
                        _CardService(
                          title: 'Redes de talleres',
                          image: const AssetImage('assets/imgs/AD360IMG.png'),
                          borderRadius: BorderRadius.circular(15),
                          onTap: () => Navigator.pushNamed(
                              context, WorkshopNetworksPage.route),
                        ),
                        spacerS,
                        const Text('Contactos', style: AppTextStyle.h2Style),
                        spacerS,
                        MyInput(
                          label: 'Nombre',
                          required: true,
                          hintText: 'Escribe tu nombre',
                          onChanged: cubit.name,
                          controller: tcName,
                          textInputAction: TextInputAction.next,
                          inputType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          hasError: state.status == FormStatus.error,
                        ),
                        MyInput(
                          label: 'E-mail',
                          required: true,
                          hintText: 'Escribe tu email',
                          controller: tcEmail,
                          textInputAction: TextInputAction.next,
                          inputType: TextInputType.emailAddress,
                          onChanged: cubit.email,
                          hasError: state.status == FormStatus.error,
                        ),
                        MyInput(
                          label: 'Teléfono',
                          required: true,
                          hintText: '123 456 789',
                          controller: tcPhone,
                          textInputAction: TextInputAction.next,
                          inputType: TextInputType.phone,
                          onChanged: cubit.phone,
                          inputFormatters: [
                            MaskedInputFormatter('### ### ###'),
                          ],
                          hasError: state.status == FormStatus.error,
                        ),
                        MyInput(
                          label: 'Provincia',
                          required: true,
                          hintText: 'Escribe tu provincia',
                          controller: tcProvince,
                          textInputAction: TextInputAction.next,
                          inputType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          hasError: state.status == FormStatus.error,
                          onChanged: cubit.province,
                        ),
                        MyInput(
                          label: 'Ciudad',
                          hintText: 'Escribe tu ciudad',
                          required: true,
                          textInputAction: TextInputAction.next,
                          controller: tcCity,
                          inputType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          hasError: state.status == FormStatus.error,
                          onChanged: cubit.ciudad,
                        ),
                        spacerS,
                        MyInput(
                          label: 'Asunto',
                          required: true,
                          maxLines: 6,
                          textInputAction: TextInputAction.newline,
                          controller: tcMsg,
                          onChanged: cubit.message,
                          inputType: TextInputType.multiline,
                          hasError: state.status == FormStatus.error,
                        ),
                        spacerM,
                        MyButton(
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            cubit.sendForm();
                          },
                          text: 'Enviar',
                          width: double.infinity,
                          isLoading: state.status == FormStatus.loading,
                          disabled: !state.isCompleted,
                        ),
                        spacerXL,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CardWeHelpYou extends StatelessWidget {
  const _CardWeHelpYou({
    required this.name,
    required this.img,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String name;
  final String img;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage(img),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: AppTextStyle.h3Style,
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CardService extends StatelessWidget {
  const _CardService({
    required this.title,
    required this.image,
    this.onTap,
    this.borderRadius,
    Key? key,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;
  final ImageProvider<Object> image;

  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: borderRadius),
        margin: const EdgeInsets.only(bottom: 15),
        height: 220,
        width: double.infinity,
        child: Stack(fit: StackFit.expand, children: [
          Image(
            image: image,
            fit: BoxFit.cover,
          ),
          const MyFilterImage(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.linkStyle
                          .copyWith(color: AppColor.white, fontSize: 22),
                    ),
                    Image.asset(
                      'assets/icons/arrow_next.png',
                      color: AppColor.white,
                      scale: 2,
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
