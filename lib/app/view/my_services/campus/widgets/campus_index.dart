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

class CampusIndex extends StatefulWidget {
  const CampusIndex({super.key});
  @override
  State<CampusIndex> createState() => _CampusIndexState();
}

class _CampusIndexState extends State<CampusIndex> {

  late CampusDetailProvider campusDetailProvider;
  double sizeH = 0;double sizeW = 0;

  @override
  Widget build(BuildContext context) {

    sizeH = MediaQuery.of(context).size.height;
    sizeW = MediaQuery.of(context).size.width;
    campusDetailProvider = Provider.of<CampusDetailProvider>(context);

    return Column(
      children: [
        spacerM,
        ...campusDetailProvider.topics.map((e) => cardCampus(topicsModel: e)).toList(),
        spacerM,spacerM,
      ],
    );
  }

  Widget cardCampus({required TopicsModel topicsModel}){
    return SizedBox(
      width: sizeW,
      child: GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  campusDetailProvider.topicSelect = topicsModel;
                  Navigator.pushNamed(
                    context,
                    CampusTest.route,
                    arguments: campusDetailProvider,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        topicsModel.title,
                        style: AppTextStyle.h1Style.copyWith(
                          color: AppColor.primaryBlue
                        ),
                      ),
                    ),
                    spacerS,
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColor.blue100,
                        shape: BoxShape.circle,
                      ),
                      child: SizedBox(
                        width: sizeH * 0.03,
                        height: sizeH * 0.03,
                        child: Image.asset(
                          'assets/icons/arrow_next.png',
                          color: AppColor.primaryBlue,
                        ),
                      ),
                    )
                  ],
                ),
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
                    ),maxLines: 1)
                    // Text(' ${topicsModel.duration.hour} hora${topicsModel.duration.hour > 1 ? 's' : ''} y ${topicsModel.duration.minute} minuto${topicsModel.duration.minute > 10 ? 's' : ''}', style: AppTextStyle.defaultStyle.copyWith(
                    //     color: AppColor.neutral,fontSize: 16
                    // ),maxLines: 1)
                  ],
                ),
              ),
              spacerS,
              ...topicsModel.sections.map((e) => cardChapter(chapters: e)).toList(),
              spacerS,
              Container(
                width: double.infinity,height: 1,
                color: AppColor.blue100,
              ),
              spacerS,
            ],
          ),
        ),
      ),
    );
  }

  Widget cardChapter({required ChaptersModel chapters}){
    return SizedBox(
      width: sizeW,
      child: Column(
        children: [
          spacerS,
          SizedBox(
            width: sizeW,
            child: Row(
              children: [
                SizedBox(
                  width: sizeH * 0.025,
                  height: sizeH * 0.025,
                  child: Image.asset(
                    'assets/icons/play.png',
                    color: AppColor.neutral,
                  ),
                ),
                Text(' ${chapters.title}', style: AppTextStyle.h1Style.copyWith(
                    color: AppColor.neutral,fontSize: 24
                ),maxLines: 1)
              ],
            ),
          ),
          spacerS,
          // MyHtml(text: chapters.description,bodyFontSize: 16,maxLines: 3,color: AppColor.neutral),
          SizedBox(
            width: sizeW,
            child: Text(chapters.subtitle, style: AppTextStyle.defaultStyle.copyWith(fontSize: 18),maxLines: 4,overflow: TextOverflow.ellipsis,),
          ),
          spacerS,
        ],
      ),
    );
  }
}
