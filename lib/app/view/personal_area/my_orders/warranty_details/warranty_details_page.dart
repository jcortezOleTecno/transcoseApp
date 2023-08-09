import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/domain/model/warranty_details.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_signature/my_signature.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/personal_area/my_orders/warranty_details/bloc/warranty_details_cubit.dart';
import 'package:vemare/app/view/personal_area/my_orders/warranty_details/bloc/warranty_details_state.dart';
import 'package:vemare/app/view/personal_area/widgets/warranty.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class WarrantyDetailPage extends StatelessWidget {
  const WarrantyDetailPage._();
  static const route = '/warranty_detail';

  static Widget create(Warranty warranty) {
    return BlocProvider(
      create: (context) => WarrantyDetailsCubit(
        getIt.get<MyAccountRepository>(),
        warranty,
      ),
      child: const WarrantyDetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WarrantyDetailsCubit>();
    return Scaffold(
      body: BlocBuilder<WarrantyDetailsCubit, WarrantyDetailsState>(
        builder: (context, state) {
          return MyBody(
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
                        const Text('Detalle de garantía',
                            style: AppTextStyle.h2Style),
                        const UserName(),
                        spacerM,
                        WarrantyDetail(state.warranty!, state.details),
                        spacerM,
                        // const MyDivider(),
                        // spacerM,
                        const _Products(),
                        if (state.details?.visar == 'Si' &&
                            state.details?.firmado == 'No') ...[
                          spacerM,
                          MyIconButton(
                            onPressed: () {
                              myDialogSignature(context,
                                  sign: (name, nif, signature) async {
                                await cubit.sign(
                                  name: name,
                                  nif: nif,
                                  signature: signature,
                                );
                              });
                            },
                            text: 'Firmar',
                            icon: Image.asset(
                              'assets/icons/firma.png',
                              scale: 2,
                            ),
                          ),
                        ],
                        spacerL,
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Products extends StatelessWidget {
  const _Products({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarrantyDetailsCubit, WarrantyDetailsState>(
      builder: (context, state) {
        if (state.loading) {
          return const MyShimmer(
            margin: EdgeInsets.zero,
            borderRadius: 12,
            height: 150,
          );
        }
        return Builder(builder: (context) {
          final DataTableSource data =
              DataReferencias(state.details!.referencias!);
          return Card(
            margin: const EdgeInsets.only(bottom: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spacerS,
                      const Text(
                        'Referencias',
                        style: AppTextStyle.h3Style,
                      ),
                      Text('${state.details?.referencias?.length} Total'),
                      // spacerM,
                    ],
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: PaginatedDataTable2(
                    columnSpacing: 12,
                    wrapInCard: false,
                    horizontalMargin: 12,
                    minWidth: 1000,
                    // smRatio: 0.5,
                    columns: const [
                      DataColumn2(
                        label: Text('REFERENCIA'),
                        fixedWidth: 100,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('DESCRIPCIÓN'),
                        fixedWidth: 200,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('FAMILIA'),
                        fixedWidth: 150,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('MARCA'),
                        fixedWidth: 100,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('CANTIDAD'),
                        fixedWidth: 80,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('IMPORTE NETO'),
                        fixedWidth: 100,
                        // size: ColumnSize.L,
                      ),
                    ],
                    source: data,
                  ),
                ),
                spacerS,
              ],
            ),
          );
        });
      },
    );
  }
}

// class _ItemProduct extends StatelessWidget {
//   const _ItemProduct(
//     this.ref, {
//     Key? key,
//   }) : super(key: key);

//   final Referencia ref;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//                 child: Item(
//                     title: 'REF PIEZA',
//                     content: ref.referencia ?? '000000000')),
//             Expanded(
//                 child: Item(
//                     title: 'CANTIDAD',
//                     content: ref.cantidad?.toString() ?? '0')),
//             Expanded(
//                 child: Item(
//                     title: 'IMPORTE',
//                     content: fmf
//                         .copyWith(amount: double.tryParse(ref.importeNeto!))
//                         .output
//                         .symbolOnRight)),
//           ],
//         ),
//         spacerS,
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(child: Item(title: 'FAMILIA', content: ref.familia ?? '')),
//             Expanded(child: Item(title: 'MARCA', content: ref.marca ?? '')),
//           ],
//         ),
//         spacerS,
//         Item(title: 'DESCRIPCIÓN', content: ref.descripcion ?? '000000000'),
//       ],
//     );
//   }
// }

class DataReferencias extends DataTableSource {
  final List<Referencia> data;

  DataReferencias(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].referencia ?? '')),
      DataCell(Text(data[index].descripcion ?? '')),
      DataCell(Text(data[index].familia ?? '')),
      DataCell(Text(data[index].marca ?? '')),
      DataCell(Text(data[index].cantidad.toString())),
      DataCell(Text(fmf
          .copyWith(amount: double.parse(data[index].importeNeto ?? '0'))
          .output
          .symbolOnRight)),
    ]);
  }

  @override
  //
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
