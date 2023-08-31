import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/contract_millenium.dart';
import 'package:vemare/app/domain/model/contrato_rappel.dart';
import 'package:vemare/app/domain/utils/year_list.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_download_button/my_download_button.dart';
import 'package:vemare/app/view/_components/my_download_button/my_download_pdf_contracts.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_signature/my_signature.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/my_contracts_cubit.dart';
import 'bloc/my_contracts_state.dart';
import 'rappels.dart';

class Millennium extends StatelessWidget {
  const Millennium({
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
              const Text('Contratos Millenium', style: AppTextStyle.h1Style),
              const UserName(),
              spacerL,
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
                  value: state.yearSelectMill,
                  onChanged: (value) {
                    cubit.getMill(value!);
                  }),
              spacerM,
              if (state.loading)
                const MyShimmer(
                  margin: EdgeInsets.zero,
                  height: 500,
                  borderRadius: 12,
                ),
              if (state.mill == null && !state.loading)
                const NoExistWidget('contratos'),
              if (state.mill != null && !state.loading)
                Column(
                  children: [
                    _ContractMillenium(state.mill!),
                    if (state.mill?.serviciosContratados?.isNotEmpty ?? false)
                      _HiredServices(),
                    if (state.mill?.documentosFirmados?.isNotEmpty ?? false)
                      _SignedDocuments(),
                    spacerM,
                    Visibility(
                      visible: state.mill!.firmado == 'No',
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                        child: MyIconButton(
                          onPressed: () {
                            myDialogSignature(context,
                                sign: (name, nif, signature) async {
                              await cubit.signMill(
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

class _ContractMillenium extends StatelessWidget {
  const _ContractMillenium(
    this.mill, {
    Key? key,
  }) : super(key: key);

  final ContratoMillenium mill;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Información principal", style: AppTextStyle.h2Style),
            // spacerM,
            // DownloadPdfContracts(
            //   onPressed: () {
            //     return Future.delayed(const Duration(milliseconds: 2500));
            //   },
            //   // onPressed: () =>
            //   //     getIt.get<ContratsRepository>().downloadPdfRappelDetalles(
            //   //           codContrato: rappel.codigoContrato.toString(),
            //   //           name: 'Rappel_${rappel.codigoContrato}.pdf',
            //   //         ),
            // ),
            spacerM,
            MyInput(
              key: const Key("Código del contrato"),
              label: "Código del contrato",
              initialValue: mill.codigoContrato.toString(),
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Teléfono móvil"),
              label: "Teléfono móvil",
              initialValue: mill.movil ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Email"),
              label: "Email",
              initialValue: mill.email ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Pack"),
              label: "Pack",
              initialValue: mill.pack ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Valor de servicios"),
              label: "Valor de servicios",
              initialValue: "${mill.valorServicios}€",
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Objetivo total"),
              label: "Objetivo total",
              initialValue: "${mill.objetivoTotal}€",
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Cuota mensual"),
              label: "Cuota mensual",
              initialValue: "${mill.cuotaMensual}€",
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Cuota anual"),
              label: "Cuota anual",
              initialValue: "${mill.cuotaAnual}€",
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Cuota anual a devolver"),
              label: "Cuota anual a devolver",
              initialValue: "${mill.cuotaAnualDevolver}€",
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Fecha inicio"),
              label: "Fecha de inicio",
              initialValue: mill.fechaInicio ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Fecha de fin"),
              label: "Fecha de fin",
              initialValue: mill.fechaFin ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Fecha de baja"),
              label: "Fecha de baja",
              initialValue: mill.fechaBaja ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Notas cliente"),
              label: "Notas cliente",
              initialValue: mill.notasCliente ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Contrato de cliente"),
              label: "Contrato de cliente",
              initialValue: mill.clientesContrato ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Porcentaje de consecución"),
              label: "Porcentaje de consecución",
              initialValue: "${mill.porcentajeConsecucion}%",
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Firmado"),
              label: "Firmado",
              initialValue: mill.firmado ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            // if (mill.serviciosContratados != null) ...[
            //   spacerS,
            //   const MyDivider(),
            //   Visibility(
            //     visible: mill.serviciosContratados!.isNotEmpty,
            //     child: Text('SERVICIOS CONTRATADOS',
            //         style: AppTextStyle.defaultStyle
            //             .copyWith(fontWeight: FontWeight.bold)),
            //   ),
            //   const MyDivider()
            // ],
            // spacerS,
            // if (mill.serviciosContratados != null)
            //   ...mill.serviciosContratados!
            //       .map((e) => Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Item(title: "SERVICIO", content: e.servicio ?? ''),
            //               spacerS,
            //               Row(
            //                 children: [
            //                   Expanded(
            //                     child: Item(
            //                         title: "SERVICIO DEL PACK",
            //                         content: (e.servicioDelPack ?? false)
            //                             ? 'SI'
            //                             : 'NO'),
            //                   ),
            //                   Expanded(
            //                     child: Item(
            //                         title: "VALOR", content: '${e.valor}€'),
            //                   ),
            //                 ],
            //               ),
            //               spacerS,
            //               Row(
            //                 children: [
            //                   Expanded(
            //                     child: Item(
            //                         title: "CANTIDAD",
            //                         content: e.cantidad.toString()),
            //                   ),
            //                   Expanded(
            //                     child: Item(
            //                         title: "FECHA DE INICIO",
            //                         content: e.fechaInicioServicio ?? ''),
            //                   ),
            //                 ],
            //               ),
            //               if (e != mill.serviciosContratados!.last)
            //                 const MyDivider(),
            //             ],
            //           ))
            //       .toList(),
            // if (mill.documentosFirmados != null) ...[
            //   spacerS,
            //   const MyDivider(),
            //   Visibility(
            //     visible: mill.documentosFirmados!.isNotEmpty,
            //     child: Text('DOCUMENTOS FIRMADOS',
            //         style: AppTextStyle.defaultStyle
            //             .copyWith(fontWeight: FontWeight.bold)),
            //   ),
            //   const MyDivider()
            // ],
            // spacerS,
            // if (mill.documentosFirmados != null)
            //   ...mill.documentosFirmados!
            //       .map((e) => Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   Item(
            //                       title: "COD. DOCUMENTO",
            //                       content: e.codigoDocumento?.toString() ?? ''),
            //                   ButtonDownloadPdf(
            //                     future: () => getIt
            //                         .get<ContratsRepository>()
            //                         .downloadPdfMill(
            //                           anio: e.anio.toString(),
            //                           codContrato:
            //                               mill.codigoContrato.toString(),
            //                           codDocumento:
            //                               e.codigoDocumento.toString(),
            //                           name: e.nombre ?? 'doc.pdf',
            //                         ),
            //                   ),
            //                 ],
            //               ),
            //               spacerS,
            //               Item(title: "NOMBRE", content: e.nombre ?? ''),
            //               spacerS,
            //               Item(
            //                   title: "DESCRIPCIÓN",
            //                   content: e.descripcion ?? ''),
            //               spacerS,
            //               Item(title: "AÑO", content: e.anio?.toString() ?? ''),
            //               if (e != mill.documentosFirmados!.last)
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

class _HiredServices extends StatelessWidget {
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
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                        'Servicios contratados',
                        style: AppTextStyle.h3Style,
                      ),
                      Text(
                          '${state.dataMillenniumHiredServices!.rowCount} Total'),
                      // spacerM,
                    ],
                  ),
                ),
                spacerS,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MySearchInput(
                    hintText: 'Buscar por palabras claves...',
                    onChanged: cubit.filtroMillenniumHiredServices,
                  ),
                ),
                spacerS,
                Expanded(
                  child: PaginatedDataTable2(
                    wrapInCard: false,
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 1500,
                    // smRatio: 0.5,
                    columns: const [
                      DataColumn2(
                        label: Text('SERVICIO'),
                        fixedWidth: 160,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('CÓDIGO'),
                        fixedWidth: 100,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('SERVICIO DEL PACK'),
                        fixedWidth: 140,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('VALOR'),
                        fixedWidth: 80,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('CANTIDAD'),
                        fixedWidth: 80,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('TIPO SELECCIÓN'),
                        fixedWidth: 120,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('FECHA INICIO SERVICIO'),
                        fixedWidth: 150,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('TIENE FIRMA RGPD'),
                        fixedWidth: 150,
                        // size: ColumnSize.L,
                      ),
                    ],
                    source: state.dataMillenniumHiredServices!,
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

class MyDataMillenniumHiredServices extends DataTableSource {
  final List<ServiciosContratado> data;

  MyDataMillenniumHiredServices(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].servicio ?? "")),
      DataCell(Text(data[index].codigo ?? "")),
      DataCell(Text(data[index].servicioDelPack ?? "")),
      DataCell(Text("${data[index].valor} €")),
      DataCell(Text(data[index].cantidad.toString())),
      DataCell(Text(data[index].tipoSeleccion ?? '')),
      DataCell(Text(data[index].fechaInicioServicio ?? '')),
      DataCell(Text(data[index].tieneFirmaRgpd ?? '')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
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
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                      Text('${state.dataMillenniumFiltrado!.rowCount} Total'),
                      // spacerM,
                    ],
                  ),
                ),
                spacerS,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MySearchInput(
                    hintText: 'Buscar por palabras claves...',
                    onChanged: cubit.filtroMillennium,
                  ),
                ),
                spacerS,
                Expanded(
                  child: PaginatedDataTable2(
                    wrapInCard: false,
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 850,
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
                    source: state.dataMillenniumFiltrado!,
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

class MyDataMillennium extends DataTableSource {
  final List<DocumentosFirmado> data;
  final ContratoMillenium? contrato;

  MyDataMillennium(this.data, {required this.contrato});

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
              onPressed: () => getIt.get<ContratsRepository>().downloadPdfMill(
                    anio: data[index].anio.toString(),
                    codContrato: contrato!.codigoContrato.toString(),
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




// class StatusLabelWidgetSigned extends StatelessWidget {
//   const StatusLabelWidgetSigned(this.firmado, {super.key});

//   final bool firmado;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: firmado ? AppColor.success200 : AppColor.error200,
//       ),
//       child: Text(
//         firmado ? '• Firmado' : '• No Firmado',
//         style: AppTextStyle.inputLabelStyle
//             .copyWith(color: firmado ? AppColor.success500 : AppColor.error500),
//       ),
//     );
//   }
// }
