// import 'package:flutter/material.dart';
// import 'package:vemare/app/view/_components/my_body/my_body.dart';
// import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
// import 'package:vemare/app/view/_components/my_label_status/my_label_status.dart';
// import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
// import 'package:vemare/app/view/theme/color.dart';
// import 'package:vemare/app/view/theme/text_style.dart';

// class BillDetailPage extends StatelessWidget {
//   const BillDetailPage({super.key});
//   static const route = '/bill_detail';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: MyBody(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const MyBackButton(),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: const [
//                   Text(
//                     'N° DEL PRESUPUESTO',
//                     style: AppTextStyle.defaultStyle,
//                   ),
//                   Text(
//                     '0000000000000',
//                     style: AppTextStyle.h3Style,
//                   ),
//                   spacerL,
//                   _DetailBill(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _DetailBill extends StatelessWidget {
//   const _DetailBill({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: AppColor.blue100),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           const Text(
//             'Detalles de la factura',
//             style: AppTextStyle.titleCard,
//           ),
//           spacerM,
//           Row(
//             children: const [
//               Expanded(child: Text('FECHA', style: AppTextStyle.defaultStyle)),
//               Expanded(
//                   child: Text('IMPORTE', style: AppTextStyle.defaultStyle)),
//             ],
//           ),
//           Row(
//             children: [
//               Expanded(
//                   child: Text(
//                 '20/08/2022',
//                 style: AppTextStyle.defaultStyle.copyWith(
//                   fontWeight: FontWeight.w700,
//                 ),
//               )),
//               Expanded(
//                   child: Text(
//                 '100 €',
//                 style: AppTextStyle.defaultStyle.copyWith(
//                   fontWeight: FontWeight.w700,
//                 ),
//               )),
//             ],
//           ),
//           spacerM,
//           Row(
//             children: const [
//               Expanded(
//                   child: Text('SUCURSAL', style: AppTextStyle.defaultStyle)),
//               Expanded(
//                   child: Text('LINEA DE NEGOCIO',
//                       style: AppTextStyle.defaultStyle)),
//             ],
//           ),
//           Row(
//             children: [
//               Expanded(
//                   child: Text(
//                 '???',
//                 style: AppTextStyle.defaultStyle.copyWith(
//                   fontWeight: FontWeight.w700,
//                 ),
//               )),
//               Expanded(
//                   child: Text(
//                 '???',
//                 style: AppTextStyle.defaultStyle.copyWith(
//                   fontWeight: FontWeight.w700,
//                 ),
//               )),
//             ],
//           ),
//           spacerM,
//           Row(
//             children: const [
//               Expanded(
//                   child: Text('TRAMITACIÓN', style: AppTextStyle.defaultStyle)),
//               Expanded(
//                   child:
//                       Text('REQUIERE FIRMA', style: AppTextStyle.defaultStyle)),
//             ],
//           ),
//           Row(
//             children: [
//               Expanded(
//                   child: Text(
//                 '???',
//                 style: AppTextStyle.defaultStyle.copyWith(
//                   fontWeight: FontWeight.w700,
//                 ),
//               )),
//               Expanded(
//                   child: Text(
//                 '???',
//                 style: AppTextStyle.defaultStyle.copyWith(
//                   fontWeight: FontWeight.w700,
//                 ),
//               )),
//             ],
//           ),
//           spacerM,
//           const Text('SITUCAIÓN', style: AppTextStyle.defaultStyle),
//           Text('???',
//               style: AppTextStyle.defaultStyle
//                   .copyWith(fontWeight: FontWeight.bold)),
//           spacerM,
//           const MyLabelStatus.approved()
//         ],
//       ),
//     );
//   }
// }
