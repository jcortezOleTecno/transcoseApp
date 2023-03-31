import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/events/event_detail_page.dart';
import 'package:vemare/app/view/my_services/events/my_events_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class EventsVemarePage extends StatelessWidget {
  const EventsVemarePage({super.key});
  static const route = '/events_vemare';

  @override
  Widget build(BuildContext context) {
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
                    const Text('Eventos Vemare', style: AppTextStyle.h1Style),
                    spacerS,
                    const Text(
                        'Encuentros, charlas, presentaciones... Infórmate sobre todos los eventos que creamos para nuestros clientes.',
                        style: AppTextStyle.defaultStyle),
                    spacerXL,
                  ],
                ),
              ),
              _MyEvents(
                  icon: true,
                  title: 'Mis Eventos',
                  onTap: () {
                    Navigator.pushNamed(context, MyEventsPage.route);
                  }),
              spacerS,
              ...List.generate(4, (i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: _MyEvents(
                    borderRadius: BorderRadius.circular(12),
                    title: 'Lorem ipsum',
                    onTap: () =>
                        Navigator.pushNamed(context, EventDetailPage.route),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}

class _MyEvents extends StatelessWidget {
  const _MyEvents({
    this.borderRadius,
    this.onTap,
    this.title,
    this.icon = false,
    Key? key,
  }) : super(key: key);

  final BorderRadiusGeometry? borderRadius;
  final String? title;
  final bool icon;
  final void Function()? onTap;
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
                      title ?? '',
                      style: AppTextStyle.linkStyle
                          .copyWith(color: AppColor.white, fontSize: 22),
                    ),
                    Visibility(
                      visible: icon,
                      child: Image.asset(
                        'assets/icons/arrow_next.png',
                        color: AppColor.white,
                        scale: 2,
                      ),
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
