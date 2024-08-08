// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:nested_scroll_views/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/brands_repository.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/data/home_repository.dart';
import 'package:vemare/app/data/notices_repository.dart';
import 'package:vemare/app/data/products_repository.dart';
import 'package:vemare/app/data/promotion_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/services_repository.dart';
import 'package:vemare/app/data/shared_preferences_static.dart';
import 'package:vemare/app/data/work_with_us_repository.dart';
import 'package:vemare/app/data/workshops_repository.dart';
import 'package:vemare/app/domain/model/header.dart';
import 'package:vemare/app/domain/utils/validators.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_cards/my_promotions_card.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_listile/my_listile.dart';
import 'package:vemare/app/view/_components/my_cards/my_products_card.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/home/bloc/home_cubit.dart';
import 'package:vemare/app/view/home/bloc/home_state.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/my_services/events/events_page.dart';
import 'package:vemare/app/view/my_services/formations/formations/formations_page.dart';
import 'package:vemare/app/view/my_services/services/service_general.dart';
import 'package:vemare/app/view/my_services/services/services_page.dart';
import 'package:vemare/app/view/news/news_details/news_detail.dart';
import 'package:vemare/app/view/news/news_page.dart';
import 'package:vemare/app/view/our_products/type_of_vehicle/type_of_vehicle_page.dart';
import 'package:vemare/app/view/promotions/promotions_categories/promotions_page.dart';
import 'package:vemare/app/view/shared/userbloc/user_cubit.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/work_with_us/work_with_us_home.dart';
import 'package:vemare/app/view/work_with_us/work_with_us_page.dart';
import 'package:vemare/app/view/workshop_networks/workshop_networks_page.dart';
import 'package:vemare/config/service_locator.dart';
import 'package:vemare/main.dart';

import '../my_notifications/my_notifications_page.dart';
import 'package:vemare/app/domain/widgets_utils/web_view_global.dart';

class HomePage extends StatefulWidget {
  const HomePage._();

  static const route = '/home';

  static Widget create() {
    return BlocProvider(
      create: (context) => HomeCubit(
        getIt.get<HomeRepository>(),
        getIt.get<PromotionRepository>(),
        getIt.get<ProductsRepository>(),
        getIt.get<ServicesRepository>(),
        getIt.get<WorkShopsRepository>(),
        getIt.get<NoticesRepository>(),
        getIt.get<BrandsRepository>(),
        context.read<UserCubit>(),
        getIt.get<WorkWithUsRepository>(),
        getIt.get<HeaderRepository>(),
      ),
      child: const HomePage._(),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(keepPage: false);
    FirebaseMessaging.instance.getInitialMessage().then((message) => {
          if (message != null)
            {Navigator.pushNamed(context, MyNotificationsPage.route)}
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    isReturns = SharedPreferencesLocal.transcoseAppDevoluciones || SharedPreferencesLocal.transcoseAppDevolucionesPermission;

    return Scaffold(
        body: MyBody(
      child: NestedPageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        // wantKeepAlive: true,
        restorationId: 'id',
        padEnds: true,
        children: const [
          _PageA(),
          _PageB(),
        ],
      ),
    ));
  }
}

class _PageA extends StatelessWidget {
  const _PageA({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<HomeCubit>();
    return Stack(
      fit: StackFit.expand,
      children: [
        const _Background(),
        Padding(
          padding: const EdgeInsets.all(15),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                    onPressed: () {
                      if(!LocalDataRepository().isLogged){
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginPage.route, (route) => false);
                      }else{
                        Navigator.pushNamed(context, PromotionsPage.route);
                      }
                    },
                    text: 'Hacer un pedido  ',
                    width: double.infinity,
                    isLoading: false,
                    disabled: false,
                    childCenter: Image.asset(
                      'assets/icons/arrow_next.png',
                      scale: 2,color: Colors.white,
                    ),
                  ),
                  spacerM,
                  MyIconButton(
                    onPressed: () => cubit.openWhatsApp(
                        phone: state.heroButtons?.whatsapp ?? ''),
                    text: 'Escribir un Whatsapp',
                    icon: Image.asset(
                      'assets/icons/Whatsapp-.png',
                      scale: 1.5,
                    ),
                    variant: MyButtonVariant.outlinedBold,
                  ),
                  spacerM,
                  MyIconButton(
                    onPressed: () {
                      showDialog<bool>(
                          context: context,
                          builder: (context) { return _DialogEmail( toEmail: state.heroButtons?.email ?? '');}).then((value) {
                        if (value ?? false) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  insetPadding: const EdgeInsets.all(15),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 22, vertical: 20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          height: 48,
                                          width: 48,
                                          decoration: const BoxDecoration(
                                            color: AppColor.success200,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.email_outlined,
                                            color: AppColor.success,
                                          ),
                                        ),
                                        spacerM,
                                        Text(
                                          "Formulario enviado con éxito",
                                          style: AppTextStyle.nunito800
                                              .copyWith(fontSize: 24),
                                          textAlign: TextAlign.center,
                                        ),
                                        spacerS,
                                        const Text(
                                          "Nuestro equipo se pondrá en contacto contigo lo antes posible.",
                                          style: AppTextStyle.defaultStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                        spacerM,
                                        MyButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          text: "Aceptar",
                                          width: double.infinity,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        }
                      });
                    } /*cubit.openEmail(
                          toEmail: state.heroButtons?.email ?? '')*/
                    ,
                    text: 'Escribir un email',
                    icon: const Icon(Icons.mail_outline),
                    variant: MyButtonVariant.outlinedBold,
                  ),
                  spacerM,
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

class _DialogEmail extends StatefulWidget {
  final String toEmail;

  const _DialogEmail({required this.toEmail});
  @override
  State<_DialogEmail> createState() => _DialogEmailState();
}

class _DialogEmailState extends State<_DialogEmail> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String? email = '';
  String? asunto = '';
  String? mensaje = '';
  String? name = '';
  String? phone = '';
  String? province = '';
  String? city = '';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // spacerS,
              Text(
                "Contacto por email",
                style: AppTextStyle.nunito800.copyWith(fontSize: 24),
              ),
              spacerS,
              Text(
                "Rellena el formulario y nuestro equipo se pondrá en contacto contigo lo antes posible.",
                textAlign: TextAlign.center,
                style: AppTextStyle.defaultStyle.copyWith(fontSize: 16),
              ),
              spacerM,
              MyInput(
                label: "Nombre*",
                hintText: 'Escribe tu nombre',
                variant: MyInputVariant.backgroundBlue,
                validator: validateData,
                onChanged: (p0) {
                  setState(() {
                    name = p0;
                  });
                },
              ),
              spacerM,
              MyInput(
                label: "Teléfono*",
                hintText: 'Escribe tu Teléfono',
                variant: MyInputVariant.backgroundBlue,
                inputType: TextInputType.phone,
                validator: validateData,
                onChanged: (p0) {
                  setState(() {
                    phone = p0;
                  });
                },
              ),
              spacerM,
              MyInput(
                label: "Provincia*",
                hintText: 'Escribe tu provincia',
                variant: MyInputVariant.backgroundBlue,
                validator: validateData,
                onChanged: (p0) {
                  setState(() {
                    province = p0;
                  });
                },
              ),
              spacerM,
              MyInput(
                label: "Ciudad*",
                hintText: 'Escribe tu ciudad...',
                variant: MyInputVariant.backgroundBlue,
                validator: validateData,
                onChanged: (p0) {
                  setState(() {
                    city = p0;
                  });
                },
              ),
              spacerM,
              MyInput(
                label: "Correo electróncio*",
                hintText: 'Escribe tu correo electrónico',
                variant: MyInputVariant.backgroundBlue,
                validator: validateEmail,
                inputType: TextInputType.emailAddress,
                onChanged: (p0) {
                  setState(() {
                    email = p0;
                  });
                },
              ),
              MyInput(
                label: "Asunto*",
                hintText: 'Escribe aquí...',
                variant: MyInputVariant.backgroundBlue,
                validator: validateData,
                onChanged: (p0) {
                  setState(() {
                    asunto = p0;
                  });
                },
              ),
              MyInput(
                label: "Mensaje*",
                variant: MyInputVariant.backgroundBlue,
                maxLines: 6,
                hintText: 'Escribe aquí...',
                textInputAction: TextInputAction.newline,
                inputType: TextInputType.multiline,
                validator: validateData,
                onChanged: (p0) {
                  setState(() {
                    mensaje = p0;
                  });
                },
              ),
              MyButton(
                onPressed: () => Navigator.pop(context),
                text: "Cancelar",
                variant: MyButtonVariant.outlinedBold,
                width: double.infinity,
              ),
              spacerS,
              MyIconButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                    var resp = await getIt<HomeRepository>().contactForm(
                        email: email!, subject: asunto!, description: mensaje!,
                    name: name!,phone: phone!,city: city!,province: province!);
                    setState(() {
                      loading = false;
                    });
                    Navigator.of(context).pop(resp);
                  }
                },
                icon: loading
                    ? const SizedBox(
                        height: 16,
                        width: 16,
                        child: CircularProgressIndicator())
                    : const Icon(Icons.mail_outline),
                text: loading ? "" : "Enviar",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

late HomeState homeStateGlobal;

class _Background extends StatefulWidget {
  const _Background({
    Key? key,
  }) : super(key: key);

  @override
  State<_Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<_Background> {
  final KeyboardVisibilityController _keyboardVisibilityController =
      KeyboardVisibilityController();
  bool openKeyboard = false;

  @override
  void initState() {
    _keyboardVisibilityController.onChange.listen((bool isVisible) async {
      if (!isVisible) {
        await Future.delayed(const Duration(milliseconds: 200));
      }
      if(mounted){
        setState(() {
          openKeyboard = isVisible;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        homeStateGlobal = state;
        return state.hero.isEmpty
            ? const MyShimmer.full()
            : Swiper(
                itemCount: state.hero.length,
                itemHeight: 100, // size.height,
                itemWidth: size.width,
                autoplay: true,
                autoplayDelay: 8000,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Stack(
                    children: [
                      SizedBox(
                        width: size.width,
                        height: size.height - 80,
                        child: MyNetworkImage(
                          image: state.hero[i].image!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const MyFilterImage(),
                      if (!openKeyboard)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: Text(
                                  '¡Bienvenido${LocalDataRepository().isLogged ? ', ${LocalDataRepository().user?.name ?? ''}!' : '!'}',
                                  style: AppTextStyle.homeStyle.copyWith(
                                      color: Colors.white60,fontSize: 22
                                  ),
                                ),
                              ),
                              const MySpacer(height: 10),
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: Text(
                                  state.hero[i].title ?? '',
                                  style: AppTextStyle.h1Style.copyWith(
                                      color: AppColor.white, fontSize: 58),
                                ),
                              ),
                              MyHtml(
                                text: state.hero[i].description ?? '',
                                bodyFontSize: 22,
                                color: Colors.white60,
                              ),
                              const MySpacer(height: 250),
                            ],
                          ),
                        )
                    ],
                  );
                },
              );
      },
    );
  }
}

class _PageB extends StatelessWidget {
  const _PageB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cubit = context.watch<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (p, c) {
        return c.encuesta?.openModal == 1 &&
            c.encuesta?.dataEncuesta?.id != p.encuesta?.dataEncuesta?.id;
      },
      listener: (context, state) {
        /*if (state.encuesta?.openModal == 1) {
          showDialog<String?>(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return EncuestaWidget(state.encuesta!);
            },
          ).then((value) {
            cubit.showSurvey();
            if (value != null) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(value),
                behavior: SnackBarBehavior.floating,
              ));
            }
          });
        }*/
      },
      builder: (context, state) {
        return Container(
          color: AppColor.white,
          child: ListView(
            addAutomaticKeepAlives: false,
            physics: Platform.isIOS ? const ClampingScrollPhysics() : null,
            // primary: false,
            padding: const EdgeInsets.only(top: 30),
            // primary: true,
            children: [
              const _ProductsVemare(),
              const _Promociones(),
              const _Servicios(),
              spacerL,
              const _LastService(),
              const _RedesTalleres(),
              spacerL,
              const _News(),
              spacerL,
              const _TrabajaConNosotros(),
              spacerM,
              if (!state.loading)
                Center(
                  child: TextButton.icon(
                    onPressed: () {
                      if(!LocalDataRepository().isLogged){
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginPage.route, (route) => false);
                      }else{
                        Navigator.pushNamed(context, WorkWithUsHome.route,
                            arguments: state.workWithUs);
                      }
                    },
                    label: Image.asset(
                      'assets/icons/arrow_next.png',
                      scale: 2,
                    ),
                    icon: const Text(
                      'Ver más',
                      style: AppTextStyle.linkStyle,
                    ),
                  ),
                ),
              const Footer(),
            ],
          ),
        );
      },
    );
  }
}

class _News extends StatelessWidget {
  const _News({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Noticias',
            style: AppTextStyle.h1Style,
          ),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.loading) {
              return const MyShimmer(height: 220);
            }
            return SizedBox(
              height: 220,
              child: PageView.builder(
                itemCount: state.notices.length,
                controller:
                    PageController(initialPage: 0, viewportFraction: 0.9),
                itemBuilder: (context, i) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, NewsDetailPage.route,
                        arguments: state.notices[i]);
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        MyNetworkImage(
                          image: state.notices[i].image!,
                          fit: BoxFit.cover,
                          height: 220,
                        ),
                        const MyFilterImage(),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Spacer(),
                              Text(
                                state.notices[i].title ?? '',
                                style: AppTextStyle.h3Style.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.white,fontSize: 18),
                              ),
                              spacerS,
                              Text(
                                state.notices[i].subtitle ?? '',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyle.contentCard
                                    .copyWith(color: Colors.white,fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        Center(
          child: TextButton.icon(
            onPressed: () => Navigator.pushNamed(context, NewsPage.route),
            label: Image.asset(
              'assets/icons/arrow_next.png',
              scale: 2,
            ),
            icon: const Text(
              'Ver más',
              style: AppTextStyle.linkStyle,
            ),
          ),
        ),
      ],
    );
  }
}

class _TrabajaConNosotros extends StatelessWidget {
  const _TrabajaConNosotros({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {

        String title = state.workWithUs?.title ?? '';
        Widget image = MyNetworkImage(
          image: state.workWithUs?.image ?? '',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width * .90,
          height: 200,
        );

        if(state.headers.isNotEmpty){
          try{
            Header? header = state.headers.firstWhere((e) => e.module == "RRHHModel");
            title = header.title ?? title;
            if(header.image != null){
              image = Image(
                image: NetworkImage(header.image!),
                width: double.infinity,
                fit: BoxFit.contain,
              );
            }
          }catch(_){}
        }

        return SizedBox(
          // height: 230,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.h1Style,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              state.loading
                  ? const MyShimmer(
                      borderRadius: 12,
                      margin: EdgeInsets.all(20),
                      height: 200,
                    )
                  : InkWell(
                    onTap: (){
                      if(!LocalDataRepository().isLogged){
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginPage.route, (route) => false);
                      }else{
                        Navigator.pushNamed(context, WorkWithUsHome.route,
                            arguments: state.workWithUs);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: image,
                      ),
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}

class _RedesTalleres extends StatelessWidget {
  const _RedesTalleres({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        spacerM,
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                state.headers.isEmpty
                    ? ""
                    : state.headers
                            .firstWhere((e) => e.module == "WorkshopNetwork")
                            .landing ??
                        '',
                style: AppTextStyle.h1Style,
              ),
            );
          },
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.loading) {
              return const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: MyShimmer(
                  borderRadius: 0,
                  height: 86,
                ),
              );
            }
            return Column(
              children: state.workshop.map((e) => MyListile(
                      icon: MyNetworkImage(
                        image: e.image ?? '',
                        fit: BoxFit.cover,
                      ), //Image.network(e.image!, fit: BoxFit.cover),
                      title: e.name ?? '',
                      onTap: (){
                        //if(LocalDataRepository().isLogged){
                          Navigator.pushNamed(
                            context,
                            WorkshopNetworksPage.route,
                            arguments: e.id,
                          );
                        // }else{
                        //   Navigator.pushReplacementNamed(context, LoginPage.route);
                        // }
                      },
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}

class _LastService extends StatelessWidget {
  const _LastService({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.loading) {
          return MyShimmer(
            margin: EdgeInsets.zero,
            borderRadius: 0,
            height: MediaQuery.of(context).size.width * .80,
          );
        }
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              ServiceGeneralPage.route,
              arguments: state.services.last,
            );
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.width * .80,
            width: double.infinity,
            child: Stack(fit: StackFit.expand, children: [
              MyNetworkImage(
                image: state.services.last.image ?? '',
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.width * .80,
              ),
              // Image(
              //   image: NetworkImage(state.services.last.image!),
              //   fit: BoxFit.cover,
              // ),
              const MyFilterImage(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          state.services.last.title ?? '',
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
                    spacerXs,
                    Text(
                      state.services.last.description ?? '',
                      textAlign: TextAlign.left,
                      style: AppTextStyle.contentCard.copyWith(
                        color: AppColor.white,
                        fontSize: 18,
                        height: 1.8,
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}

class _Servicios extends StatelessWidget {
  const _Servicios({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                state.headers.isEmpty
                    ? ''
                    : state.headers
                            .firstWhere((e) => e.module == "Service")
                            .landing ??
                        '',
                style: AppTextStyle.h1Style,
              ),
            );
          },
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.loading) {
              return const MyShimmer(height: 225);
            }
            return SizedBox(
              height: 225,
              child: PageView.builder(
                itemCount: state.services.length,
                controller:
                    PageController(initialPage: 0, viewportFraction: 0.9),
                itemBuilder: (context, i) => GestureDetector(
                  onTap: () {
                    if (state.services[i].type == 'formacion') {
                      Navigator.pushNamed(context, FormationsPage.route);
                    } else if (state.services[i].type == 'evento') {
                      Navigator.pushNamed(context, EventsPage.route);
                    } else {
                      Navigator.pushNamed(
                        context,
                        ServiceGeneralPage.route,
                        arguments: state.services[i],
                      );
                    }
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        MyNetworkImage(
                          image: state.services[i].image!,
                          fit: BoxFit.cover,
                          height: 225,
                        ),
                        const MyFilterImage(),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              const Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      state.services[i].title ?? '',
                                      style: AppTextStyle.h2Style
                                          .copyWith(color: AppColor.white),
                                    ),
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
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        spacerM,
        Center(
          child: TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, ServicesPage.route);
            },
            label: Image.asset(
              'assets/icons/arrow_next.png',
              scale: 2,
            ),
            icon: const Text(
              'Ver todos',
              style: AppTextStyle.linkStyle,
            ),
          ),
        ),
      ],
    );
  }
}

class _Promociones extends StatelessWidget {
  const _Promociones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                state.headers.isEmpty
                    ? ''
                    : state.headers
                            .firstWhere((e) => e.module == "Promotion")
                            .landing ??
                        '',
                style: AppTextStyle.h1Style,
              ),
            );
          },
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.loading) {
              return const MyShimmer(
                borderRadius: 4,
                height: 148,
              );
            }
            return SizedBox(
              height: 140,
              child: PageView.builder(
                itemCount: state.promotions.length,
                controller:
                    PageController(initialPage: 0, viewportFraction: 0.9),
                itemBuilder: (context, i) => MySingleCard(
                  title: state.promotions[i].name ?? '',
                  isHtml: false,
                  maxLines: 3,
                  content: state.promotions[i].subtitle ?? '',
                  icon: Image.network(
                    state.promotions[i].image ?? '',
                  ),
                  onTap: () {
                    _callDialog(context,number: contacDefault ?? '');
                    // if(!LocalDataRepository().isLogged){
                    //   Navigator.pushNamedAndRemoveUntil(
                    //       context, LoginPage.route, (route) => false);
                    // }else{
                    //   Navigator.pushNamed(
                    //     context,
                    //     PromotionPage.route,
                    //     arguments: SearchArgs(
                    //       category: state.promotions[i],
                    //     ),
                    //   );
                    // }
                  },
                ),
              ),
            );
          },
        ),
        spacerM,
        Center(
          child: TextButton.icon(
            onPressed: () {
              if(!LocalDataRepository().isLogged){
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginPage.route, (route) => false);
              }else{
                Navigator.pushNamed(context, PromotionsPage.route);
              }
            },
            label: Image.asset(
              'assets/icons/arrow_next.png',
              scale: 2,
            ),
            icon: const Text(
              'Ir a todas',
              style: AppTextStyle.linkStyle,
            ),
          ),
        ),
      ],
    );
  }
  Future<dynamic> _callDialog(BuildContext context, {required String number}) {
    return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Text(
            number,
            // '${number.split('').getRange(0, 3).join()} ${number.split('').getRange(3, 6).join()} ${number.split('').getRange(6, 9).join()}',
            style: AppTextStyle.h3Style,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await launchUrlString('tel:$number');
              },
              child: const Text('Llamar'),
            ),
          ],
        );
      },
    );
  }
}

class _ProductsVemare extends StatelessWidget {
  const _ProductsVemare({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                state.headers.isEmpty
                    ? ''
                    : state.headers
                            .firstWhere((e) => e.module == "Category")
                            .landing ??
                        '',
                style: AppTextStyle.h1Style,
              ),
            );
          },
        ),
        SizedBox(
          height: 156,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state.loading) {
                return const MyShimmer(borderRadius: 4);
              }
              return PageView.builder(
                itemCount: state.products.length,
                controller: PageController(initialPage: 0, viewportFraction: 0.9),
                itemBuilder: (context, i) => CardProducts(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      TypeOfVehiclePage.route, /*arguments: state.products[i]*/
                    );
                  },
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  icon: state.products[i].image != null
                      ? Image.network(state.products[i].image!)
                      : const SizedBox(),
                  title: state.products[i].name ?? '',
                  content: state.products[i].subtitle ?? '',
                ),
              );
            },
          ),
        ),
        spacerM,
        Center(
          child: TextButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, TypeOfVehiclePage.route);
            },
            label: Image.asset(
              'assets/icons/arrow_next.png',
              scale: 2,
            ),
            icon: const Text(
              'Ver todos',
              style: AppTextStyle.linkStyle,
            ),
          ),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.loading) {
              return MyShimmer(
                height: MediaQuery.of(context).size.width * .5,
              );
            }
            return SizedBox(
              height: MediaQuery.of(context).size.width * .5,
              child: PageView.builder(
                itemCount: state.brands.length,
                controller: PageController(initialPage: 1, viewportFraction: 0.5),
                itemBuilder: (context, i) => ClipRRect(
                  child: InkWell(
                    onTap: (){
                      if(state.brands[i].link .isNotEmpty){
                        Navigator.push(context, MaterialPageRoute(builder:
                            (BuildContext context) => WebViewGlobal(
                          url: state.brands[i].link,
                          local: false,
                        )));
                      }
                    },
                    child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(120),
                        ),
                        margin: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Image.network(
                          state.brands[i].image!, fit: BoxFit.cover,
                          // scale: 2,
                        )),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}



