import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_gallery/my_galery.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/my_video_player/my_video_player.dart';
import 'package:vemare/app/view/my_services/services_page.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class ServiceGeneralPage extends StatelessWidget {
  const ServiceGeneralPage({required this.service, super.key});
  static const route = '/service_general';

  final ServiceClass service;

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
                      child: Image(
                        image: AssetImage(service.img),
                        height: 240,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    spacerM,
                    Text(service.name, style: AppTextStyle.h2Style),
                    spacerS,
                    Text(service.desc, style: AppTextStyle.defaultStyle),
                  ],
                ),
              ),
              spacerM,
              Visibility(
                visible: service.imgs.isNotEmpty,
                child: MyImageGallery(
                  imgs: service.imgs,
                ),
              ),
              spacerM,
              Visibility(
                visible: service.video != '',
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MyVideoPlayer(
                    video: service.video!,
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
