import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/formations_repository.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/formations/formations/providers/formations_registered_provider.dart';
import 'package:vemare/app/view/my_services/formations/skillful_formation/skillful_formation.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class FormationsRegistered extends StatefulWidget {
  const FormationsRegistered({super.key, required this.formationsGroup});
  final List<TrainigGroup> formationsGroup;
  @override
  State<FormationsRegistered> createState() => _FormationsRegisteredState();
}

class _FormationsRegisteredState extends State<FormationsRegistered> {

  late FormationsRegisteredProvider formationsRegisteredProvider;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context1) => FormationsRegisteredProvider(getIt.get<FormationsRepository>(),widget.formationsGroup),
        child: Consumer<FormationsRegisteredProvider>(
            builder: (context2, provider, child){

              formationsRegisteredProvider = provider;

              return Scaffold(
                body: MyBody(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        spacerS,
                        const MyBackButton(edgeInsets: EdgeInsets.symmetric(horizontal: 10)),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          width: double.infinity,
                          child: Column(
                            children: [
                              const SizedBox(
                                width: double.infinity,
                                child: Text('Formaciones inscritas',
                                    style: AppTextStyle.h1Style,textAlign: TextAlign.left),
                              ),
                              Text('Información resumida de cada formación a la que estás inscrito',
                                  style: AppTextStyle.defaultStyle.copyWith(fontSize: 18)),
                              spacerXL,
                              SizedBox(
                                width: double.infinity,
                                child: Text('Buscar formaciones',
                                    style: AppTextStyle.h1Style.copyWith(fontSize: 15),textAlign: TextAlign.left),
                              ),
                              spacerXs,
                              searchButton1(),
                              spacerS,
                              SizedBox(
                                width: double.infinity,
                                child: Text('Categoría',
                                    style: AppTextStyle.h1Style.copyWith(fontSize: 15),textAlign: TextAlign.left),
                              ),
                              spacerXs,
                              searchButton2(),
                              spacerS,
                              SizedBox(
                                width: double.infinity,
                                child: Text('Ordenar por',
                                    style: AppTextStyle.h1Style.copyWith(fontSize: 15),textAlign: TextAlign.left),
                              ),
                              spacerXs,
                              searchButton3(),
                              spacerXL,
                              if(formationsRegisteredProvider.loadData)...[
                                const MyShimmer(
                                  borderRadius: 10,
                                  height: 200,
                                  margin: EdgeInsets.fromLTRB(0,0,0,0),
                                ),
                                spacerS,
                                const MyShimmer(
                                  borderRadius: 10,
                                  height: 200,
                                  margin: EdgeInsets.fromLTRB(0,0,0,0),
                                ),
                                spacerS,
                                const MyShimmer(
                                  borderRadius: 10,
                                  height: 200,
                                  margin: EdgeInsets.fromLTRB(0,0,0,0),
                                ),
                              ]else...[
                                ...formationsRegisteredProvider.formations.map(
                                        (e) => ItemFormation(e))
                              ]
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        )
    );
  }

  Widget searchButton1(){
    return SizedBox(
      width: double.infinity,
      child: MySearchInput(
        borderCircular: 5,
        borderSideColor: AppColor.white,
        hintText: 'Escribe aquí',
        onChanged: (value){
          formationsRegisteredProvider.textSearch = value;
          if(value.isEmpty){
            formationsRegisteredProvider.resetTrainig();
          }else{
            formationsRegisteredProvider.filterData();
          }
        },
      ),
    );
  }

  Widget searchButton2(){
    log('message');
    return SizedBox(
      width: double.infinity,
      child: MyCustomDropdownButton(
        hint: 'Selecciona una opción',
        hintStyle: AppTextStyle.inputStyle,
        dropdownItems: formationsRegisteredProvider.mapFormationsGroup.keys.map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(formationsRegisteredProvider.mapFormationsGroup[item]!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AppTextStyle.inputStyle),
        )).toList(),
        value: formationsRegisteredProvider.categorySelected,
        onChanged: (value) async {
          formationsRegisteredProvider.categorySelected = value ?? '';
          if(value == '0'){
            formationsRegisteredProvider.resetTrainig();
          }else{
            formationsRegisteredProvider.filterData();
          }
        },
      ),
    );
  }

  Widget searchButton3(){
    return SizedBox(
      width: double.infinity,
      child: MyCustomDropdownButton(
        hint: 'De más próxima a más lejana',
        hintStyle: AppTextStyle.inputStyle,
        dropdownItems: formationsRegisteredProvider.listOrd.map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(item,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: AppTextStyle.inputStyle),
        ))
            .toList(),
        value: formationsRegisteredProvider.orderBy,
        onChanged: (value) async {
          formationsRegisteredProvider.orderBy = value ?? '';
          formationsRegisteredProvider.filterData();
        },
      ),
    );
  }
}
