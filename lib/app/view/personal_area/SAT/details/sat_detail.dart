import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/intervencion_detalle.dart';
import 'package:vemare/app/domain/model/intervenciones.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/sat_details_cubit.dart';
import 'bloc/sat_details_state.dart';

class SatDetailPage extends StatelessWidget {
  const SatDetailPage._();

  static const route = '/sat_detail';

  static Widget create(Intervenciones data) {
    return BlocProvider(
      create: (context) => SatDetailCubit(
        getIt.get<MyAccountRepository>(),
        data,
      ),
      child: const SatDetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: BlocBuilder<SatDetailCubit, SatDetailState>(
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
                        const Text('Detalles SAT Intervención',
                            style: AppTextStyle.h1Style),
                        const UserName(),
                        const Divider(),
                        spacerXs,
                        state.loading
                            ? const MyShimmer(
                                margin: EdgeInsets.zero,
                                height: 540,
                                borderRadius: 12,
                              )
                            : _Detail(state.detail!),
                        if (state.detail?.maquinas?.isNotEmpty ?? false)
                          _Maquinas(),
                        if (state.detail?.materiales?.isNotEmpty ?? false)
                          _Materiales()
                        // if ((state.detail?.firmado ?? 'No') == 'No' &&
                        //     !state.loading) ...[
                        //   MyIconButton(
                        //     onPressed: () {
                        //       myDialogSignature(context,
                        //           sign: (name, nif, signature) async {
                        //         await cubit.sign(
                        //           name: name,
                        //           nif: nif,
                        //           signature: signature,
                        //         );
                        //       });
                        //     },
                        //     text: 'Firmar',
                        //     icon: Image.asset(
                        //       'assets/icons/firma.png',
                        //       scale: 2,
                        //     ),
                        //   ),
                        //   spacerM,
                        // ]
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

  final IntervencionesDetalle detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.blue100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyInput(
            key: const Key("sCLIENTE"),
            label: 'CLIENTE',
            initialValue: LocalDataRepository().user!.code,
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sCodInt"),
            label: 'CÓDIGO INTERVENCIÓN',
            initialValue: detail.codigoIntervencion?.toString() ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sClass"),
            label: 'CLASIFICACIÓN',
            initialValue: detail.clasificacion ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sfechaPlani"),
            label: 'FECHA PLANIFICACIÓN',
            initialValue: detail.fechaPlanificacion ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sHoraPlani"),
            label: 'HORA PLANIFICACIÓN',
            initialValue: detail.horaPlanificacion ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sNum"),
            label: 'NÚMERO',
            initialValue: detail.numero ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sAsunto"),
            label: 'ASUNTO',
            initialValue: detail.asunto ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sTrabj"),
            label: 'TRABAJO REALIZADO',
            initialValue: detail.trabajoRealizado ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sMatUtili"),
            label: 'MATERIAL UTILIZADO',
            initialValue: detail.materialUtilizado ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sObserv"),
            label: 'OBSERVACIONES',
            initialValue: detail.observaciones ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sFirm"),
            label: 'FIRMADO',
            initialValue: detail.firmado ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sFechaCargo"),
            label: 'FECHA CARGO',
            initialValue: detail.fechaCargo ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sAlbaran"),
            label: 'ALBARAN',
            initialValue: detail.albaran ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sFechaCierre"),
            label: 'FECHA CIERRE',
            initialValue: detail.fechaCierre ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sEnGarantia"),
            label: 'EN GARANTÍA',
            initialValue: (detail.enGarantia ?? false) ? 'SI' : 'NO',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sNoGarantia"),
            label: 'NÚMERO GARANTÍA',
            initialValue: detail.numeroGarantia ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sFecLLegMaterial"),
            label: 'FECHA LLEGADA MATERIAL',
            initialValue: detail.fechaLlegadaMaterial ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sFecSalidaProv"),
            label: 'FECHA SALIDA PROVEEDOR',
            initialValue: detail.fechaSalidaProveedor ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sFecSalidaCli"),
            label: 'FECHA SALIDA CLIENTE',
            initialValue: detail.fechaSalidaCliente ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
          MyInput(
            key: const Key("sMarcInterv"),
            label: 'MARCA INTERVENCIÓN',
            initialValue: detail.marcaIntervencion ?? '',
            readOnly: true,
            variant: MyInputVariant.backgroundBlue,
          ),
        ],
      ),
    );
  }
}

class _Maquinas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SatDetailCubit>();
    return Container(
        width: double.infinity,
        // padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColor.blue100),
        ),
        child: BlocBuilder<SatDetailCubit, SatDetailState>(
          builder: (context, state) {

            double hSize = 350;
            if(state.dataMaquinas!.rowCount <= 5){
              if(state.dataMaquinas!.rowCount > 2){
                hSize = hSize + (20 * state.dataMaquinas!.rowCount);
              }
            }else{
              hSize = 500;
            }

            return SizedBox(
              height: hSize,
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
                          'Maquinas',
                          style: AppTextStyle.h3Style,
                        ),
                        Text('${state.dataMaquinas!.rowCount} Total'),
                        // spacerM,
                        spacerS,
                        MySearchInput(
                          hintText: 'Buscar por palabras claves...',
                          onChanged: cubit.filtroMaquina,
                          fillColor: AppColor.blue50,
                          borderSideColor: AppColor.blue100,
                        ),
                        spacerS,
                      ],
                    ),
                  ),
                  Expanded(
                    child: PaginatedDataTable2(
                      wrapInCard: false,
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      empty: const NoResultTable(),
                      minWidth: 1500,
                      rowsPerPage: state.dataMaquinas!.rowCount <= 10 ? state.dataMaquinas!.rowCount : 10,
                      columns: const [
                        DataColumn2(
                          label: Text('CÓDIGO MAQUINA'),
                          fixedWidth: 120,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('MARCA'),
                          fixedWidth: 100,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('MODELO'),
                          fixedWidth: 200,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('NÚMERO SERIE'),
                          fixedWidth: 100,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('AÑO FABRICACIÓN'),
                          fixedWidth: 120,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('GARANTÍA'),
                          fixedWidth: 80,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('FI GARANTÍA'),
                          fixedWidth: 100,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('FF GARANTÍA'),
                          fixedWidth: 100,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('PMP'),
                          fixedWidth: 80,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('FI PMP'),
                          fixedWidth: 80,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('FF PMP'),
                          fixedWidth: 80,
                          // size: ColumnSize.L,
                        ),
                      ],
                      source: state.dataMaquinas!,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class MyDataMaquinas extends DataTableSource {
  final List<MaquinaInt> data;

  MyDataMaquinas(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].codigoMaquina?.toString() ?? '')),
      DataCell(Text(data[index].marca ?? '')),
      DataCell(Text(data[index].modelo ?? '')),
      DataCell(Text(data[index].numeroSerie ?? '')),
      DataCell(Text(data[index].anioFabricacion?.toString() ?? '')),
      DataCell(Text(data[index].garantia ?? '')),
      DataCell(Text(data[index].fiGarantia ?? '')),
      DataCell(Text(data[index].ffGarantia ?? '')),
      DataCell(Text(data[index].pmp ?? '')),
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

class _Materiales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SatDetailCubit>();
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColor.blue100),
        ),
        child: BlocBuilder<SatDetailCubit, SatDetailState>(
          builder: (context, state) {

            double hSize = 350;
            if(state.dataMateriales!.rowCount <= 5){
              if(state.dataMateriales!.rowCount > 2){
                hSize = hSize + (20 * state.dataMateriales!.rowCount);
              }
            }else{
              hSize = 500;
            }

            return SizedBox(
              height: hSize,
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
                          'Materiales',
                          style: AppTextStyle.h3Style,
                        ),
                        Text('${state.dataMateriales!.rowCount} Total'),
                        // spacerM,
                        spacerS,
                        MySearchInput(
                          hintText: 'Buscar por palabras claves...',
                          onChanged: cubit.filtroMateriales,
                          fillColor: AppColor.blue50,
                          borderSideColor: AppColor.blue100,
                        ),
                        spacerS,
                      ],
                    ),
                  ),
                  Expanded(
                    child: PaginatedDataTable2(
                      wrapInCard: false,
                      columnSpacing: 12,
                      horizontalMargin: 12,
                      empty: const NoResultTable(),
                      minWidth: 640,
                      rowsPerPage: state.dataMateriales!.rowCount <= 10 ? state.dataMateriales!.rowCount : 10,
                      columns: const [
                        DataColumn2(
                          label: Text('CÓDIGO MATERIAL'),
                          fixedWidth: 120,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('ORDEN'),
                          fixedWidth: 100,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('ARTICULO ISI'),
                          fixedWidth: 140,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('DESCRIPCIÓN BREVE'),
                          fixedWidth: 140,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('CANTIDAD'),
                          fixedWidth: 80,
                          // size: ColumnSize.L,
                        ),
                      ],
                      source: state.dataMateriales!,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class MyDataMateriales extends DataTableSource {
  final List<MaterialesInt> data;

  MyDataMateriales(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].codigoMaterial?.toString() ?? '')),
      DataCell(Text(data[index].orden ?? '')),
      DataCell(Text(data[index].articuloIsi ?? '')),
      DataCell(Text(data[index].descripcionBreve ?? '')),
      DataCell(Text(data[index].cantidad?.toString() ?? '')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
