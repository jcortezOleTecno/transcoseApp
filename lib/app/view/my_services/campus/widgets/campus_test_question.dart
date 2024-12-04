import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/campus_model.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/campus/provider/campus_detail_provider.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class CampusTestQuestion extends StatefulWidget {
  const CampusTestQuestion({super.key, required this.campusDetailProvider,this.testResult,this.viewResult = false});
  static const route = '/campus_test_question';
  final CampusDetailProvider campusDetailProvider;
  final TestResult? testResult;
  final bool viewResult;
  @override
  State<CampusTestQuestion> createState() => _CampusTestQuestionState();
}

class _CampusTestQuestionState extends State<CampusTestQuestion> {

  late CampusDetailProvider campusDetailProvider;
  double sizeH = 0;double sizeW = 0;
  Map<String,bool> questionMap = {};
  bool isLoad = false;
  bool isAnswer = false;

  @override
  void initState() {
    super.initState();
    initialData();
  }

  Future initialData() async{

    await Future.delayed(const Duration(milliseconds: 300));
    await campusDetailProvider.getTest();

    for (var question in campusDetailProvider.test) {
      for (var element in question.options) {
        questionMap['${question.id}-${element.line}'] = false;
      }
    }

    if(widget.viewResult){
      isAnswer = true;
      for (var element in widget.testResult!.questionsAnswered) {
        for(int x = 0; x < element.options.length; x++){
          questionMap['${element.questionId}-$x'] = element.options[x].selectedOption;
        }
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    sizeH = MediaQuery.of(context).size.height;
    sizeW = MediaQuery.of(context).size.width;
    campusDetailProvider = widget.campusDetailProvider;

    String title = campusDetailProvider.topicSelect!.title;

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
                child: MyBackButton(
                  onTap: (){
                    if(isAnswer && !widget.viewResult){
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    }else{
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
              Container(
                width: sizeW,
                margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(title,style: AppTextStyle.h1Style),
                    spacerS,
                    MyHtml(text: campusDetailProvider.topicSelect!.description,bodyFontSize: 18),
                    //Text(campusDetailProvider.topicSelect!.description, style: AppTextStyle.defaultStyle.copyWith(fontSize: 18)),
                    spacerS,spacerS,
                    Container(
                      width: double.infinity,height: 1,
                      color: AppColor.blue100,
                    ),
                    spacerS,spacerS,
                    if(campusDetailProvider.loadDataTest)...[
                      Column(
                        children: List.generate(4,(_) => const MyShimmer(
                          borderRadius: 3,
                          height: 120,
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                        ),
                        ),
                      )
                    ]else...[
                      ...campusDetailProvider.test.map((e) => cardQuestion(question: e)).toList(),
                    ],
                    if(!widget.viewResult)...[
                      spacerS,spacerS,
                      Container(
                        width: double.infinity,height: 1,
                        color: AppColor.blue100,
                      ),
                      spacerS,spacerS,
                      MyButton(
                        onPressed: () {
                          if(isAnswer){
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          }else{
                            sendData();
                          }
                        },
                        text: isAnswer ? 'Aceptar' : 'Continuar',
                        width: double.infinity,
                        isLoading: campusDetailProvider.loadSendTest,
                        disabled: false,
                      ),
                    ],
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

  Widget cardQuestion({required QuestionTest question}){
    return SizedBox(
      width: sizeW,
      child: Column(
        children: [
          if(question.image.isNotEmpty)...[
            Container(
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.05),
              width: double.infinity,
              height: 220,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: MyNetworkImage(
                  image: question.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: sizeH * 0.02,),
          ],
          SizedBox(
            width: sizeW,
            child: Text(question.question,style: AppTextStyle.h1Style.copyWith(
              fontSize: sizeH * 0.025,
            )),
          ),
          ...question.options.map((e){

            if(questionMap['${question.id}-${e.line}'] == null) return Container();

            bool isSelected = questionMap['${question.id}-${e.line}']!;
            Color colorCircle = AppColor.primary;
            if(isAnswer){
              bool result = e.correctAnswer;
              bool mapRes = questionMap['${question.id}-${e.line}']!;

              if(result && mapRes){
                colorCircle = AppColor.success;
              }else if(!result && mapRes){
                colorCircle = AppColor.red500;
              }else if(!result && !mapRes){
                colorCircle = AppColor.primary;
              }else if(result && !mapRes){
                colorCircle = AppColor.success;
              }
            }

            Icon icon = Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              size: sizeH * 0.03,
              color: colorCircle,
            );

            if(isAnswer){
              bool result = e.correctAnswer;
              bool mapRes = questionMap['${question.id}-${e.line}']!;

              // String linea = e;
              // String result = question.answer;
              // bool mapRes = questionMap['${question.id}-$e']!;

              if(result && mapRes){
                icon = Icon(Icons.check_circle,size: sizeH * 0.03,color: colorCircle,);
              }else if(result && mapRes){
                icon = Icon(Icons.check_circle_outlined,size: sizeH * 0.03,color: colorCircle,);
              }else if(result && !mapRes){
                icon = Icon(Icons.check_circle,size: sizeH * 0.03,color: colorCircle,);
              }else if(result && !mapRes){
                icon = Icon(Icons.circle_outlined,size: sizeH * 0.03,color: colorCircle,);
              }
            }

            return InkWell(
              onTap: isAnswer ? null : (){
                questionMap.forEach((key, value) {
                  if(key.split('-')[0] == question.id.toString()){
                    questionMap[key] = false;
                  }
                });
                questionMap['${question.id}-${e.line}'] = !questionMap['${question.id}-${e.line}']!;
                setState(() {});
              },
              child: SizedBox(
                width: sizeW,
                child: Row(
                  children: [
                    icon,
                    SizedBox(width: sizeW * 0.02),
                    Expanded(
                      child: Text(e.optionValue, style: AppTextStyle.defaultStyle.copyWith(fontSize: 18)),
                    )
                  ],
                ),
              ),
            );
          },).toList(),
          SizedBox(height: sizeH * 0.02,),
        ],
      ),
    );
  }

  Future sendData() async{
    isLoad = true;
    setState(() {});

    try{
      int contAnswer = 0;
      questionMap.forEach((key, value) {
        if(value){ contAnswer++; }
      });
      isAnswer = contAnswer == campusDetailProvider.test.length;
    }catch(_){}

    if(!isAnswer){
      //ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Enviado con exito!!')));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No se ha contestado todas las preguntas')));
    }else{
      await completedTest();
      await campusDetailProvider.getCampusDetails(id: campusDetailProvider.campus.id.toString());
    }

    isLoad = false;
    setState(() {});
  }

  Future completedTest() async{

    List questionAnswered = [];
    questionMap.forEach((key, value) {
      if(value){
        questionAnswered.add({
          'question_id' : key.split('-')[0].toString(),
          'selected_position' : key.split('-')[1].toString(),
        });
      }
    });
    Map<String,dynamic> body = {
      'topic_id' : campusDetailProvider.topicSelect!.id.toString(),
      'questions_answered' : questionAnswered
    };
    await campusDetailProvider.saveTest(body: body);
  }


}
