import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  static const route = '/about_us';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Sobre nosotros', style: AppTextStyle.h1Style),
              ),
              _OurHistory(),
              spacerL,
              _WhereWeAre(),
              spacerL,
              const _SocialNetworks(),
              spacerL,
              _News(),
              spacerM,
              _Library(),
              spacerL,
              _PillsVemare(),
              spacerL,
            ],
          ),
        ),
      ),
    );
  }
}

class _OurHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * .80,
      width: double.infinity,
      child: Stack(fit: StackFit.expand, children: [
        const Image(
          image: AssetImage('assets/imgs/our_history.png'),
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
                    'Nuestra historia',
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
              Column(
                children: [
                  SizedBox(
                      child: Text(
                    'Más de 65 años a su servicio como distribuidores de recambio de automovil original.',
                    style: AppTextStyle.contentCard.copyWith(
                      color: AppColor.white,
                      fontSize: 18,
                      height: 1.8,
                    ),
                  ))
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class _WhereWeAre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Stack(fit: StackFit.expand, children: [
        const Image(
          image: AssetImage('assets/imgs/donde_estamos.png'),
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
                    '¿Dónde estamos?',
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
            ],
          ),
        )
      ]),
    );
  }
}

class _SocialNetworks extends StatelessWidget {
  const _SocialNetworks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Redes Sociales', style: AppTextStyle.h1Style),
          spacerM,
          Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                item('Facebook', width),
                item('Instagram', width),
                item('YouTube', width),
                item('Twitter', width),
                item('LinkedIn', width),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget item(String text, double width) => SizedBox(
        width: width * .40,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.blue100,
              ),
              height: 40,
              width: 40,
              child: Image.asset(
                'assets/icons/$text.png',
                scale: 2,
              ),
            ),
            spacerS,
            Text(
              text,
              style: AppTextStyle.linkStyle,
            )
          ],
        ),
      );
}

class _News extends StatelessWidget {
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
            itemBuilder: (context, i) => Card(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/imgs/IMGeventos.png'),
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

class _Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bilioteca', style: AppTextStyle.h1Style),
          ...List.generate(2, (i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacerM,
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/imgs/IMGeventos.png',
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                spacerS,
                Text('Lorem ipsum dolor sit amet',
                    style: AppTextStyle.titleCard),
                spacerXs,
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit nisl mauris enim, aliquet tortor sollicitudin sem rhoncus.',
                    style: AppTextStyle.defaultStyle),
              ],
            );
          }),
          spacerS,
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

class _PillsVemare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Píldoras Vemare', style: AppTextStyle.h1Style),
          spacerS,
          ...List.generate(2, (i) {
            return Card(
              margin: const EdgeInsets.only(bottom: 20),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/imgs/IMGeventos.png',
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lorem ipsum dolor sit amet',
                            style: AppTextStyle.titleCard),
                        spacerXs,
                        Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit nisl mauris enim, aliquet tortor sollicitudin sem rhoncus.',
                            style: AppTextStyle.defaultStyle),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
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
