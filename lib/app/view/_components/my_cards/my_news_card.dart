import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyNewsCard extends StatelessWidget {
  const MyNewsCard({
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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
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
