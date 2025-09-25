import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/my_orders/orders_and_bills/albaran_details/albaran_detail.dart';
import 'package:vemare/app/view/personal_area/widgets/expedition_details.dart';
import 'package:vemare/main.dart';

import '../my_orders_page.dart';

class MyDataOrders extends DataTableSource {
  final List<AlbaranISI> data;
  final String title;

  MyDataOrders(this.data, this.title);

  @override
  DataRow? getRow(int index) {
    return DataRow(
      // onLongPress: () => navigator.pushNamed(
      //       AlbaranDetailPage.route,
      //       arguments: AlbaranDetailArg(albaran: data[index], title: title),
      //     ),
        cells: [
          DataCell(Text(data[index].albaran.toString())),
          DataCell(Text(DateFormat.yMd('es').format(data[index].fecha))),
          DataCell(Text(DateFormat.yMd('es').format(data[index].fechaDevolucion))),
          DataCell(Text(data[index].total.toString())),
          // DataCell(Text(fmf
          //     .copyWith(amount: data[index].totalImporte ?? 0.0)
          //     .output
          //     .symbolOnRight)),
          DataCell(
            Row(
              children: [
                StatusLabelWidget(data[index].estado.replaceAll(' ', '') == 'FACTURADO'),
                spacerS,
                // ExpeditionButton(data[index]),
                // spacerS,
                // Expanded(
                //   child: IconButton(
                //       onPressed: () {
                //         navigator.pushNamed(
                //           AlbaranDetailPage.route,
                //           arguments: AlbaranDetailArg(
                //               albaran: data[index], title: title),
                //         );
                //       },
                //       icon:
                //           Image.asset('assets/icons/arrow_next.png', scale: 2)),
                // )
              ],
            ),
          ),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
