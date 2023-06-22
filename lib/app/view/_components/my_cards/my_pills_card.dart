import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyPillsCard extends StatelessWidget {
  const MyPillsCard({
    required this.title,
    required this.description,
    required this.img,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String img;
  final String title;
  final String description;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  MyNetworkImage(
                    image: img,
                    fit: BoxFit.cover,
                  ),
                  // Image.network(img, fit: BoxFit.cover),
                  Container(color: Colors.black38),
                  Center(
                    child: Container(
                      height: 55,
                      width: 55,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white38,
                      ),
                      child: Image.asset(
                        'assets/icons/play.png',
                        scale: 2,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyle.h3Style.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  spacerS,
                  Text(
                    description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.contentCard,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
