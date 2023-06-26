import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyNewsCard extends StatelessWidget {
  const MyNewsCard({
    required this.title,
    required this.description,
    required this.img,
    this.isExpanded = false,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String img;
  final String title;
  final String description;
  final bool isExpanded;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: MyNetworkImage(image: img, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  title,
                  style: AppTextStyle.h3Style.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                spacerXs,
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyle.contentCard,
                ),
                // MyHtml(text: description),
                // if (isExpanded) const Spacer(),
                TextButton.icon(
                  onPressed: onPressed,
                  label: Image.asset(
                    'assets/icons/arrow_next.png',
                    scale: 2,
                  ),
                  icon: const Text(
                    'Leer más',
                    style: AppTextStyle.linkStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
