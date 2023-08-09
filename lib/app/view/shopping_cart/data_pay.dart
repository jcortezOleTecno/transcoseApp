// import 'package:flutter/material.dart';
// import 'package:vemare/app/domain/model/shopping_card_product.dart';
// import 'package:vemare/app/domain/utils/money_formatter.dart';
// import 'package:vemare/app/view/_components/my_body/my_body.dart';
// import 'package:vemare/app/view/_components/my_button/my_button.dart';
// import 'package:vemare/app/view/_components/my_dialogs/my_dialogs.dart';
// import 'package:vemare/app/view/_components/my_input/my_input.dart';
// import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
// import 'package:vemare/app/view/home/home_page.dart';
// import 'package:vemare/app/view/theme/text_style.dart';

// import '../_components/my_button/my_back_button.dart';
// import '../theme/color.dart';
// import 'shipping_data_page.dart';

// class DataPayPage extends StatelessWidget {
//   const DataPayPage(this.args, {super.key});
//   static const route = '/data_pay';
//   final ShoppingCarArgs args;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: MyBody(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const MyBackButton(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Carrito${args.products.isNotEmpty ? ' (${args.counter})' : ''}',
//                       style: AppTextStyle.h1Style,
//                     ),
//                     ListView.separated(
//                       itemCount: args.products.length,
//                       separatorBuilder: (context, i) => const Divider(),
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemBuilder: (context, i) {
//                         return _Item(
//                           product: args.products[i],
//                         );
//                       },
//                     ),
//                     spacerXL,
//                     const MyDivider(height: 0),
//                     spacerS,
//                     const Text(
//                       'Total',
//                       style: AppTextStyle.h3Style,
//                     ),
//                     spacerXs,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text('Productos',
//                             style: AppTextStyle.defaultStyle),
//                         Text('x${args.counter}',
//                             style: AppTextStyle.defaultStyle),
//                       ],
//                     ),
//                     spacerS,
//                     const MyDivider(height: 0),
//                     spacerS,
//                     Center(
//                       child: RichText(
//                         text: TextSpan(
//                           style: AppTextStyle.h1Style,
//                           children: [
//                             TextSpan(
//                                 text: fmf
//                                     .copyWith(amount: args.total)
//                                     .output
//                                     .symbolOnRight),
//                             TextSpan(
//                               text: '  IVA incluido',
//                               style: AppTextStyle.defaultStyle
//                                   .copyWith(color: AppColor.neutral40),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     spacerM,
//                     const Text(
//                       'Datos de pago',
//                       style: AppTextStyle.h3Style,
//                     ),
//                     spacerM,
//                     const MyInput(
//                       label: 'Nombre de la tarjeta',
//                       hintText: 'Escribe el nombre de la tarjeta',
//                     ),
//                     const MyInput(
//                       label: 'Número de la tarjeta',
//                       hintText: 'Introduce el número de la tarjeta',
//                     ),
//                     Row(
//                       children: const [
//                         Expanded(
//                           child: MyInput(
//                             label: 'Fecha de caducidad',
//                             hintText: '00/00',
//                           ),
//                         ),
//                         spacerM,
//                         Expanded(
//                           child: MyInput(
//                             label: 'CVV',
//                             hintText: '000',
//                           ),
//                         ),
//                       ],
//                     ),
//                     MyButton(
//                       onPressed: () {
//                         promotionDialog(context,
//                                 title: 'Felicidades',
//                                 content:
//                                     'La operación se ha realizado con éxito.')
//                             .then((_) {
//                           Navigator.popUntil(
//                               context, ModalRoute.withName(HomePage.route));
//                         });
//                       },
//                       text: 'Continuar',
//                       width: double.infinity,
//                     ),
//                     spacerM,
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _Item extends StatelessWidget {
//   const _Item({
//     required this.product,
//     Key? key,
//   }) : super(key: key);

//   final ShoppingCardProduct product;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 80,
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image(
//               image: NetworkImage(product.image!),
//               width: 80,
//               height: 80,
//               fit: BoxFit.cover,
//             ),
//           ),
//           spacerS,
//           Expanded(
//               child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 product.renting == 1 ? 'Renting' : 'Tienda',
//                 style: AppTextStyle.inputLabelStyle.copyWith(
//                   color: AppColor.neutral40,
//                 ),
//               ),
//               Expanded(
//                 child: RichText(
//                   text: TextSpan(
//                     style: AppTextStyle.defaultStyle.copyWith(
//                         fontWeight: FontWeight.w700,
//                         color: Colors.black,
//                         fontSize: 14),
//                     children: [
//                       TextSpan(
//                         text: product.promotionName,
//                       ),
//                       TextSpan(
//                           text: ' x${product.quantity}',
//                           style:
//                               AppTextStyle.defaultStyle.copyWith(fontSize: 14)),
//                     ],
//                   ),
//                 ),
//               ),
//               // RichText(
//               //   text: TextSpan(
//               //     style: AppTextStyle.titleCard,
//               //     children: [
//               //       if (product.promotionPriceLowered != null)
//               //         TextSpan(
//               //           text:
//               //               '${(int.parse(product.promotionPrice ?? '0') * (product.quantity ?? 0))}€',
//               //           style: AppTextStyle.pvpOrinigal.copyWith(fontSize: 14),
//               //         ),
//               //       TextSpan(
//               //         text:
//               //             ' ${(int.parse(product.promotionPriceLowered ?? product.promotionPrice ?? '0') * (product.quantity ?? 0))}€',
//               //       ),
//               //       /*TextSpan(
//               //         text: '${product.promotionPrice}€',
//               //         style: AppTextStyle.pvpOrinigal.copyWith(fontSize: 14),
//               //       ),
//               //       TextSpan(
//               //         text: ' ${product.promotionPriceLowered}€',
//               //       ),*/
//               //       TextSpan(
//               //         text: ' IVA incluido ',
//               //         style: AppTextStyle.defaultStyle
//               //             .copyWith(color: AppColor.neutral40, fontSize: 14),
//               //       ),
//               //     ],
//               //   ),
//               // ),
//             ],
//           )),
//           spacerS,
//         ],
//       ),
//     );
//   }
// }
