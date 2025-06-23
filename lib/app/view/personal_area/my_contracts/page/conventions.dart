import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/domain/model/contract_conventions.dart';
import 'package:vemare/app/domain/model/contrato_rappel.dart';
import 'package:vemare/app/domain/utils/year_list.dart';
import 'package:vemare/app/domain/widgets_utils/circular_progress_colors.dart';
import 'package:vemare/app/domain/widgets_utils/footer_widget.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_download_button/my_download_pdf_contracts.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_input/my_input_search.dart';
import 'package:vemare/app/view/_components/my_signature/my_signature.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/no_result/no_result_table.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/bloc/my_contracts_cubit.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/bloc/my_contracts_state.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/rappels.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class Conventions extends StatelessWidget {
  const Conventions({
    Key? key,
    required this.scrollBottomBarController
  }) : super(key: key);

  final ScrollController scrollBottomBarController;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyContratsCubit>();

    return BlocBuilder<MyContratsCubit, MyContratsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          controller: scrollBottomBarController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Mis convenciones', style: AppTextStyle.h1Style),
                    const UserName(),
                    spacerL,
                    const Text(
                      'Filtrar por año',
                      style: AppTextStyle.inputLabelStyle,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MyCustomDropdownButton(
                          hint: DateTime.now().year.toString(),
                          hintStyle: AppTextStyle.inputStyle,
                          dropdownItems: yearsList.map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: AppTextStyle.inputStyle),
                          )).toList(),
                          value: state.yearSelectedConvention.toString(),
                          onChanged: (value) {
                            if(value != null){
                              cubit.changeDateConvention(anio: value);
                            }
                          }),
                    ),
                    spacerM,
                    if(state.contratoConventionsList.isNotEmpty)...[
                      const Text(
                        'Seleccionar contrato',
                        style: AppTextStyle.inputLabelStyle,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: MyCustomDropdownButton(
                            hint: DateTime.now().year.toString(),
                            hintStyle: AppTextStyle.inputStyle,
                            dropdownItems: state.contratoConventionsList.map((item) => DropdownMenuItem(
                              value: item.codigoContrato,
                              child: Text(item.convencion ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppTextStyle.inputStyle),
                            ))
                                .toList(),
                            value: state.contratoConventionsModel!.codigoContrato,
                            onChanged: (value) {
                              cubit.getConvencionSelect(value as int);
                            }),
                      ),
                      spacerM,
                    ],
                    spacerM,
                    if(state.loadDataConvention)...[
                      spacerM,
                      circularProgressColors(widthContainer1: double.infinity),
                      spacerM,
                    ]else...[
                      if(state.contratoConventionsModel == null)...[
                        const NoExistWidget('Convenciones',paddingTop: 40),
                        spacerM,spacerM,
                      ]else...[
                        const _ContractCeonventions(),
                      ],
                      spacerM,
                      if (state.contratoConventionsModel != null && state.contratoConventionsModel!.serviciosContratados!.isNotEmpty)...[
                        _HiredServices()
                      ],
                      spacerM,
                      if (state.contratoConventionsModel != null && state.contratoConventionsModel!.documentosFirmados!.isNotEmpty)...[
                        _SignedDocuments()
                      ],
                    ],
                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        );
      },
    );
  }
}

class _ContractCeonventions extends StatelessWidget {

  const _ContractCeonventions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cubit = context.read<MyContratsCubit>();
    return BlocBuilder<MyContratsCubit, MyContratsState>(
      builder: (context, state) {

        int code = state.contratoConventionsModel!.codigoContrato ?? 0;

        return Card(
          margin: const EdgeInsets.only(bottom: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Información principal", style: AppTextStyle.h2Style),
                spacerM,
                state.contratoConventionsModel!.firmado == 'Si' ? Container() :
                SizedBox(
                  width: double.infinity,
                  child: MyIconButton(
                    onPressed: () async {
                      bool? res = await myDialogSignature(context,
                          sign: (name, nif, signature) async {
                            cubit.signConvenciones(
                                name: name,
                                nif: nif,
                                signature: signature);
                          });
                      if(res != null && res){
                        cubit.getConventions();
                      }
                    },
                    text: 'Firmar',
                    icon: Image.asset('assets/icons/firma.png',scale: 3,),
                    customInset: const EdgeInsets.symmetric(vertical: 2),
                  ),
                ),
                spacerM,
                MyInput(
                  key: Key("Convencion$code"),
                  label: "Convencion",
                  initialValue: state.contratoConventionsModel!.convencion!.toString(),
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: Key("Nombre$code"),
                  label: "Nombre",
                  initialValue: state.contratoConventionsModel!.nombre ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: Key("Teléfono móvil$code"),
                  label: "Teléfono móvil",
                  initialValue: state.contratoConventionsModel!.movil ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: Key("Email$code"),
                  label: "Email",
                  initialValue: state.contratoConventionsModel!.email ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: Key("Fecha inicio$code"),
                  label: "Fecha inicio",
                  initialValue: state.contratoConventionsModel!.fechaInicio ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: Key("Fecha baja$code"),
                  label: "Fecha baja",
                  initialValue: state.contratoConventionsModel!.fechaBaja ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: Key("Firmado$code"),
                  label: "Firmado",
                  initialValue: state.contratoConventionsModel!.firmado ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: Key("Notas del cliente$code"),
                  label: "Notas del cliente",
                  initialValue: state.contratoConventionsModel!.notasCliente ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: Key("Contrato de cliente$code"),
                  label: "Contrato de cliente",
                  initialValue: state.contratoConventionsModel!.clientesContrato ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                if(state.contratoConventionsModel!.fechaFirma!.toString().isNotEmpty)...[
                  spacerM,
                  Container(
                    width: double.infinity,
                    //margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 2,
                    color: AppColor.blue100,
                  ),
                  spacerM,
                  const Text("Datos de la firma", style: AppTextStyle.h2Style),
                  spacerM,
                  MyInput(
                    key: Key("Fecha de firma$code"),
                    label: "Fecha de firma",
                    initialValue: state.contratoConventionsModel!.fechaFirma!.toString(),
                    readOnly: true,
                    variant: MyInputVariant.backgroundBlue,
                  ),
                  MyInput(
                    key: Key("Persona que firma$code"),
                    label: "Persona que firma",
                    initialValue: state.contratoConventionsModel!.firmaPersonaquefirma ?? '',
                    readOnly: true,
                    variant: MyInputVariant.backgroundBlue,
                  ),
                  MyInput(
                    key: Key("NIF de persona que firma$code"),
                    label: "NIF de persona que firma",
                    initialValue: state.contratoConventionsModel!.nifPersonaquefirma ?? '',
                    readOnly: true,
                    variant: MyInputVariant.backgroundBlue,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );


  }
}

class _HiredServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final cubit = context.read<MyContratsCubit>();
    return BlocBuilder<MyContratsCubit, MyContratsState>(
      builder: (context, state) {

        double hSize = 350;
        if(state.dataConventionFiltradoConvention!.rowCount <= 5){
          if(state.dataConventionFiltradoConvention!.rowCount > 2){
            hSize = hSize + (20 * state.dataConventionFiltradoConvention!.rowCount);
          }
        }else{
          hSize = 500;
        }

        return SizedBox(
          height: hSize,
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
                      spacerXs,
                      Text(
                        '${state.dataConventionHiredServicesConvention!.rowCount} Total',
                        style: AppTextStyle.h14StyleNeu40,
                      ),
                      // spacerM,
                    ],
                  ),
                ),
                spacerS,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MySearchInput(
                    hintText: 'Buscar por palabras claves...',
                    onChanged: cubit.filtroConvencionesHiredServices,
                    fillColor: AppColor.blue50,
                    borderSideColor: AppColor.blue100,
                  ),
                ),
                spacerS,
                Expanded(
                  child: PaginatedDataTable2(
                    wrapInCard: false,
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 1500, empty: const NoResultTable(),
                    rowsPerPage: state.dataConventionHiredServicesConvention!.rowCount <= 10 ? state.dataConventionHiredServicesConvention!.rowCount : 10,
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
                        label: Text('CANTIDAD'),
                        fixedWidth: 80,
                        // size: ColumnSize.L,
                      ),
                      DataColumn2(
                        label: Text('PLAZAS'),
                        fixedWidth: 80,
                        // size: ColumnSize.L,
                      ),
                    ],
                    source: state.dataConventionHiredServicesConvention!,
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

class MyDataConvencionHiredServices extends DataTableSource {
  final List<ServiciosContratado> data;

  MyDataConvencionHiredServices(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].servicio ?? "",textAlign: TextAlign.center,)),
      DataCell(Text(data[index].codigo ?? "",textAlign: TextAlign.center,)),
      DataCell(Text(data[index].cantidad.toString(),textAlign: TextAlign.center,)),
      DataCell(Text(data[index].plazasServicio.toString(),textAlign: TextAlign.center,)),
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
        double hSize = 350;
        if(state.dataConventionFiltradoConvention!.rowCount <= 5){
          if(state.dataConventionFiltradoConvention!.rowCount > 2){
            hSize = hSize + (20 * state.dataConventionFiltradoConvention!.rowCount);
          }
        }else{
          hSize = 500;
        }
        return SizedBox(
          height: hSize,
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
                      spacerXs,
                      Text(
                        '${state.dataConventionFiltradoConvention!.rowCount} Total',
                        style: AppTextStyle.h14StyleNeu40,
                      ),
                      // spacerM,
                    ],
                  ),
                ),
                spacerS,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: MySearchInput(
                    hintText: 'Buscar por palabras claves...',
                    onChanged: cubit.filtroConventionFirmados,
                    fillColor: AppColor.blue50,
                    borderSideColor: AppColor.blue100,
                  ),
                ),
                spacerS,
                Expanded(
                  child: PaginatedDataTable2(
                    wrapInCard: false,
                    columnSpacing: 12,
                    horizontalMargin: 12,
                    minWidth: 850,
                    rowsPerPage: state.dataConventionFiltradoConvention!.rowCount <= 10 ? state.dataConventionFiltradoConvention!.rowCount : 10,
                    empty: const NoResultTable(),
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
                    source: state.dataConventionFiltradoConvention!,
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

class MyDataTableConvencione extends DataTableSource {
  final List<DocumentosFirmado> data;
  final ContratoConventionsModel? contrato;

  MyDataTableConvencione(this.data, {required this.contrato});

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
              onPressed: () => getIt.get<ContratsRepository>().downloadPdfConvenciones(
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