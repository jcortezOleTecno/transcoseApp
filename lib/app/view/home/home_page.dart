import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:nested_scroll_views/nested_scroll_views.dart';
import 'package:vemare/app/data/brands_repository.dart';
import 'package:vemare/app/data/home_repository.dart';
import 'package:vemare/app/data/notices_repository.dart';
import 'package:vemare/app/data/products_repository.dart';
import 'package:vemare/app/data/promotion_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/services_repository.dart';
import 'package:vemare/app/data/work_with_us_repository.dart';
import 'package:vemare/app/data/workshops_repository.dart';
import 'package:vemare/app/domain/model/encuesta.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_cards/my_promotions_card.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_listile/my_listile.dart';
import 'package:vemare/app/view/_components/my_cards/my_products_card.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/home/bloc/home_cubit.dart';
import 'package:vemare/app/view/home/bloc/home_state.dart';
import 'package:vemare/app/view/my_services/events/events_page.dart';
import 'package:vemare/app/view/my_services/formations/formations/formations_page.dart';
import 'package:vemare/app/view/my_services/services/service_general.dart';
import 'package:vemare/app/view/my_services/services/services_page.dart';
import 'package:vemare/app/view/news/news_detail.dart';
import 'package:vemare/app/view/news/news_page.dart';
import 'package:vemare/app/view/our_products/product/product_page.dart';
import 'package:vemare/app/view/our_products/type_of_vehicle/type_of_vehicle_page.dart';
import 'package:vemare/app/view/promotions/promotion/promotion_page.dart';
import 'package:vemare/app/view/promotions/promotions_categories/promotions_page.dart';
import 'package:vemare/app/view/shared/userbloc/user_cubit.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/work_with_us/work_with_us_page.dart';
import 'package:vemare/app/view/workshop_networks/workshop_networks_page.dart';
import 'package:vemare/config/service_locator.dart';

import '../../data/encuestas_repository.dart';
import '../_components/my_input/my_input.dart';
import '../my_notifications/my_notifications_page.dart';

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
      ),
      child: const HomePage._(),
    );
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    FirebaseMessaging.instance.getInitialMessage().then((message) => {
          if (message != null)
            {Navigator.pushNamed(context, MyNotificationsPage.route)}
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyBody(
      child: NestedPageView(
        scrollDirection: Axis.vertical,
        children: const [
          _PageA(),
          _PageB(),
        ],
      ),
    ));
  }
}

class EncuestaWidget extends StatefulWidget {
  const EncuestaWidget(
    this.data, {
    Key? key,
  }) : super(key: key);

  final Encuestas data;

  @override
  State<EncuestaWidget> createState() => _EncuestaWidgetState();
}

class _EncuestaWidgetState extends State<EncuestaWidget> {
  bool loading = false;
  int? stars = 3;
  String? comment;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close))
              ],
            ),
            Text(
              widget.data.dataEncuesta?.name ?? '',
              textAlign: TextAlign.center,
              style: AppTextStyle.h2Style,
            ),
            spacerS,
            MyHtml(text: widget.data.dataEncuesta?.message ?? ''),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: AppColor.primaryBlue,
              ),
              onRatingUpdate: (rating) {
                stars = rating.toInt();
              },
            ),
            spacerM,
            MyInput(
              label: 'Ayúdanos a mejorar:',
              hintText: 'Escribe aquí...',
              maxLines: 6,
              textInputAction: TextInputAction.newline,
              onChanged: (p) {
                setState(() {
                  comment = p;
                });
              },
              inputType: TextInputType.multiline,
            ),
            spacerS,
            MyButton(
              onPressed: () async {
                setState(() {
                  loading = true;
                });
                var message = await getIt
                    .get<EncuestasRepository>()
                    .sendEncuestas(
                        id: widget.data.dataEncuesta!.id!.toString(),
                        stars: stars.toString(),
                        comment: comment ?? '');
                setState(() {
                  loading = true;
                });
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop(message);
              },
              text: 'Aceptar',
              width: double.infinity,
              isLoading: loading,
            ),
          ],
        ),
      ),
    );
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
      children: [
        const _Background(),
        Padding(
            padding: const EdgeInsets.all(15),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const MySpacer(height: 200),
                            Text(
                              '¡Bienvenido${LocalDataRepository().isLogged ? ', ${LocalDataRepository().user?.responsibleName ?? ''}!' : '!'}',
                              style: AppTextStyle.homeStyle,
                            ),
                            spacerM,
                          ],
                        ),
                      ),
                    ),
                    MyIconButton(
                      onPressed: () =>
                          cubit.openWhatsApp(phone: '+584261886623'),
                      text: 'Escribir un Whatsapp',
                      icon: const Icon(Icons.whatsapp),
                      variant: MyButtonVariant.outlinedBold,
                    ),
                    spacerM,
                    MyIconButton(
                      onPressed: () =>
                          cubit.openEmail(toEmail: 'vemare@gmail.com'),
                      text: 'Escribir un email',
                      icon: const Icon(Icons.mail_outline),
                      variant: MyButtonVariant.outlinedBold,
                    ),
                    spacerM,
                  ],
                );
              },
            ))
      ],
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.hero.isEmpty
            ? const MyShimmer.full()
            : Swiper(
                itemCount: state.hero.length,
                itemHeight: size.height,
                itemWidth: size.width,
                autoplay: true,
                autoplayDelay: 3000,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(state.hero[i].image ?? ''),
                            fit: BoxFit.cover,
                          ),
                        ),
                        width: size.width,
                        height: size.height - 80,
                      ),
                      const MyFilterImage(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MySpacer(height: 250),
                            Text(
                              state.hero[i].title ?? '',
                              style: AppTextStyle.h1Style.copyWith(
                                  color: AppColor.white, fontSize: 58),
                            ),
                            spacerS,
                            MyHtml(
                              text: state.hero[i].description ?? '',
                              color: Colors.white,
                            ),
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
    final cubit = context.watch<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (p, c) {
        return c.encuesta?.openModal == 1 &&
            c.encuesta?.dataEncuesta?.id != p.encuesta?.dataEncuesta?.id;
      },
      listener: (context, state) {
        if (state.encuesta?.openModal == 1) {
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
        }
      },
      builder: (context, state) {
        return Container(
          color: AppColor.white,
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 30),
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
              Center(
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, WorkWithUsPage.route,
                        arguments: state.workWithUs);
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
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(state.notices[i].image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          const MyFilterImage(),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const MySpacer(height: 80),
                                Row(
                                  children: [
                                    Text(
                                      state.notices[i].title ?? '',
                                      style: AppTextStyle.h3Style.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.white),
                                    ),
                                  ],
                                ),
                                spacerS,
                                Expanded(
                                  child: MyHtml(
                                    text: state.notices[i].subtitle ?? '',
                                    color: Colors.white,
                                  ),
                                )
                                // Text(
                                //   state.notices[i].description ?? '',
                                //   maxLines: 4,
                                //   overflow: TextOverflow.ellipsis,
                                //   style: AppTextStyle.contentCard
                                //       .copyWith(color: Colors.white),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                      state.workWithUs?.title ?? '',
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
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image(
                        image: NetworkImage(state.workWithUs?.image ?? ''),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width * .90,
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            'Redes de talleres',
            style: AppTextStyle.h1Style,
          ),
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
              children: state.workshop
                  .map(
                    (e) => MyListile(
                      icon: Image.network(e.image!, fit: BoxFit.cover),
                      title: e.name ?? '',
                      onTap: () => Navigator.pushNamed(
                        context,
                        WorkshopNetworksPage.route,
                        arguments: e.id,
                      ),
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
              Image(
                image: NetworkImage(state.services.last.image!),
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
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                              child: MyHtml(
                            text: state.services.last.subtitle ?? '',
                            color: Colors.white,
                          ) /*Text(
                            state.services.last.description ?? '',
                            style: AppTextStyle.contentCard.copyWith(
                              color: AppColor.white,
                              fontSize: 18,
                              height: 1.8,
                            ),*/
                              // )
                              )
                        ],
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Servicios',
            style: AppTextStyle.h1Style,
          ),
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
                        Image(
                          image: NetworkImage(state.services[i].image!),
                          fit: BoxFit.cover,
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Promociones',
            style: AppTextStyle.h1Style,
          ),
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
              height: 148,
              child: PageView.builder(
                itemCount: state.promotions.length,
                controller:
                    PageController(initialPage: 0, viewportFraction: 0.9),
                itemBuilder: (context, i) => MySingleCard(
                  title: state.promotions[i].name ?? '',
                  content: state.promotions[i].subtitle ?? '',
                  icon: Image.network(
                    state.promotions[i].image ?? '',
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      PromotionPage.route,
                      arguments: SearchArgs(
                        category: state.promotions[i],
                      ),
                    );
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
              Navigator.pushNamed(context, PromotionsPage.route);
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Productos Vemare',
            style: AppTextStyle.h1Style,
          ),
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
                controller:
                    PageController(initialPage: 0, viewportFraction: 0.9),
                itemBuilder: (context, i) => CardProducts(
                  onTap: () {
                    Navigator.pushNamed(context, ProductPage.route,
                        arguments: SearchArgs(category: state.products[i]));
                  },
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  icon: Image.network(state.products[i].image!),
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
                controller:
                    PageController(initialPage: 1, viewportFraction: 0.5),
                itemBuilder: (context, i) => ClipRRect(
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
            );
          },
        ),
      ],
    );
  }
}
