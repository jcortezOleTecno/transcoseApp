// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/domain/model/plazas_contratadas_error.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/login/login_page.dart';
import 'package:vemare/app/view/my_services/events/other_events/available_destinations/available_destinations_page.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class OtherEventPage extends StatelessWidget {
  const OtherEventPage(this.event, {super.key});
  static const route = '/other_event';

  final Events event;

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
                          Hero(
                            tag: event.id!,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                image: NetworkImage(event.imagePrivate!),
                                fit: BoxFit.cover,
                                height: 250,
                              ),
                            ),
                          ),
                          spacerS,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(event.title ?? '',
                                  style: AppTextStyle.nunitoSans800
                                      .copyWith(fontSize: 24)),
                              spacerS,
                              MyHtml(text: event.description ?? ''),
                            ],
                          ),
                          spacerS,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ContinueButton(event: event),
            ),
          ],
        ),
      ),
    );
  }
}

class ContinueButton extends StatefulWidget {
  const ContinueButton({
    super.key,
    required this.event,
  });

  final Events event;

  @override
  State<ContinueButton> createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<ContinueButton> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return MyButton(
      isLoading: loading,
      width: double.infinity,
      onPressed: () async {
        if (LocalDataRepository().isLogged) {
          setState(() {
            loading = true;
          });
          var res = await getIt
              .get<EventsRepository>()
              .getPlazasContratadas(widget.event.id!);
          if (res != null) {
            showDialog(
                context: context,
                builder: (context) {
                  return NoPlazasWidget(res: res);
                });
          } else {
            Navigator.pushNamed(
              context,
              AvailableDestinationsPage.route,
              arguments: widget.event,
            );
          }
          setState(() {
            loading = false;
          });
        } else {
          Navigator.pushNamed(
            context,
            LoginPage.route,
            arguments:
                'Para acceder a la información de los eventos tienes que iniciar sesión.',
          ).then((_) async {
            if (LocalDataRepository().isLogged) {
              setState(() {
                loading = true;
              });
              var res = await getIt
                  .get<EventsRepository>()
                  .getPlazasContratadas(widget.event.id!);
              if (res != null) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return NoPlazasWidget(res: res);
                    });
              } else {
                Navigator.pushNamed(
                  context,
                  AvailableDestinationsPage.route,
                  arguments: widget.event,
                );
              }
              setState(() {
                loading = false;
              });
            }
          });
        }
      },
      text: 'Continuar',
    );
  }
}

class NoPlazasWidget extends StatelessWidget {
  const NoPlazasWidget({
    required this.res,
  });

  final PLazasContratadasError? res;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          spacerS,
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColor.error200),
            child: const Icon(
              Icons.warning_amber_rounded,
              size: 30,
              color: AppColor.error,
            ),
          ),
          spacerM,
          Text(
            res?.titleError ?? '',
            textAlign: TextAlign.center,
            style: AppTextStyle.nunitoSans800.copyWith(fontSize: 24),
          ),
          spacerXs,
          Text(
            res?.message ?? '',
            textAlign: TextAlign.center,
            style: AppTextStyle.defaultStyle.copyWith(fontSize: 16),
          ),
          spacerM,
          MyButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: 'Aceptar',
            width: double.infinity,
          )
        ]),
      ),
    );
  }
}
