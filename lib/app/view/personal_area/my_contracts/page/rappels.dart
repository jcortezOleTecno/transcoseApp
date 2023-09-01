import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/contrato_rappel.dart';
import 'package:vemare/app/domain/utils/year_list.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_download_button/my_download_pdf_contracts.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_signature/my_signature.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/my_contracts_cubit.dart';
import 'bloc/my_contracts_state.dart';

class Rappels extends StatelessWidget {
  const Rappels({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyContratsCubit>();
    return BlocBuilder<MyContratsCubit, MyContratsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Contratos Rappels', style: AppTextStyle.h1Style),
              const UserName(),
              spacerM,
              const Text(
                'Filtrar por año',
                style: AppTextStyle.inputLabelStyle,
              ),
              MyCustomDropdownButton(
                  hint: DateTime.now().year.toString(),
                  hintStyle: AppTextStyle.inputStyle,
                  dropdownItems: yearsList
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: AppTextStyle.inputStyle),
                          ))
                      .toList(),
                  value: state.yearSelectRappel,
                  onChanged: (value) {
                    cubit.getRappel(value!);
                  }),
              spacerM,
              if (state.loading)
                const MyShimmer(
                  margin: EdgeInsets.zero,
                  height: 500,
                  borderRadius: 12,
                ),
              if (state.rappel == null && !state.loading)
                const NoExistWidget('contratos'),
              if (state.rappel != null && !state.loading)
                Column(
                  children: [
                    _ContractRappel(state.rappel!),
                    spacerM,
                    if (state.rappel?.documentosFirmados?.isNotEmpty ?? false)
                      _SignedDocuments(),
                    Visibility(
                      visible: state.rappel!.firmado == 'No',
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                        child: MyIconButton(
                          onPressed: () {
                            myDialogSignature(context,
                                sign: (name, nif, signature) async {
                              await cubit.signRappel(
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
                      ),
                    ),
                  ],
                )
            ],
          ),
        );
      },
    );
  }
}

class _ContractRappel extends StatelessWidget {
  const _ContractRappel(
    this.rappel, {
    Key? key,
  }) : super(key: key);

  final ContratoRappel rappel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Información principal", style: AppTextStyle.h2Style),
            spacerM,
            DownloadPdfContracts(
              onPressed: () =>
                  getIt.get<ContratsRepository>().downloadPdfRappelDetalles(
                        codContrato: rappel.codigoContrato.toString(),
                        name: 'Rappel_${rappel.codigoContrato}.pdf',
                      ),
            ),
            spacerM,
            MyInput(
              key: const Key("Código del contrato"),
              label: "Código del contrato",
              initialValue: rappel.codigoContrato.toString(),
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Nombre del taller"),
              label: "Nombre del taller",
              initialValue: rappel.nombre ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Email"),
              label: "Email",
              initialValue: rappel.email ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Notas del cliente"),
              label: "Notas del cliente",
              initialValue: rappel.notasCliente ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Contrato de cliente"),
              label: "Contrato de cliente",
              initialValue: rappel.clientesContrato ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Firmado"),
              label: "Firmado",
              initialValue: rappel.firmado ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            const MyDivider(),
            spacerS,
            const Text("Datos de la firma", style: AppTextStyle.h2Style),
            spacerM,
            MyInput(
              key: const Key("Fecha de firma"),
              label: "Fecha de firma",
              initialValue: rappel.fechaFirma ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Persona que firma"),
              label: "Persona que firma",
              initialValue: rappel.firmaPersonaquefirma ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("NIF de persona que firma"),
              label: "NIF de persona que firma",
              initialValue: rappel.nifPersonaquefirma ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            // spacerS,
            // if (rappel.documentosFirmados != null)
            //   if (rappel.documentosFirmados!.isNotEmpty) ...[
            //     const MyDivider(),
            //     Center(
            //       child: Text('DOCUMENTOS FIRMADOS',
            //           style: AppTextStyle.defaultStyle
            //               .copyWith(fontWeight: FontWeight.bold)),
            //     ),
            //     const MyDivider(),
            //   ],
            // spacerS,
            // if (rappel.documentosFirmados != null)
            //   ...rappel.documentosFirmados!
            //       .map((e) => Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Row(
            //                 children: [
            //                   Item(
            //                       title: "COD. DOCUMENTO",
            //                       content: e.codigoDocumento?.toString() ?? ''),
            //                   spacerS,
            //                   Item(
            //                       title: "AÑO",
            //                       content: e.anio?.toString() ?? ''),
            //                   const Spacer(),
            //                   ButtonDownloadPdf(
            //                     future: () => getIt
            //                         .get<ContratsRepository>()
            //                         .downloadPdfRappel(
            //                           codContrato:
            //                               rappel.codigoContrato.toString(),
            //                           codDocumento:
            //                               e.codigoDocumento.toString(),
            //                           name: e.nombre ?? '',
            //                         ),
            //                   ),
            //                 ],
            //               ),
            //               spacerS,
            //               Item(title: "NOMBRE", content: e.nombre ?? ''),
            //               spacerS,
            //               Item(
            //                   title: "DESCRIPCION",
            //                   content: e.descripcion ?? ''),
            //               if (e != rappel.documentosFirmados!.last)
            //                 const MyDivider(),
            //             ],
            //           ))
            //       .toList(),
          ],
        ),
      ),
    );
  }
}

class _SignedDocuments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyContratsCubit>();
    return BlocBuilder<MyContratsCubit, MyContratsState>(
      builder: (context, state) {
        return SizedBox(
          height: 500,
          child: Card(
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
                        'Documentos firmados',
                        style: AppTextStyle.h3Style,
                      ),
                      Text('${state.dataRappelsFiltrado!.rowCount} Total'),
                      // spacerM,
                    ],
                  ),
                ),
                spacerS,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MySearchInput(
                    hintText: 'Buscar por palabras claves...',
                    onChanged: cubit.filtroRappels,
                  ),
                ),
                spacerS,
                Expanded(
                  child: PaginatedDataTable2(
                    wrapInCard: false,
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 850, empty: const NoResultTable(),
                    // smRatio: 0.5,
                    columns: const [
                      DataColumn2(
                        label: Text('CÓDIGO DOCUMENTO'),
                        fixedWidth: 150,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('NOMBRE DEL ARCHIVO'),
                        fixedWidth: 350,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('AÑO'),
                        fixedWidth: 60,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('ESTADO'),
                        fixedWidth: 150,
                        // size: ColumnSize.L,
                      ),
                    ],
                    source: state.dataRappelsFiltrado!,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyDataRappels extends DataTableSource {
  final List<DocumentosFirmado> data;
  final String codContrato;

  MyDataRappels(this.data, {required this.codContrato});

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].codigoDocumento.toString())),
      DataCell(Text(data[index].nombre ?? '')),
      DataCell(Text(data[index].anio.toString())),
      DataCell(
        Row(
          children: [
            StatusLabelWidgetSigned(data[index].descripcion == 'FIRMADO'),
            spacerS,
            DownloadPdfContractsTable(
              onPressed: () =>
                  getIt.get<ContratsRepository>().downloadPdfRappel(
                        codContrato: codContrato,
                        codDocumento: data[index].codigoDocumento.toString(),
                        name: data[index].nombre ?? '',
                      ),
            )
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

class StatusLabelWidgetSigned extends StatelessWidget {
  const StatusLabelWidgetSigned(this.firmado, {super.key});

  final bool firmado;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: firmado ? AppColor.success200 : AppColor.error200,
      ),
      child: Text(
        firmado ? '• Firmado' : '• No Firmado',
        style: AppTextStyle.inputLabelStyle
            .copyWith(color: firmado ? AppColor.success500 : AppColor.error500),
      ),
    );
  }
}
