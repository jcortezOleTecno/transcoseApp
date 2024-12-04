import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/campus_repository.dart';
import 'package:vemare/app/domain/model/campus_model.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/campus/provider/campus_provider.dart';
import 'package:vemare/app/view/my_services/campus/widgets/campus_detail_page.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class CampusArg {
  final String title;
  final String image;
  final String description;

  CampusArg(this.title, this.image, this.description);
}

class CampusPage extends StatefulWidget {
  const CampusPage({super.key, required this.title, required this.description, required this.image});
  static const route = '/campus_page';

  final String title;
  final String description;
  final String image;

  @override
  State<CampusPage> createState() => _CampusPageState();
}

class _CampusPageState extends State<CampusPage> {

  late CampusProvider campusProvider;
  double sizeH = 0;double sizeW = 0;

  @override
  Widget build(BuildContext context) {
    sizeH = MediaQuery.of(context).size.height;
    sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: MyBody(
        child: ChangeNotifierProvider(
            create: (context1) => CampusProvider(getIt.get<CampusRepository>()),
            child: Consumer<CampusProvider>(
                builder: (context2, provider, child){
                  campusProvider = provider;

                  String title = widget.title; //'Campus Vemare';
                  Image imageObjet = Image.network(widget.image,fit: BoxFit.fitHeight,); //Image.asset("assets/imgs/banner-formaciones.jpg");
                  String description = widget.description; //'Consulta las formaciones disponibles para los profesionales de la reparación: electromecánica, diagnosis, carrocería, gestión comercial...';

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          //alignment: Alignment.center,
                          width: double.infinity,
                          height: 220,
                          child: imageObjet,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerLeft,
                                child: const MyBackButton(),
                              ),
                              Text(title,style: AppTextStyle.h1Style),
                              Text(description, style: AppTextStyle.defaultStyle.copyWith(fontSize: 18)),
                              spacerXL,
                              Text('Todos nuestros cursos',style: AppTextStyle.h1Style.copyWith(
                                fontSize: 28
                              )),
                              spacerS,
                              if(campusProvider.loadData)...[
                                Column(
                                  children: List.generate(4,(_) => const MyShimmer(
                                      borderRadius: 3,
                                      height: 120,
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                    ),
                                  ),
                                )
                              ]else...[
                                if(campusProvider.campus.isEmpty)...[
                                  spacerS,
                                  const NoExistWidget('' ,textLlong: 'No existen campus disponibles',paddingTop: 40),
                                  spacerM,spacerM,
                                ]else...[
                                  spacerS,
                                  ...campusProvider.campus.map((e) => cardCampus(campus: e)).toList(),
                                  spacerM,
                                ]
                              ]
                            ],
                          ),
                        ),
                        const Footer(),
                      ],
                    ),
                  );
                }
            )
        ),
      ),
    );
  }

  Widget cardCampus({required CampusModel campus}){
    return SizedBox(
      width: sizeW,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            CampusDetailPage.route,
            arguments: campus,
          );
        },
        child: Card(
          margin: const EdgeInsets.only(bottom: 20),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(children: [
            Stack(
              children: [
                MyNetworkImage(
                  image: campus.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                if(campus.completed)...[
                  Positioned(
                    top: 15,right: 0,
                    child: containerType1(),
                  ),
                ]
              ],
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          campus.title,
                          style: AppTextStyle.h3Style.copyWith(
                            color: AppColor.primaryBlue,
                          ),
                        ),
                      ),
                      spacerS,
                      Image.asset(
                        'assets/icons/arrow_next.png',
                        color: AppColor.primaryBlue,
                        scale: 2,
                      )
                    ],
                  ),
                  spacerS,
                  SizedBox(
                    width: sizeW,
                    child: Row(
                      children: [
                        SizedBox(
                          width: sizeH * 0.02,
                          height: sizeH * 0.02,
                          child: Image.asset(
                            'assets/icons/length_topics.png',
                            color: AppColor.neutral,
                          ),
                        ),
                        Text(' ${campus.quantityTopics} temas', style: AppTextStyle.defaultStyle.copyWith(
                            color: AppColor.neutral,fontSize: 16
                        ),maxLines: 1)
                      ],
                    ),
                  ),
                  spacerS,
                  Text(campus.description, style: AppTextStyle.defaultStyle.copyWith(
                      color: AppColor.neutral,fontSize: 16
                  ),maxLines: 3),
                  spacerS,
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget containerType1(){
    String title = 'Completado';
    return Container(
      padding: const EdgeInsets.only(right: 20.0,left: 20,top: 5,bottom: 5),
      decoration: const BoxDecoration(
        color: AppColor.primary,
        borderRadius:  BorderRadius.only(
            topLeft: Radius.circular(30),bottomLeft: Radius.circular(30),
            topRight: Radius.circular(0.0),bottomRight: Radius.circular(0.0)
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title,style: AppTextStyle.linkStyle.copyWith(color: AppColor.white,fontSize: 18)),
          SizedBox(
            height: 25,width: 25,
            child: Image.asset(
              'assets/icons/check_promo.png',color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
