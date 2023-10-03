import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/domain/model/services.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_error_icon/error_icon.dart';
import 'package:vemare/app/view/_components/my_gallery/my_galery.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/my_video_player/my_video_player.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class ServiceGeneralPage extends StatelessWidget {
  const ServiceGeneralPage({required this.service, super.key});
  static const route = '/service_general';

  final Services service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyBackButton(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: MyNetworkImage(
                          image: service.image!,
                          fit: BoxFit.cover,
                          height: 240,
                          width: double.infinity),
                      /*Image(
                        image: NetworkImage(service.image!),
                        height: 240,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),*/
                    ),
                    spacerM,
                    Text(service.title ?? '', style: AppTextStyle.h2Style),
                    spacerS,
                    MyHtml(
                      text: service.contentPage ?? '',
                    ),
                  ],
                ),
              ),
              if (service.externalLink != null) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MyIconButton(
                    onPressed: () {
                      if (service.id == 6) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      spacerS,
                                      const ErrorIconWidget(),
                                      spacerM,
                                      Text(
                                        'Recomendamos el uso de esta herramienta mediante una PC',
                                        // 'Accede a AD360° a travez del sitio web',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyle.nunitoSans800
                                            .copyWith(fontSize: 20),
                                      ),
                                      spacerM,
                                      MyButton(
                                        onPressed: () => Navigator.pop(context),
                                        text: 'Aceptar',
                                        width: double.infinity,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        launchUrlString(
                          service.externalLink ?? 'https://www.google.com',
                        );
                      }
                    },
                    text: service.buttonText ?? '',
                    icon: Image.asset(
                      'assets/icons/link.png',
                      scale: 2,
                    ),
                    variant: MyButtonVariant.outlinedBold,
                  ),
                ),
              ],
              spacerM,
              Visibility(
                visible: service.gallery != null,
                child: MyImageGallery(
                  isNetwork: true,
                  imgs: service.gallery!.map((e) => e.imagen).toList(),
                ),
              ),
              spacerM,
              if (service.youtubeVideo != null)
                Visibility(
                  visible: service.youtubeVideo != '',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: MyVideoPlayer(
                      video: service.youtubeVideo!,
                    ),
                  ),
                ),
              spacerM,
            ],
          ),
        ),
      ),
    );
  }
}
