import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/domain/model/campus_model.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/campus/provider/campus_detail_provider.dart';
import 'package:vemare/app/view/my_services/campus/widgets/campus_test.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class CampusPresentation extends StatefulWidget {
  const CampusPresentation({super.key});
  @override
  State<CampusPresentation> createState() => _CampusPresentationState();
}

class _CampusPresentationState extends State<CampusPresentation> {

  late CampusDetailProvider campusDetailProvider;
  double sizeH = 0;double sizeW = 0;

  @override
  Widget build(BuildContext context) {

    sizeH = MediaQuery.of(context).size.height;
    sizeW = MediaQuery.of(context).size.width;
    campusDetailProvider = Provider.of<CampusDetailProvider>(context);
    Image imageObjet = Image.asset("assets/imgs/banner-formaciones.jpg");

    return Column(
      children: [
        spacerXs,
        MyHtml(text: campusDetailProvider.campus.presentationText,bodyFontSize: 18),
        //cardTextInitial(txt: 'Lorem ipsum dolor sit amet consectetur. Dictumst morbi varius quam convallis fames aliquet fermentum morbi faucibus. Magna quis ultrices tristique quis aliquam. Non placerat semper convallis rutrum a eu et. Ultricies faucibus enim ullamcorper ut sed vel urna in. Condimentum eu tortor sed eget nibh. Blandit elementum mi viverra sit amet neque. Mi phasellus et lacus sit arcu in et diam risus. A lectus mauris semper cras leo molestie consectetur aenean velit. Donec ac quam non at vitae.\n\nDictum viverra enim non malesuada arcu habitant. Bibendum vivamus dignissim bibendum fermentum quis scelerisque magna. Turpis nisi lacus cras tempus purus molestie tempor duis. Commodo in tellus mi facilisis justo eget lorem. Massa a lectus fringilla et massa. Ipsum mollis commodo non viverra nisi urna lacus augue. Dictum adipiscing blandit turpis tincidunt posuere tristique consequat.'),
        spacerM,
        SizedBox(
          width: sizeW,
          child: const Text('Resumen de contenidos',style: AppTextStyle.h1Style,textAlign: TextAlign.left),
        ),
        cardTextInitial(txt: 'Consulta todos los temas de este curso que tienes disponibles.'),
        spacerM,
        ...campusDetailProvider.topics.map((e) => cardCampus(topicsModel: e)).toList(),
        spacerM,
        // SizedBox(
        //   width: sizeW,
        //   child: const Text('Requisitos y materiales',style: AppTextStyle.h1Style,textAlign: TextAlign.left),
        // ),
        SizedBox(
          width: sizeW,
          child: Text(campusDetailProvider.campus.requirementTitle,style: AppTextStyle.h1Style,textAlign: TextAlign.left),
        ),
        cardTextInitial(txt: campusDetailProvider.campus.requirementDescription),
        //cardTextInitial(txt: 'Dictum viverra enim non malesuada arcu habitant. Bibendum vivamus dignissim bibendum fermentum quis scelerisque magna. Turpis nisi lacus cras tempus purus molestie tempor duis. Commodo in tellus mi facilisis justo eget lorem. Massa a lectus fringilla et massa. Ipsum mollis commodo non viverra nisi urna lacus augue. Dictum adipiscing blandit turpis tincidunt posuere tristique consequat.'),
        spacerM,
        SizedBox(
          width: double.infinity,
          height: 220,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: MyNetworkImage(
              image: campusDetailProvider.campus.requirementImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            // child: Image.asset(
            //   "assets/imgs/banner-formaciones.jpg",
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
          ),
        ),
        spacerM,spacerM,
      ],
    );
  }

  Widget cardTextInitial({required String txt}){
    return SizedBox(
      width: sizeW,
      child: Text(txt,
          style: AppTextStyle.defaultStyle.copyWith(
          color: AppColor.neutral,fontSize: 18)),
    );
  }

  Widget cardCampus({required TopicsModel topicsModel}){
    return SizedBox(
      width: sizeW,
      child: GestureDetector(
        onTap: () async {
          campusDetailProvider.topicSelect = topicsModel;
          await Navigator.pushNamed(
            context,
            CampusTest.route,
            arguments: campusDetailProvider,
          );
          campusDetailProvider.getCampusDetails(id: campusDetailProvider.campus.id.toString());
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
                  image: topicsModel.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                if(topicsModel.completed)...[
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
                          topicsModel.title ?? '',
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
                            'assets/icons/hours2.png',
                            color: AppColor.neutral,
                          ),
                        ),
                        Text(' ${topicsModel.duration}', style: AppTextStyle.defaultStyle.copyWith(
                            color: AppColor.neutral,fontSize: 16
                        ),maxLines: 1),
                        // Text(' ${topicsModel.duration.hour} hora${topicsModel.duration.hour > 1 ? 's' : ''} y ${topicsModel.duration.minute} minuto${topicsModel.duration.minute > 10 ? 's' : ''}', style: AppTextStyle.defaultStyle.copyWith(
                        //     color: AppColor.neutral,fontSize: 16
                        // ),maxLines: 1)
                      ],
                    ),
                  ),
                  MyHtml(text: topicsModel.description,bodyFontSize: 16,maxLines: 3,color: AppColor.neutral),
                  // Text(topicsModel.description, style: AppTextStyle.defaultStyle.copyWith(
                  //     color: AppColor.neutral,fontSize: 16,
                  // ),maxLines: 3,),
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
