import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  static const route = "/shopping_cart";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
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
                          const Text(
                            'Carrito (2)',
                            style: AppTextStyle.h1Style,
                          ),
                          spacerM,
                          ListView.separated(
                            itemCount: 8,
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return const _ShoppingItem();
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: MyButton(onPressed: () {}, text: 'Comprar'),
            ),
            spacerS,
          ],
        ),
      ),
    );
  }
}

class _ShoppingItem extends StatelessWidget {
  const _ShoppingItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              image: AssetImage('assets/imgs/promotionImg.png'),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          spacerS,
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Renting',
                style: AppTextStyle.inputLabelStyle.copyWith(
                  color: AppColor.neutral40,
                ),
              ),
              RichText(
                text: TextSpan(
                  style: AppTextStyle.h3Style,
                  children: [
                    const TextSpan(
                      text: 'Lorem ipsum',
                    ),
                    TextSpan(text: ' x1', style: AppTextStyle.defaultStyle),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: AppTextStyle.h3Style,
                  children: [
                    const TextSpan(
                      text: '23\$',
                    ),
                    TextSpan(
                      text: ' IVA incluido ',
                      style: AppTextStyle.defaultStyle
                          .copyWith(color: AppColor.neutral40),
                    ),
                  ],
                ),
              ),
            ],
          )),
          Material(
            color: AppColor.error200,
            borderRadius: BorderRadius.circular(50),
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset('assets/icons/Trash.png', scale: 2),
              ),
            ),
          )
        ],
      ),
    );
  }
}
