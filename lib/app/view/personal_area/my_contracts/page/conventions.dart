import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
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
import 'package:vemare/app/view/_components/user_name/user_name.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/providers/conventions_provider.dart';
import 'package:vemare/app/view/personal_area/my_contracts/page/rappels.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class Conventions extends StatelessWidget {
  const Conventions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context1) => ConventionsProvider(getIt.get<ContratsRepository>()),
        child: Consumer<ConventionsProvider>(
            builder: (context2, provider, child){
              return SingleChildScrollView(
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
                                value: provider.yearSelected.toString(),
                                onChanged: (value) {
                                  if(value != null){
                                    provider.yearSelected = value;
                                  }
                                }),
                          ),
                          spacerM,
                          if(provider.loadData)...[
                            spacerM,
                            circularProgressColors(),
                            spacerM,
                          ]else...[
                            if(provider.contratoConventionsModel == null)...[
                              const NoExistWidget('Convenciones',paddingTop: 40),
                              spacerM,spacerM,
                            ]else...[
                              const _ContractCeonventions(),
                            ],
                            spacerM,
                            if (provider.contratoConventionsModel != null && provider.contratoConventionsModel!.serviciosContratados!.isNotEmpty)...[
                              _HiredServices()
                            ],
                            spacerM,
                            if (provider.contratoConventionsModel != null && provider.contratoConventionsModel!.documentosFirmados!.isNotEmpty)...[
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
            }
        )
    );
  }
}

class _ContractCeonventions extends StatelessWidget {

  const _ContractCeonventions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ConventionsProvider provider = Provider.of<ConventionsProvider>(context);

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
            provider.contratoConventionsModel!.firmado == 'Si' ? Container() :
            SizedBox(
              width: double.infinity,
              child: MyIconButton(
                onPressed: () {
                  myDialogSignature(context,
                    sign: (name, nif, signature) async {
                      provider.signConvenciones(
                          name: name,
                          nif: nif,
                          signature: signature);
                    });
                },
                text: 'Firmar',
                icon: Image.asset('assets/icons/firma.png',scale: 3,),
                customInset: const EdgeInsets.symmetric(vertical: 2),
              ),
            ),
            spacerM,
            MyInput(
              key: const Key("Código del evento"),
              label: "Código del evento",
              initialValue: provider.contratoConventionsModel!.codConvencion!.toString(),
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Nombre del taller"),
              label: "Nombre del taller",
              initialValue: provider.contratoConventionsModel!.convencion ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Teléfono móvil"),
              label: "Teléfono móvil",
              initialValue: provider.contratoConventionsModel!.movil ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Email"),
              label: "Email",
              initialValue: provider.contratoConventionsModel!.email ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Fecha inicio"),
              label: "Fecha inicio",
              initialValue: provider.contratoConventionsModel!.fechaInicio ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Fecha baja"),
              label: "Fecha baja",
              initialValue: provider.contratoConventionsModel!.fechaBaja ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Firmado"),
              label: "Firmado",
              initialValue: provider.contratoConventionsModel!.firmado ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Notas del cliente"),
              label: "Notas del cliente",
              initialValue: provider.contratoConventionsModel!.notasCliente ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            MyInput(
              key: const Key("Contrato de cliente"),
              label: "Contrato de cliente",
              initialValue: provider.contratoConventionsModel!.clientesContrato ?? '',
              readOnly: true,
              variant: MyInputVariant.backgroundBlue,
            ),
            if(provider.contratoConventionsModel!.fechaFirma!.toString().isNotEmpty)...[
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
                key: const Key("Fecha de firma"),
                label: "Fecha de firma",
                initialValue: provider.contratoConventionsModel!.fechaFirma!.toString(),
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("Persona que firma"),
                label: "Persona que firma",
                initialValue: provider.contratoConventionsModel!.firmaPersonaquefirma ?? '',
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("NIF de persona que firma"),
                label: "NIF de persona que firma",
                initialValue: provider.contratoConventionsModel!.nifPersonaquefirma ?? '',
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _HiredServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ConventionsProvider provider = Provider.of<ConventionsProvider>(context);

    double hSize = 350;
    if(provider.dataConventionFiltrado!.rowCount <= 5){
      if(provider.dataConventionFiltrado!.rowCount > 2){
        hSize = hSize + (20 * provider.dataConventionFiltrado!.rowCount);
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
                      '${provider.dataConventionHiredServices!.rowCount} Total',
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
                onChanged: provider.filtroConvencionesHiredServices,
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
                rowsPerPage: provider.dataConventionHiredServices!.rowCount <= 10 ? provider.dataConventionHiredServices!.rowCount : 10,
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
                source: provider.dataConventionHiredServices!,
              ),
            ),
          ],
        ),
      ),
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
    ConventionsProvider provider = Provider.of<ConventionsProvider>(context);

    double hSize = 350;
    if(provider.dataConventionFiltrado!.rowCount <= 5){
      if(provider.dataConventionFiltrado!.rowCount > 2){
        hSize = hSize + (20 * provider.dataConventionFiltrado!.rowCount);
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
                    '${provider.dataConventionFiltrado!.rowCount} Total',
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
                onChanged: provider.filtroMillenniumHiredServices,
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
                rowsPerPage: provider.dataConventionFiltrado!.rowCount <= 10 ? provider.dataConventionFiltrado!.rowCount : 10,
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
                source: provider.dataConventionFiltrado!,
              ),
            ),
          ],
        ),
      ),
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