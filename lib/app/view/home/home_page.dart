import 'package:flutter/material.dart';
import 'package:nested_scroll_views/nested_scroll_views.dart';
import 'package:vemare/app/data/services_data.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_cards/my_promotions_card.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_listile/my_listile.dart';
import 'package:vemare/app/view/_components/my_cards/my_products_card.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/formations.dart';
import 'package:vemare/app/view/my_services/service_general.dart';
import 'package:vemare/app/view/my_services/services_page.dart';
import 'package:vemare/app/view/our_products/product/product_page.dart';
import 'package:vemare/app/view/our_products/type_of_vehicle_page.dart';
import 'package:vemare/app/view/promotions/promotion/promotion_page.dart';
import 'package:vemare/app/view/promotions/promotions_page.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/work_with_us/work_with_us_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({this.logged = false, super.key});
  final bool logged;

  static const route = '/home';

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
    return Stack(
      children: [
        const _Background(),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const MySpacer(height: 200),
              const Text(
                '¡Bienvenido, Marcos!',
                style: AppTextStyle.homeStyle,
              ),
              spacerM,
              Text(
                'Grupo Vemare',
                style: AppTextStyle.h1Style
                    .copyWith(color: AppColor.white, fontSize: 58),
              ),
              spacerM,
              const Text(
                'Proveedores originales, productos multimarca de Calidad, equipamiento para el taller y servicios, con el soporte de la principal red de distribución de recambios de Europa, AD Parts.',
                style: AppTextStyle.homeStyle,
              ),
              const Spacer(),
              MyIconButton(
                onPressed: () {},
                text: 'Escribir un Whatsapp',
                icon: const Icon(Icons.whatsapp),
                variant: MyButtonVariant.outlinedBold,
              ),
              spacerM,
              MyIconButton(
                onPressed: () {},
                text: 'Escribir un email',
                icon: const Icon(Icons.mail_outline),
                variant: MyButtonVariant.outlinedBold,
              ),
              spacerM,
            ],
          ),
        )
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
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/imgs/img_home.png'),
              fit: BoxFit.cover,
            ),
          ),
          width: size.width,
          height: size.height - 80,
        ),
        const MyFilterImage()
      ],
    );
  }
}

class _PageB extends StatelessWidget {
  const _PageB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          const _AD360(),
          const _RedesTalleres(),
          spacerL,
          const _Noticias(),
          spacerL,
          const _TrabajaConNosotros(),
          spacerM,
          Center(
            child: TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, WorkWithUsPage.route);
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
  }
}

class _Noticias extends StatelessWidget {
  const _Noticias({
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
        SizedBox(
          height: 220,
          child: PageView.builder(
            itemCount: 3,
            controller: PageController(initialPage: 0, viewportFraction: 0.9),
            itemBuilder: (context, index) => Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/imgs/Rectangle.png'),
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
                                'Convención MIllennium 2022',
                                style: AppTextStyle.h3Style.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.white),
                              ),
                            ],
                          ),
                          spacerS,
                          Text(
                            'Con inmensas ganas de volver junto a nuestros clientes nos citamos en Toledo para celebrar nuestra Convención.',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.contentCard
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Center(
          child: TextButton.icon(
            onPressed: () {},
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
    return SizedBox(
      // height: 230,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: const [
                Text(
                  'Trabaja con nosotros',
                  style: AppTextStyle.h1Style,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: const AssetImage('assets/imgs/trabaconnosotrosIMG.png'),
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * .90,
            ),
          ),
        ],
      ),
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
        MyListile(
          onTap: () {},
          title: 'Expert Service Car',
          icon: Image.asset(
            'assets/imgs/logoTaller.png',
            scale: 2,
          ),
        ),
        MyListile(
          onTap: () {},
          title: 'Expert Service Car',
          icon: Image.asset(
            'assets/imgs/logoTaller.png',
            scale: 2,
          ),
        ),
        MyListile(
          onTap: () {},
          title: 'Expert Service Car',
          icon: Image.asset(
            'assets/imgs/logoTaller.png',
            scale: 2,
          ),
        ),
      ],
    );
  }
}

class _AD360 extends StatelessWidget {
  const _AD360({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * .80,
      width: double.infinity,
      child: Stack(fit: StackFit.expand, children: [
        const Image(
          image: AssetImage('assets/imgs/AD360IMG.png'),
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
                    'AD 360°',
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
                        child: Text(
                      'Accede a la plataforma de compra e información técnica del Grupo AD Parts. Solicita claves a tu comercial y benefíciate de esta gran herramienta.',
                      style: AppTextStyle.contentCard.copyWith(
                        color: AppColor.white,
                        fontSize: 18,
                        height: 1.8,
                      ),
                    ))
                  ],
                ),
              )
            ],
          ),
        )
      ]),
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
        SizedBox(
          height: 225,
          child: PageView.builder(
            itemCount: service.length,
            controller: PageController(initialPage: 0, viewportFraction: 0.9),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                if (service[index].name != 'Formaciones' &&
                    service[index].name != 'Eventos') {
                  Navigator.pushNamed(
                    context,
                    ServiceGeneralPage.route,
                    arguments: service[index],
                  );
                }
                if (service[index].name == 'Formaciones') {
                  Navigator.pushNamed(context, FormationsPage.route);
                }
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image(
                      image: AssetImage(service[index].img),
                      fit: BoxFit.cover,
                    ),
                    const MyFilterImage(),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: [
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                service[index].name,
                                style: AppTextStyle.h2Style
                                    .copyWith(color: AppColor.white),
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
        SizedBox(
          height: 148,
          child: PageView.builder(
            itemCount: 3,
            controller: PageController(initialPage: 0, viewportFraction: 0.9),
            itemBuilder: (context, index) => MySingleCard(
              title: 'Máquinas Bosh',
              content:
                  'Sólo durante este mes consigue una botella de vino Rioja Reserva por cada motor de arranque o alternador de la marca.',
              icon: Image.asset(
                'assets/icons/star.png',
                scale: 2,
              ),
              onTap: () {
                Navigator.pushNamed(context, PromotionPage.route);
              },
            ),
          ),
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
          height: 150,
          child: PageView.builder(
            itemCount: 3,
            controller: PageController(initialPage: 0, viewportFraction: 0.9),
            itemBuilder: (context, index) => CardProducts(
              onTap: () {
                Navigator.pushNamed(context, ProductPage.route);
              },
              icon: Image.asset('assets/icons/Carrocería.png', scale: 2),
              title: 'Carroceria',
              content:
                  'Profesionalidad y servicio unidos a nuestra completa gama de productos, garantizan un excelente resultado. ',
            ),
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
        SizedBox(
          height: MediaQuery.of(context).size.width * .5,
          child: PageView.builder(
            itemCount: 3,
            controller: PageController(initialPage: 1, viewportFraction: 0.5),
            itemBuilder: (context, index) => ClipRRect(
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(120),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      'assets/imgs/Continental.png',
                      scale: 2,
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
