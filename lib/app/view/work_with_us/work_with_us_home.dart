import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/data/services_repository.dart';
import 'package:vemare/app/data/work_with_us_repository.dart';
import 'package:vemare/app/domain/model/work_with_us.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/my_services/events/events_page.dart';
import 'package:vemare/app/view/my_services/formations/formations/formations_page.dart';
import 'package:vemare/app/view/my_services/services/service_general.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/work_with_us/provider/work_with_us_home_provider.dart';
import 'package:vemare/app/view/work_with_us/work_with_us_general.dart';
import 'package:vemare/app/view/work_with_us/work_with_us_page.dart';
import 'package:vemare/config/service_locator.dart';

class WorkWithUsHome extends StatefulWidget {
  const WorkWithUsHome({super.key, required this.workWithUs});

  static const route = '/workWithUsHome';

  final WorkWithUs workWithUs;

  @override
  State<WorkWithUsHome> createState() => _WorkWithUsHomeState();
}

class _WorkWithUsHomeState extends State<WorkWithUsHome> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context1) => WorkWithUsHomeProvider(
        headerRepository: getIt.get<HeaderRepository>(),
        workWithUsRepository: getIt.get<WorkWithUsRepository>(),
      ),
      child: Consumer<WorkWithUsHomeProvider>(
        builder: (context2, provider, child){
          return MyTapToHideKeyboard(
            child: Scaffold(
              body: MyBody(
                spacerTop: 45,
                child: ListView(
                  children: [
                    MyNetworkImage(
                      image: widget.workWithUs.image ?? '',
                      height: 240,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: MyBackButton(
                        edgeInsets: EdgeInsets.symmetric(horizontal: 2,vertical: 0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                          widget.workWithUs.title ?? '',
                          style: AppTextStyle.h1Style),
                    ),
                    spacerXs,
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                      child: MyButton(
                        width: double.infinity,
                        onPressed: () {
                          Navigator.pushNamed(context, WorkWithUsPage.route,
                              arguments: widget.workWithUs);
                        },
                        text: 'Envía tu currículum',
                        variant: MyButtonVariant.containedPrimary,
                        childCenter: Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Image.asset(
                            'assets/icons/arrow_next.png',
                            scale: 2,color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    spacerXs,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text('Descubre más sobre nosotros',
                          style: AppTextStyle.h3Style),
                    ),
                    spacerS,
                    provider.loading
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
                      children: provider.services.map((e) => _CardService(
                        title: e.title ?? '',
                        image: NetworkImage(e.image!),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            WorkWithUsGeneral.route,
                            arguments: e,
                          );
                        },
                      ))
                          .toList(),
                    ),
                    spacerS,
                    const Footer(),
                  ],
                ),
              ),
            ),
          );
        }
      )
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
