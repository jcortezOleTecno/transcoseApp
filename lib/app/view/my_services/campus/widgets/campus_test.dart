import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/campus_model.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/my_video_player/my_video_player.dart';
import 'package:vemare/app/view/my_services/campus/provider/campus_detail_provider.dart';
import 'package:vemare/app/view/my_services/campus/widgets/campus_test_question.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class CampusTest extends StatefulWidget {
  const CampusTest({super.key, required this.campusDetailProvider});
  static const route = '/campus_test';
  final CampusDetailProvider campusDetailProvider;
  @override
  State<CampusTest> createState() => _CampusTestState();
}

class _CampusTestState extends State<CampusTest> {

  late CampusDetailProvider campusDetailProvider;
  double sizeH = 0;double sizeW = 0;
  bool openIndex = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 200)).then((value){
      initial();
    });
  }

  Future initial() async{
    if(campusDetailProvider.topicSelect!.completed && campusDetailProvider.topicSelect!.requireTest){
      await campusDetailProvider.getTestResult();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    sizeH = MediaQuery.of(context).size.height;
    sizeW = MediaQuery.of(context).size.width;
    campusDetailProvider = widget.campusDetailProvider;

    String title = campusDetailProvider.topicSelect!.title;

    bool isCompleted = campusDetailProvider.topicSelect!.completed;
    bool requiredTest = campusDetailProvider.topicSelect!.requireTest;
    String titleButton = '';
    bool viewArrow = false;
    if(isCompleted){
      if(requiredTest){
        titleButton = 'Ver resultados ';
        viewArrow = true;
      }else{
        titleButton = 'Completado ';
      }
    }else{
      if(requiredTest){
        titleButton = 'Ir al test ';
        viewArrow = true;
      }else{
        titleButton = 'Aceptar ';
      }
    }

    return Scaffold(
      body: MyBody(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spacerS,
              Container(
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                width: double.infinity,
                height: 220,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: MyNetworkImage(
                    image: campusDetailProvider.topicSelect!.image,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.centerLeft,
                child: const MyBackButton(),
              ),
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(title,style: AppTextStyle.h1Style),
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
                          Text(' ${campusDetailProvider.topicSelect!.duration}', style: AppTextStyle.defaultStyle.copyWith(
                              color: AppColor.neutral,fontSize: 16
                          ),maxLines: 1)
                          // Text(' ${campusDetailProvider.topicSelect!.duration.hour} hora${campusDetailProvider.topicSelect!.duration.hour > 1 ? 's' : ''} y ${campusDetailProvider.topicSelect!.duration.minute} minuto${campusDetailProvider.topicSelect!.duration.minute > 10 ? 's' : ''}', style: AppTextStyle.defaultStyle.copyWith(
                          //     color: AppColor.neutral,fontSize: 16
                          // ),maxLines: 1)
                        ],
                      ),
                    ),
                    spacerS,
                    MyHtml(text: campusDetailProvider.topicSelect!.description,bodyFontSize: 18,maxLines: 3,color: AppColor.neutral),
                    //Text(campusDetailProvider.topicSelect!.description, style: AppTextStyle.defaultStyle.copyWith(fontSize: 18)),
                    spacerS,spacerS,
                    Container(
                      width: double.infinity,height: 1,
                      color: AppColor.blue100,
                    ),
                    spacerS,spacerS,
                    ...campusDetailProvider.topicSelect!.sections.map((e) => cardChapter(chapter: e)).toList(),
                    if(isCompleted && requiredTest && campusDetailProvider.testResult != null)...[
                      spacerS,spacerS,
                      const Text('Resultados del test',style: AppTextStyle.h1Style),
                      SizedBox(
                        width: sizeW,
                        child: Row(
                          children: [
                            Icon(Icons.check_circle_outlined,color: AppColor.neutral,size: sizeH * 0.022,),
                            Text(' ${campusDetailProvider.testResult!.correctAnswer} respuestas correctas', style: AppTextStyle.defaultStyle.copyWith(
                                color: AppColor.neutral,fontSize: 16
                            ),maxLines: 1)
                          ],
                        ),
                      ),
                      SizedBox(
                        width: sizeW,
                        child: Row(
                          children: [
                            SizedBox(
                              width: sizeH * 0.02,
                              height: sizeH * 0.02,
                              child: Image.asset(
                                'assets/icons/sad.png',
                                color: AppColor.neutral,
                              ),
                            ),
                            // Icon(CupertinoIcons.smiley,color: AppColor.neutral,size: sizeH * 0.022,),
                            Text(' ${campusDetailProvider.testResult!.incorrectAnswer} respuestas incorrectas', style: AppTextStyle.defaultStyle.copyWith(
                                color: AppColor.neutral,fontSize: 16
                            ),maxLines: 1)
                          ],
                        ),
                      ),
                    ],
                    spacerS,spacerS,
                    MyButton(
                      onPressed: () async {
                        if(isCompleted){
                          if(requiredTest && campusDetailProvider.testResult != null){
                            Navigator.pushNamed(
                              context,
                              CampusTestQuestion.route,
                              arguments: [campusDetailProvider,true,campusDetailProvider.testResult],
                            );
                          }
                        }else{
                          if(requiredTest){
                            await Navigator.pushNamed(
                              context,
                              CampusTestQuestion.route,
                              arguments: [campusDetailProvider, false, null],
                            );
                          }else{
                            campusDetailProvider.completedTest(body: {
                              'topic_id' : campusDetailProvider.topicSelect!.id.toString()
                            });
                          }
                        }
                      },
                      text: titleButton,
                      width: double.infinity,
                      isLoading: campusDetailProvider.loadSendTest,
                      disabled: false,
                      childCenter: viewArrow ? Image.asset(
                        'assets/icons/arrow_next.png',
                        scale: 2,color: Colors.white,
                      ) : Container(),
                    ),
                    spacerS,spacerS,
                    cardIndex(),
                    spacerXL,
                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardChapter({required ChaptersModel chapter}){
    return SizedBox(
      width: sizeW,
      child: Column(
        children: [
          spacerS,
          SizedBox(
            width: sizeW,
            child: Row(
              children: [
                Text(chapter.title, style: AppTextStyle.h1Style.copyWith(
                    color: AppColor.neutral,fontSize: 24
                ),maxLines: 1)
              ],
            ),
          ),
          spacerS,
          MyHtml(text: chapter.description,bodyFontSize: 18,maxLines: 3,color: AppColor.neutral),
          // SizedBox(
          //   width: sizeW,
          //   child: Text(chapter.description, style: AppTextStyle.defaultStyle.copyWith(fontSize: 18),),
          // ),
          if(chapter.video.isNotEmpty)...[
            spacerS,
            SizedBox(
              width: sizeW,
              child: MyVideoPlayer(video: chapter.video),
            ),
          ],
          spacerS,spacerS,
          Container(
            width: double.infinity,height: 1,
            color: AppColor.blue100,
          ),
          spacerS
        ],
      ),
    );
  }

  Widget cardIndex(){
    return Container(
      width: sizeW,
      padding: EdgeInsets.symmetric(horizontal: sizeW * 0.05,vertical: sizeH * 0.015),
      decoration: BoxDecoration(
        color: AppColor.whiteF,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColor.blue100)
      ),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                openIndex = !openIndex;
              });
            },
            child: SizedBox(
              width: sizeW,
              child: Row(
                children: [
                  Expanded(
                    child: Text('Índice', style: AppTextStyle.h1Style.copyWith(
                        color: AppColor.neutral,fontSize: 24
                    ),maxLines: 1),
                  ),
                  Icon(openIndex ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: AppColor.primary,size: sizeH * 0.025,),
                ],
              ),
            ),
          ),
          if(openIndex)...[
            SizedBox(height: sizeH * 0.02,),
             ...campusDetailProvider.topics.map((e) =>
                 cardCampus(topics: e)).toList()
          ],
        ],
      ),
    );
  }

  Widget cardCampus({required TopicsModel topics}){
    if(topics.id == campusDetailProvider.topicSelect!.id){
      return Container(
        width: sizeW,
        margin: EdgeInsets.only(bottom: sizeH * 0.02),
        child: Row(
          children: [
            SizedBox(
              width: sizeH * 0.04,
              height: sizeH * 0.04,
              child: Image.asset(
                'assets/icons/arrow_index_play.png',
                color: AppColor.primary,
              ),
            ),
            SizedBox(width: sizeW * 0.02,),
            Expanded(
              child: Text(topics.title, style: AppTextStyle.h1Style.copyWith(
                  color: AppColor.neutral,fontSize: sizeH * 0.035
              ),maxLines: 1),
            ),
          ],
        ),
      );
    }
    return InkWell(
      onTap: (){
        campusDetailProvider.topicSelect = topics;
        Navigator.pushReplacementNamed(
          context,
          CampusTest.route,
          arguments: campusDetailProvider,
        );
      },
      child: Container(
        width: sizeW,
        margin: EdgeInsets.only(bottom: sizeH * 0.02),
        child: Text(topics.title, style: AppTextStyle.h1Style.copyWith(
            color: AppColor.neutral20,fontSize: sizeH * 0.025
        ),maxLines: 1),
      ),
    );
  }
}
