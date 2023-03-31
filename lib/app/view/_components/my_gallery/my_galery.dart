import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class MyImageGallery extends StatefulWidget {
  const MyImageGallery({
    this.title,
    this.isNetwork = false,
    required this.imgs,
    Key? key,
  }) : super(key: key);

  final List<String> imgs;
  final String? title;
  final bool isNetwork;

  @override
  State<MyImageGallery> createState() => _MyImageGalleryState();
}

class _MyImageGalleryState extends State<MyImageGallery> {
  late PageController controller;

  @override
  void initState() {
    controller = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              widget.title ?? 'Galeria de imágenes',
              style: AppTextStyle.h2Style,
            ),
          ),
          spacerS,
          Expanded(
            child: PageView.builder(
              itemCount: widget.imgs.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: widget.isNetwork
                        ? Image.network(
                            widget.imgs[i],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            widget.imgs[i],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ),
                );
              },
              controller: controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: AppColor.blue100,
                  borderRadius: BorderRadius.circular(100),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      controller.previousPage(
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.linear);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/icons/arrow_back.png',
                        scale: 2,
                        color: AppColor.primaryBlue,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: AppColor.blue100,
                  borderRadius: BorderRadius.circular(100),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      controller.nextPage(
                          duration: const Duration(milliseconds: 150),
                          curve: Curves.linear);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/icons/arrow_next.png',
                        scale: 2,
                        color: AppColor.primaryBlue,
                      ),
                    ),
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
