import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/personal_area/my_orders/warranty/warranty_details/warranty_details_page.dart';
import 'package:vemare/main.dart';

class MyDataWarranty extends DataTableSource {
  final List<Warranty> data;

  MyDataWarranty(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(
        onLongPress: () => navigator.pushNamed(
              WarrantyDetailPage.route,
              arguments: data[index],
            ),
        cells: [
          DataCell(Text(data[index].numero.toString())),
          DataCell(Text(DateFormat.yMd('es').format(data[index].fechaAlta!))),
          DataCell(Text(data[index].centroReparto ?? '')),
          DataCell(Text(data[index].visar ?? '')),
          DataCell(Text(fmf
              .copyWith(amount: double.parse(data[index].importe ?? '0'))
              .output
              .symbolOnRight)),
          DataCell(Text(data[index].linea ?? '')),
          DataCell(Text(data[index].firmado ?? '')),
          DataCell(Text(data[index].estadoSu ?? '')),
          DataCell(Text(data[index].estadoTr ?? '')),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
