import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/data/services_repository.dart';
import 'package:vemare/app/data/shared_preferences_static.dart';
import 'package:vemare/app/domain/utils/validators.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/my_services/events/events_page.dart';
import 'package:vemare/app/view/my_services/formations/formations/formations_page.dart';
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
        getIt.get<HeaderRepository>(),
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
  final _formKey = GlobalKey<FormState>();

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                        state.headers.isEmpty
                            ? ""
                            : state.headers
                                    .firstWhere((e) => e.module == "Service")
                                    .title ??
                                '',
                        style: AppTextStyle.h1Style),
                  ),
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              state.headers.isEmpty
                                  ? ""
                                  : state.headers
                                          .firstWhere(
                                              (e) => e.module == "WeHelp")
                                          .title ??
                                      '',
                              style: AppTextStyle.h2Style),
                          spacerS,
                          Row(
                            children: [
                              if(SharedPreferencesLocal.transcoseAppSat)...[
                                Expanded(
                                    child: state.loading
                                        ? const MyShimmer(
                                      margin: EdgeInsets.zero,
                                      height: 210,
                                      borderRadius: 12,
                                    )
                                        : _CardWeHelpYou(
                                      name:
                                      state.weHelpYou?.sat?.title ?? '',
                                      img:
                                      state.weHelpYou?.sat?.image ?? '',
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, SatIntroPage.route,
                                            arguments:
                                            state.weHelpYou?.sat);
                                      },
                                    )),
                                spacerS,
                              ],
                              Expanded(
                                child: state.loading
                                    ? const MyShimmer(
                                        margin: EdgeInsets.zero,
                                        height: 210,
                                        borderRadius: 12,
                                      )
                                    : _CardWeHelpYou(
                                        name: state.weHelpYou?.remoteConnection
                                                ?.title ??
                                            '',
                                        img: state.weHelpYou?.remoteConnection
                                                ?.image ??
                                            '',
                                        onTap: () {
                                          launchUrlString(state
                                                  .weHelpYou
                                                  ?.remoteConnection
                                                  ?.externalLink ??
                                              '');
                                        },
                                      ),
                              ),
                            ],
                          ),
                          spacerM,
                          Text(
                              state.headers.isEmpty
                                  ? ""
                                  : state.headers
                                          .firstWhere((e) =>
                                              e.module == "WorkshopNetwork")
                                          .landing ??
                                      '',
                              style: AppTextStyle.h2Style),
                          spacerS,
                          state.headers.isEmpty
                              ? const MyShimmer(
                                  height: 220,
                                  margin: EdgeInsets.only(bottom: 15),
                                )
                              : _CardService(
                                  title: 'Redes de talleres',
                                  image: NetworkImage(state.headers
                                      .firstWhere(
                                          (e) => e.module == "WorkshopNetwork")
                                      .image!),
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
                            // validator: validateData,
                          ),
                          spacerXs,
                          MyInput(
                            label: 'E-mail',
                            required: true,
                            hintText: 'email@ejemplo.com',
                            controller: tcEmail,
                            textInputAction: TextInputAction.next,
                            inputType: TextInputType.emailAddress,
                            onChanged: cubit.email,
                            hasError: state.status == FormStatus.error,
                            validator: validateEmail,
                          ),
                          spacerXs,
                          MyInput(
                            label: 'Teléfono',
                            required: true,
                            hintText: '123456789',
                            controller: tcPhone,
                            textInputAction: TextInputAction.next,
                            inputType: TextInputType.phone,
                            onChanged: cubit.phone,
                            hasError: state.status == FormStatus.error,
                          ),
                          spacerXs,
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
                          spacerXs,
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
                            hintText: 'Escribe aquí',
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
                              if (_formKey.currentState!.validate()) {
                                cubit.sendForm();
                              }
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
                  ),
                  const Footer(),
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
              image: NetworkImage(img),
              fit: BoxFit.cover,
              height: 150,
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
