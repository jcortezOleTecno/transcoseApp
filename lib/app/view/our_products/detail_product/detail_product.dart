import 'package:flutter/material.dart';
import 'package:vemare/app/domain/model/brand.dart';
import 'package:vemare/app/domain/model/categoty_detail.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class DetailProductPageArg {
  final Subcategory cat;
  final String icon;

  DetailProductPageArg({required this.cat, required this.icon});
}

class DetailProductPage extends StatefulWidget {
  const DetailProductPage(this.args, {super.key});

  final DetailProductPageArg args;

  static const route = '/details_products';

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  List<Brand>? brandsTemp;

  @override
  void initState() {
    brandsTemp = widget.args.cat.brands;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MyTapToHideKeyboard(
      child: Scaffold(
        body: MyBody(
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
                      Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.blue100,
                            ),
                            height: 60,
                            width: 60,
                            child: Image.network(widget.args.icon),
                          ),
                          spacerS,
                          Text(
                            widget.args.cat.name ?? '',
                            style: AppTextStyle.h1Style,
                          ),
                        ],
                      ),
                      spacerM,
                      MyHtml(text: widget.args.cat.description ?? ''),
                      // Text(
                      //   args.cat.description ?? '',
                      //   style: AppTextStyle.defaultStyle,
                      // ),
                      spacerM,
                      // spacerM,
                      MySearchInput(
                        hintText: 'Buscar por proveedor',
                        onChanged: (p0) {
                          setState(() {
                            brandsTemp = widget.args.cat.brands!
                                .where((e) => e.name!
                                    .toLowerCase()
                                    .contains(p0.toLowerCase()))
                                .toList();
                          });
                        },
                      ),
                    ],
                  ),
                ),
                spacerS,
                if (brandsTemp != null)
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: brandsTemp!
                          .map((e) => Card(
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(120),
                                ),
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: SizedBox(
                                  height: width * .40,
                                  width: width * .40,
                                  child: Image.network(
                                    e.image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
