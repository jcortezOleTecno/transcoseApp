// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:vemare/app/data/formations_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/events/other_events/other_event_page.dart';
import 'package:vemare/app/view/my_services/formations/available_destinations_formations/available_destinations_formations_page.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class DetailFormationPage extends StatelessWidget {
  const DetailFormationPage(this.formation, {super.key});

  static const route = '/detail_formation';

  final Formation formation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyBackButton(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: MyNetworkImage(
                              image: formation.image!,
                              fit: BoxFit.cover,
                              height: 250,
                            ),
                          ),
                          spacerS,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(formation.title ?? '',
                                  style: AppTextStyle.h2Style),
                              spacerS,
                              MyHtml(text: formation.description ?? ''),
                            ],
                          ),
                          spacerS,
                          if (LocalDataRepository().isLogged) ...[
                            const Text(
                              'Más información',
                              style: AppTextStyle.h3Style,
                            ),
                            spacerS,
                            MyHtml(
                                text: formation.informationForRegistrants ?? '')
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: _ContinueButton(formation: formation),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContinueButton extends StatefulWidget {
  const _ContinueButton({
    required this.formation,
  });

  final Formation formation;

  @override
  State<_ContinueButton> createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<_ContinueButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return MyButton(
      isLoading: loading,
      width: double.infinity,
      onPressed: () async {
        setState(() {
          loading = true;
        });
        var res = await getIt
            .get<FormationsRepository>()
            .getPlazasContratadas(widget.formation.id!);
        if (res != null) {
          showDialog(
              context: context,
              builder: (context) {
                return NoPlazasWidget(res: res);
              });
        } else {
          Navigator.pushNamed(
            context,
            AvailableDestinationsFormationsPage.route,
            arguments: widget.formation,
          );
        }
        setState(() {
          loading = false;
        });
      },
      text: 'Continuar',
    );
  }
}
