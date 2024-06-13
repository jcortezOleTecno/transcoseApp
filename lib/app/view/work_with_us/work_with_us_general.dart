import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/domain/model/rrhh_models.dart';
import 'package:vemare/app/domain/model/services.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
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

class WorkWithUsGeneral extends StatelessWidget {
  const WorkWithUsGeneral({required this.rrhhModels, super.key});
  static const route = '/work_with_us_general';

  final RrhhModels rrhhModels ;

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
                          image: rrhhModels.image!,
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
                    Text(rrhhModels.title ?? '', style: AppTextStyle.h2Style),
                    spacerS,
                    MyHtml(
                      text: rrhhModels.contentPage ?? '',
                      bodyFontSize: 20,
                    ),
                  ],
                ),
              ),
              if (rrhhModels.externalLink != null) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MyIconButton(
                    onPressed: () {
                      if (rrhhModels.id == 6) {
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
                                        'Recomendamos el uso de esta herramienta desde un PC',
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
                          rrhhModels.externalLink ?? 'https://www.google.com',
                        );
                      }
                    },
                    text: rrhhModels.buttonText ?? '',
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
                visible: rrhhModels.gallery != null,
                child: MyImageGallery(
                  isNetwork: true,
                  imgs: rrhhModels.gallery!.map((e) => e.imagen).toList(),
                ),
              ),
              spacerM,
              if (rrhhModels.youtubeVideo != null)
                Visibility(
                  visible: rrhhModels.youtubeVideo != '',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: MyVideoPlayer(
                      video: rrhhModels.youtubeVideo!,
                    ),
                  ),
                ),
              spacerM,
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
