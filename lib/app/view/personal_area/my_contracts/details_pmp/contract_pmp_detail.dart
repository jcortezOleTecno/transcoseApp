import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/contract_pmp_detail.dart';
import 'package:vemare/app/domain/model/contrato_pmp.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_download_button/my_download_pdf_contracts.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_signature/my_signature.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/contract_pmp_details_cubit.dart';
import 'bloc/contract_pmp_details_state.dart';

class ContractPMPDetailPage extends StatelessWidget {
  const ContractPMPDetailPage._();

  static const route = '/contract_pmp_detail';

  static Widget create(ContratoPmp contrat) {
    return BlocProvider(
      create: (context) => ContratPMPDetailCubit(
        getIt.get<ContratsRepository>(),
        contrat,
      ),
      child: const ContractPMPDetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContratPMPDetailCubit>();
    return Scaffold(
      body: MyBody(
        child: BlocBuilder<ContratPMPDetailCubit, ContratPMPDetailState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyBackButton(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Contrato PMP', style: AppTextStyle.h1Style),
                        const UserName(),
                        const Divider(),
                        spacerXs,
                        state.loading
                            ? const MyShimmer(
                                margin: EdgeInsets.zero,
                                height: 500,
                                borderRadius: 12,
                              )
                            : _Detail(state.detail!),
                        if ((state.detail?.firmado ?? 'No') == 'No' &&
                            !state.loading) ...[
                          MyIconButton(
                            onPressed: () async {
                              bool? res = await myDialogSignature(context,
                                  sign: (name, nif, signature) async {
                                await cubit.sign(
                                  name: name,
                                  nif: nif,
                                  signature: signature,
                                );
                              });
                              if(res != null && res){
                                cubit.getDetail();
                              }
                            },
                            text: 'Firmar',
                            icon: Image.asset(
                              'assets/icons/firma.png',
                              scale: 2,
                            ),
                          ),
                          spacerM,
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail(
    this.detail, {
    Key? key,
  }) : super(key: key);

  final ContratPmpDetail detail;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ContratPMPDetailCubit>().state;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      // padding: const EdgeInsets.all(15),
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.blue100),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              spacerS,
              const Text("Detalles del contrato", style: AppTextStyle.h3Style),
              spacerM,
              MyInput(
                key: const Key("CÓDIGO DE CONTRATO"),
                label: 'CÓDIGO DE CONTRATO',
                initialValue: detail.codigoContrato.toString(),
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("FECHA DE INICIO"),
                label: 'FECHA DE INICIO',
                initialValue: detail.fechaInicio ?? '',
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("FECHA DE FIN"),
                label: 'FECHA DE FIN',
                initialValue: detail.fechaFin ?? '',
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("FECHA DE BAJA"),
                label: 'FECHA DE BAJA',
                initialValue: detail.fechaBaja ?? '',
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("IMPORTE TOTAL"),
                label: 'IMPORTE TOTAL',
                initialValue: "${detail.importeTotal}€",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("DESCUENTO"),
                label: 'DESCUENTO',
                initialValue: "${detail.descuento}€",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("IMPORTE FINAL"),
                label: 'IMPORTE FINAL',
                initialValue: "${detail.importeFinal}€",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("CUOTA INICIAL"),
                label: 'CUOTA INICIAL',
                initialValue: "${detail.cuotaInicial}€",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("CUOTA MENSUAL"),
                label: 'CUOTA MENSUAL',
                initialValue: "${detail.cuotaMensual}€",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("NÚMERO DE CUOTAS"),
                label: 'NÚMERO DE CUOTAS',
                initialValue: detail.numeroCuotas.toString(),
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("FIRMADO"),
                label: 'FIRMADO',
                initialValue: detail.firmado ?? "",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              const MyDivider(),
              spacerS,
              const Text("Datos firma", style: AppTextStyle.h3Style),
              spacerS,
              MyInput(
                key: const Key("FECHA FIRMA"),
                label: 'FECHA FIRMA',
                initialValue: detail.fechaFirma ?? "",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("PERSONA QUE FIRMA"),
                label: 'PERSONA QUE FIRMA',
                initialValue: detail.personaFirma ?? "",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("NIF PERSONA QUE FIRMA"),
                label: 'NIF PERSONA QUE FIRMA',
                initialValue: detail.nifPersonafirma ?? "",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              if (detail.documentoFirmado != null) ...[
                const MyDivider(),
                spacerS,
                const Text("Documento firmado", style: AppTextStyle.h3Style),
                spacerS,
                MyInput(
                  key: const Key("CÓDIGO DOCUMENTO"),
                  label: 'CÓDIGO DOCUMENTO',
                  initialValue:
                      detail.documentoFirmado!.codigoDocumento.toString(),
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("NOMBREDOC"),
                  label: 'NOMBRE',
                  initialValue: detail.documentoFirmado!.nombre ?? "",
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("DESCRIPCIONDOC"),
                  label: 'DESCRIPCIÓN',
                  initialValue: detail.documentoFirmado!.descripcion ?? "",
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("ANIODOC"),
                  label: 'AÑO',
                  initialValue: detail.documentoFirmado!.anio.toString(),
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                DownloadPdfContracts(
                  title: "Descargar",
                  onPressed: () => getIt
                      .get<ContratsRepository>()
                      .downloadPdfPmp(
                          codContrato: state.detail!.codigoContrato.toString(),
                          codDocumento: detail
                              .documentoFirmado!.codigoDocumento!
                              .toString(),
                          name: detail.documentoFirmado?.nombre ?? 'Doc.pdf'),
                ),
                spacerS,
              ]
            ],
          ),
        ),
        if (detail.maquinas != null)
          if (detail.maquinas!.isNotEmpty) _Maquinas(),
        if (detail.servicions != null)
          if (detail.servicions!.isNotEmpty) _Servicios()
        /*...[
            spacerS,
            const MyDivider(),
            Center(
              child: Text(
                'SERVICIOS',
                style: AppTextStyle.defaultStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const MyDivider(),
            ...detail.servicions!
                .map((e) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        spacerS,
                        Text(
                          e.nombre ?? '',
                          style: AppTextStyle.defaultStyle
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        spacerS,
                        Row(
                          children: [
                            Expanded(
                                child: Item(
                                    title: 'MANTENIMIENTO',
                                    content: fmf
                                        .copyWith(
                                            amount: e.importeMantenimiento)
                                        .output
                                        .symbolOnRight)),
                            Expanded(
                                child: Item(
                                    title: 'REPARACIÓN',
                                    content: fmf
                                        .copyWith(amount: e.importeReparacion)
                                        .output
                                        .symbolOnRight)),
                            Expanded(
                                child: Item(
                                    title: 'AVERIA',
                                    content: fmf
                                        .copyWith(amount: e.importeAveria)
                                        .output
                                        .symbolOnRight))
                          ],
                        ),
                        spacerS,
                        if (e != detail.servicions!.last) const MyDivider(),
                      ],
                    ))
                .toList()
          ],
        if (detail.documentoFirmado != null) ...[
          spacerS,
          const MyDivider(),
          Center(
            child: Text(
              'DOCUMENTO FIRMADO',
              style: AppTextStyle.defaultStyle
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const MyDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Item(
                  title: "COD. DOCUMENTO",
                  content:
                      detail.documentoFirmado?.codigoDocumento?.toString() ??
                          ''),
              ButtonDownloadPdf(
                future: () => getIt.get<ContratsRepository>().downloadPdfPmp(
                    codContrato: state.detail!.codigoContrato.toString(),
                    codDocumento:
                        detail.documentoFirmado!.codigoDocumento!.toString(),
                    name: detail.documentoFirmado?.nombre ?? 'Doc.pdf'),
              ),
            ],
          ),
          spacerS,
          Item(title: "NOMBRE", content: detail.documentoFirmado?.nombre ?? ''),
          spacerS,
          Item(
              title: "DESCRIPCIÓN",
              content: detail.documentoFirmado?.descripcion ?? ''),
          spacerS,
          Item(
              title: "AÑO",
              content: detail.documentoFirmado?.anio?.toString() ?? ''),
        ]*/
      ]),
    );
  }
}

class _Maquinas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContratPMPDetailCubit>();
    return BlocBuilder<ContratPMPDetailCubit, ContratPMPDetailState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyDivider(),
            spacerS,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Maquinas", style: AppTextStyle.h3Style),
                  Text('${state.dataMaquinas!.rowCount} Total'),
                  spacerM,
                  MySearchInput(
                    hintText: 'Buscar por palabras claves...',
                    onChanged: cubit.filtroMaquinas,
                  ),
                ],
              ),
            ),
            // spacerS,
            SizedBox(
              height: 400,
              child: PaginatedDataTable2(
                wrapInCard: false,
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 1000,
                empty: const NoResultTable(),
                // smRatio: 0.5,
                columns: const [
                  DataColumn2(
                    label: Text('MARCA'),
                    fixedWidth: 100,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('MODELO'),
                    fixedWidth: 100,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('NÚMERO DE SERIE'),
                    fixedWidth: 120,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('AÑO FABRICACIÓN'),
                    fixedWidth: 120,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('PMP'),
                    fixedWidth: 50,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('NÚMERO PMP'),
                    fixedWidth: 100,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('TIPO EQUIPO TALLER'),
                    fixedWidth: 150,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('FI PMP'),
                    fixedWidth: 100,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('FF PMP'),
                    fixedWidth: 100,
                    // size: ColumnSize.L,
                  ),
                ],
                source: state.dataMaquinas!,
              ),
            ),
          ],
        );
      },
    );
  }
}

class MyDataMaquinas extends DataTableSource {
  final List<Maquina> data;

  MyDataMaquinas(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].marca ?? '')),
      DataCell(Text(data[index].modelo ?? '')),
      DataCell(Text(data[index].numeroSerie ?? '')),
      DataCell(Text(data[index].anioFabricacion?.toString() ?? '')),
      DataCell(Text(data[index].pmp ?? '')),
      DataCell(Text(data[index].numeroPmp ?? '')),
      DataCell(Text(data[index].tipoEquipoTaller ?? '')),
      DataCell(Text(data[index].fiPmp ?? '')),
      DataCell(Text(data[index].ffPmp ?? '')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}

class _Servicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContratPMPDetailCubit>();
    return BlocBuilder<ContratPMPDetailCubit, ContratPMPDetailState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyDivider(),
            spacerS,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Servicios", style: AppTextStyle.h3Style),
                  Text('${state.dataServicios?.rowCount ?? '0'} Total'),
                  spacerM,
                  MySearchInput(
                    hintText: 'Buscar por palabras claves...',
                    onChanged: cubit.filtroServicios,
                  ),
                ],
              ),
            ),
            // spacerS,
            SizedBox(
              height: 400,
              child: PaginatedDataTable2(
                wrapInCard: false,
                columnSpacing: 12,
                horizontalMargin: 12,
                minWidth: 750,
                empty: const NoResultTable(),
                // smRatio: 0.5,
                columns: const [
                  DataColumn2(
                    label: Text('NOMBRE'),
                    fixedWidth: 200,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('IMPORTE MANTENIMIENTO'),
                    fixedWidth: 200,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('IMPORTE REPARACIÓN'),
                    fixedWidth: 150,
                    // size: ColumnSize.L,
                  ),
                  DataColumn2(
                    label: Text('IMPORTE AVERÍA'),
                    fixedWidth: 150,
                    // size: ColumnSize.L,
                  ),
                ],
                source: state.dataServicios!,
              ),
            ),
          ],
        );
      },
    );
  }
}

class MyDataServicios extends DataTableSource {
  final List<Servicion> data;

  MyDataServicios(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].nombre ?? '')),
      DataCell(Text(data[index].importeMantenimiento?.toString() ?? '')),
      DataCell(Text(data[index].importeReparacion?.toString() ?? '')),
      DataCell(Text(data[index].importeAveria?.toString() ?? '')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
