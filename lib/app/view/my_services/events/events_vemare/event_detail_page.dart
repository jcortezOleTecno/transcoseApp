import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/events_vemare.dart';
import 'package:vemare/app/domain/model/galery.dart';
import 'package:vemare/app/domain/utils/download_and_save_file.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_filter_image/my_filter_image.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/my_video_player/my_video_player.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage(this.event, {super.key});
  static const route = '/event_detail_page';

  final EventsHeld event;

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
                    Text(event.title ?? '', style: AppTextStyle.h2Style),
                    spacerL,
                    if (event.gallery != null)
                      Column(
                        children: event.gallery!.map((e) => _Item(e)).toList(),
                      ),
                    if (event.videos != null)
                      ...event.videos!
                          .map((e) => Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: MyVideoPlayer(video: e.link!),
                              ))
                          .toList(),
                    spacerS,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(
    this.galery, {
    Key? key,
  }) : super(key: key);

  final Gallery galery;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 220,
      width: double.infinity,
      child: Stack(fit: StackFit.expand, children: [
        MyNetworkImage(
          image: galery.imagen,
          fit: BoxFit.cover,
          height: 220,
        ),
        // Image(
        //   image: NetworkImage(galery.imagen),
        //   fit: BoxFit.cover,
        // ),
        const MyFilterImage(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  DownloadButton(galery: galery),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class DownloadButton extends StatefulWidget {
  const DownloadButton({
    Key? key,
    required this.galery,
  }) : super(key: key);

  final Gallery galery;

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  FormStatus status = FormStatus.editing;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      color: AppColor.blue100,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () async {
          if (status == FormStatus.loading) return;
          setState(() {
            status = FormStatus.loading;
          });
          var temp = Uri.parse(widget.galery.imagen);
          String name = temp.pathSegments.last;
          print(name);

          await downloadAndSaveFile(widget.galery.imagen).then((v) {
            if (v) {
              setState(() {
                status = FormStatus.done;
              });
            } else {
              setState(() {
                status = FormStatus.error;
              });
            }
          });
        },
        child: SizedBox(
          width: 40,
          height: 40,
          child: _icon(),
        ),
      ),
    );
  }

  Widget _icon() {
    switch (status) {
      case FormStatus.editing:
        return Image.asset(
          'assets/icons/Download.png',
          color: AppColor.primaryBlue,
          scale: 2,
        );
      case FormStatus.loading:
        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(
              color: AppColor.primaryBlue, strokeWidth: 2.5),
        );
      case FormStatus.error:
        return const Icon(Icons.error_outline_sharp);
      case FormStatus.done:
        return const Icon(Icons.check);

      default:
        return Container();
    }
  }
}
