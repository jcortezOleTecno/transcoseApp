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
import 'package:vemare/app/view/my_services/campus/provider/campus_detail_provider.dart';
import 'package:vemare/app/view/my_services/campus/widgets/campus_index.dart';
import 'package:vemare/app/view/my_services/campus/widgets/campus_presentation.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class CampusDetailPage extends StatefulWidget {
  const CampusDetailPage({super.key, required this.campusModel});
  static const route = '/campus_detail_page';
  final CampusModel campusModel;
  @override
  State<CampusDetailPage> createState() => _CampusPageState();
}

class _CampusPageState extends State<CampusDetailPage> {

  late CampusDetailProvider campusDetailProvider;
  double sizeH = 0;double sizeW = 0;

  @override
  Widget build(BuildContext context) {
    sizeH = MediaQuery.of(context).size.height;
    sizeW = MediaQuery.of(context).size.width;
    return Scaffold(
      body: MyBody(
        child: ChangeNotifierProvider(
            create: (context1) => CampusDetailProvider(
              getIt.get<CampusRepository>(),
              data: {
                'campusModel' : widget.campusModel
              }
            ),
            child: Consumer<CampusDetailProvider>(
                builder: (context2, provider, child){
                  campusDetailProvider = provider;

                  String title = campusDetailProvider.campus.title;
                  Image imageObjet = Image.network(campusDetailProvider.campus.image,fit: BoxFit.fitHeight,);
                  String description = campusDetailProvider.campus.description;// Lorem ipsum dolor sit amet consectetur. Dictumst morbi varius quam convallis fames aliquet fermentum morbi faucibus. Magna quis ultrices tristique quis aliquam. Non placerat semper convallis rutrum a eu et.';

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
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
                                    Text(' ${campusDetailProvider.campus.quantityTopics} temas', style: AppTextStyle.defaultStyle.copyWith(
                                        color: AppColor.neutral,fontSize: 16
                                    ),maxLines: 1)
                                  ],
                                ),
                              ),
                              spacerS,
                              Text(description, style: AppTextStyle.defaultStyle.copyWith(fontSize: 18)),
                              spacerXL,
                              if(campusDetailProvider.loadData)...[
                                Column(
                                  children: List.generate(4,(_) => const MyShimmer(
                                      borderRadius: 3,
                                      height: 120,
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                    ),
                                  ),
                                )
                              ]else...[
                                SizedBox(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded( child: cardButtons(type: 0),),
                                      Expanded( child: cardButtons(type: 1),),
                                    ],
                                  ),
                                ),
                                if(campusDetailProvider.pageSelect == 0)...[
                                  const CampusPresentation(),
                                ]else...[
                                  const CampusIndex(),
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

  Widget cardButtons({required int type}){
    String title = type == 0 ? 'Presentación' : 'Índice';
    bool select = campusDetailProvider.pageSelect == type;

    return InkWell(
      onTap: (){
        campusDetailProvider.pageSelect = type;
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: select ? AppColor.blue100 : Colors.transparent,
              child: Center(
                child: Text(title,style: AppTextStyle.h12StyleNeu40W700.copyWith(
                    fontSize: 20, color: AppColor.primary, fontWeight: select ? FontWeight.bold : FontWeight.normal
                ),),
              ),
            ),
            Container(
              width: double.infinity,height: 2,
              color: select ? AppColor.primary : AppColor.blue100,
            ),
          ],
        ),
      ),
    );
  }
}
