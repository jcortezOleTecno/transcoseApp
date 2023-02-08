import 'package:flutter/material.dart';
import 'package:nested_scroll_views/nested_scroll_views.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_listile/my_listile.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/our_products/type_of_vehicle_page.dart';
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
          const _Formaciones(),
          spacerL,
          const _AD360(),
          const _RedesTalleres(),
          spacerL,
          const _TrabajaConNosotros(),
          spacerL,
          const _Noticias(),
          spacerM,
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
          height: MediaQuery.of(context).size.width,
          child: LayoutBuilder(builder: (context, constrains) {
            return PageView.builder(
              itemCount: 3,
              controller: PageController(initialPage: 0, viewportFraction: 0.9),
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: constrains.maxHeight * .45,
                      child: const Image(
                        image: AssetImage('assets/imgs/Rectangle.png'),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Convención MIllennium 2022',
                            style: AppTextStyle.h3Style
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          spacerS,
                          const Text(
                            'Con inmensas ganas de volver junto a nuestros clientes nos citamos en Toledo para celebrar nuestra Convención.',
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.contentCard,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton.icon(
                        onPressed: () {},
                        label: Image.asset(
                          'assets/icons/arrow_next.png',
                          scale: 2,
                        ),
                        icon: const Text(
                          'Leer más',
                          style: AppTextStyle.linkStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        )
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
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, WorkWithUsPage.route);
      },
      child: SizedBox(
        height: 230,
        width: double.infinity,
        child: Stack(fit: StackFit.expand, children: [
          const Image(
            image: AssetImage('assets/imgs/trabaconnosotrosIMG.png'),
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
                      'Trabaja con nosotros',
                      style: AppTextStyle.linkStyle
                          .copyWith(color: AppColor.white, fontSize: 20),
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

class _Formaciones extends StatelessWidget {
  const _Formaciones({
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
            'Formaciones',
            style: AppTextStyle.h1Style,
          ),
        ),
        SizedBox(
          height: 225,
          child: PageView.builder(
            itemCount: 3,
            controller: PageController(initialPage: 0, viewportFraction: 0.9),
            itemBuilder: (context, index) => Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const Image(
                    image: AssetImage('assets/imgs/formacionesIMG.png'),
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
                              'Lorem ipsum dolor sit amet',
                              style: AppTextStyle.linkStyle
                                  .copyWith(color: AppColor.white),
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
                          child: SizedBox(
                              child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nullam tortor, libero lorem quis feugiat.',
                            style: AppTextStyle.contentCard
                                .copyWith(color: AppColor.white),
                          )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        spacerM,
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
            itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.blue100,
                        ),
                        height: 40,
                        width: 40,
                        child: Image.asset(
                          'assets/icons/star.png',
                          scale: 2,
                        ),
                      ),
                      spacerS,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            spacerXs,
                            Text(
                              'Máquinas Bosh',
                              style: AppTextStyle.linkStyle,
                            ),
                            spacerXs,
                            Text(
                              'Sólo durante este mes consigue una botella de vino Rioja Reserva por cada motor de arranque o alternador de la marca.',
                              style: AppTextStyle.contentCard,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
        spacerM,
        Center(
          child: TextButton.icon(
            onPressed: () {},
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
            itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.blue100,
                        ),
                        height: 60,
                        width: 60,
                        child: Image.asset(
                          'assets/icons/Carrocería.png',
                          scale: 2,
                        ),
                      ),
                      spacerS,
                      Expanded(
                        child: Column(
                          children: [
                            spacerXs,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Carroceria',
                                  style: AppTextStyle.linkStyle,
                                ),
                                Image.asset(
                                  'assets/icons/arrow_next.png',
                                  scale: 2,
                                ),
                              ],
                            ),
                            spacerS,
                            const Text(
                              'Profesionalidad y servicio unidos a nuestra completa gama de productos, garantizan un excelente resultado. ',
                              style: AppTextStyle.contentCard,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )),
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
