import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/formations_repository.dart';
import 'package:vemare/app/data/header_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_cards/my_promotions_card_registered.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/my_services/formations/formations/bloc/formations_cubit.dart';
import 'package:vemare/app/view/my_services/formations/formations/bloc/formations_state.dart';
import 'package:vemare/app/view/my_services/formations/formations/formations_registered.dart';
import 'package:vemare/app/view/my_services/formations/skillful_formation/skillful_formation.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class FormationsPage extends StatelessWidget {
  const FormationsPage._();

  static const route = '/formations_page';

  static Widget create() {
    return BlocProvider(
      create: (context) => FormationsCubit(
        getIt.get<FormationsRepository>(),
        getIt.get<HeaderRepository>(),
      ),
      child: const FormationsPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<FormationsCubit, FormationsState>(
                  builder: (context, state){

                    String title = 'Formaciones Transcose';
                    Image imageObjet = Image.asset("assets/imgs/banner-formaciones.jpg");
                    String description = 'Consulta las formaciones disponibles para los profesionales de la reparación: electromecánica, diagnosis, carrocería, gestión comercial...';

                    for (var element in state.headers) {
                      if(element.module == 'Formation'){
                        title = element.title ?? '';
                        imageObjet = Image.network(element.image!);
                        description = element.description ?? '';
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 220,
                            child: imageObjet,
                          ),
                          const MyBackButton(),
                          Text(title,style: AppTextStyle.h1Style),
                          Text(description, style: AppTextStyle.defaultStyle.copyWith(fontSize: 18)),
                          spacerXL,
                          MyButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder:
                                  (BuildContext context) => FormationsRegistered(
                                formationsGroup: state.formations,
                              )));
                            },
                            text: 'Formaciones inscritas  ',
                            width: double.infinity,
                            isLoading: false,
                            disabled: false,
                            childCenter: Image.asset(
                              'assets/icons/arrow_next.png',
                              scale: 2,color: Colors.white,
                            ),
                          ),
                          spacerXL,
                          if (state.loading)...[
                            Column(
                              children: List.generate(
                                4,
                                    (_) => const MyShimmer(
                                  borderRadius: 3,
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                                ),
                              ),
                            )
                          ]else...[
                            Column(
                              children: state.formations
                                  .map(
                                    (e){

                                  int type = e.formationsCount > 0 ? 1 : 0;
                                  double h = type != 0 ? 0.27 : 0.25;

                                  return MySingleCardRegistered(
                                    type: type,
                                    cantRegister: e.formationsCount,
                                    heightD: MediaQuery.of(context).size.height * h,
                                    iconFormation: Image.network(e.image!),
                                    title: e.title ?? '',
                                    content: e.description ?? '',
                                    margin: const EdgeInsets.only(bottom: 15),
                                    maxLines: 3,
                                    styleTitle: AppTextStyle.linkStyle.copyWith(fontSize: 20),
                                    onTap: () {
                                      if (e.type == 'ONLINE') {
                                        launchUrlString(
                                          e.externalLink ?? '',
                                        );
                                      } else {
                                        if (LocalDataRepository().isLogged) {
                                          Navigator.pushNamed(
                                            context,
                                            SkillFormationPage.route,
                                            arguments: e,
                                          );
                                        } else {
                                          Navigator.pushNamed(
                                            context,
                                            LoginPage.route,
                                            arguments: 'Inicia sesión para conocer más detalles de esta formación',
                                          ).then((_) {
                                            if (LocalDataRepository().isLogged) {
                                              Navigator.pushNamed(
                                                context,
                                                SkillFormationPage.route,
                                                arguments: e,
                                              );
                                            }
                                          });
                                        }
                                      }
                                    },
                                  );
                                },
                              )
                                  .toList(),
                            )
                          ]
                        ],
                      ),
                    );
                  }
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
