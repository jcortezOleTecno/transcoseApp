import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_network_image/my_network_image.dart';
import 'package:vemare/app/view/theme/text_style.dart';

import '../my_html/my_html.dart';

class MyNewsCardCarrucel extends StatelessWidget {
  const MyNewsCardCarrucel({
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
          Expanded(
            child: Padding(
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

                  Expanded(
                    child: Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.contentCard,
                    ),
                  ),
                  // MyHtml(text: description),
                  const Spacer(),
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
          ),
        ],
      ),
    );
  }
}

class MyNewsCard extends StatelessWidget {
  const MyNewsCard({
    required this.title,
    required this.description,
    required this.img,
    this.isExpanded = false,
    this.centerButton = true,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String img;
  final String title;
  final String description;
  final bool isExpanded;
  final bool centerButton;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: double.infinity,
            height: 200,
            child: MyNetworkImage(image: img, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: AppTextStyle.h3Style.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MyHtml(text: description),
          // const Spacer(),
          Center(
            child: TextButton.icon(
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
          ),
        ],
      ),
    );
  }
}
