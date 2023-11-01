import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/budget_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/model/budget_detail.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
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
import 'package:vemare/app/view/personal_area/my_budget/budget_detail/bloc/budget_detail_cubit.dart';
import 'package:vemare/app/view/personal_area/my_budget/budget_detail/bloc/budget_detail_state.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class BudgetDetailPage extends StatelessWidget {
  const BudgetDetailPage._();
  static const route = '/budget_detail';

  static Widget create(Budget budget) {
    return BlocProvider(
      create: (context) => BudgetDetailCubit(
        getIt.get<BudgetRepository>(),
        budget,
      ),
      child: const BudgetDetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BudgetDetailCubit>();
    return Scaffold(
      body: BlocBuilder<BudgetDetailCubit, BudgetDetailState>(
        builder: (context, state) {
          return MyBody(
            child: Column(
              children: [
                Expanded(
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
                              const Text('Detalles Presupuesto',
                                  style: AppTextStyle.h1Style),
                              const UserName(),
                              const Divider(),
                              spacerXs,
                              Visibility(
                                  visible: !state.loading,
                                  replacement: const MyShimmer(
                                    height: 400,
                                    margin: EdgeInsets.zero,
                                  ),
                                  child: _DetailBudget(state.budgetDetails)),
                              spacerS,
                              if (state.budgetDetails?.lineasPresupuesto
                                      ?.isNotEmpty ??
                                  false)
                                _LineasPresupuesto()
                            ],
                          ),
                        ),
                        spacerM,
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: !(state.budgetDetails?.firmado ?? true) &&
                      (state.budgetDetails?.permiteFirma ?? false),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: MyIconButton(
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
                  ),
                ),
                // spacerL,
              ],
            ),
          );
        },
      ),
    );
  }
}

class _DetailBudget extends StatelessWidget {
  const _DetailBudget(
    this.budget, {
    Key? key,
  }) : super(key: key);

  final BudgetDetail? budget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BudgetDetailCubit, BudgetDetailState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.blue100),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              spacerM,
              DownloadPdfContracts(
                // title: "Descargar",
                onPressed: () => getIt
                    .get<BudgetRepository>()
                    .downloadPdfBudget(
                        codBudget: state.budget!.codigoPresupuesto.toString(),
                        numeroProyecto: state.budget!.numero.toString(),
                        name: state.budget!.numero.toString()),
              ),
              spacerM,
              MyInput(
                key: const Key("CLIENTE01"),
                label: 'CLIENTE',
                initialValue: LocalDataRepository().user!.code,
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nProyecto"),
                label: 'NÚMERO PROYECTO',
                initialValue: state.budget?.numero?.toString() ?? "",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nCodProyecto"),
                label: 'CÓDIGO PRESUPUESTO',
                initialValue: budget?.codigo?.toString() ?? "",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nAsunto"),
                label: 'ASUNTO',
                initialValue: budget?.asunto ?? "",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nActivo"),
                label: 'ACTIVO',
                initialValue: (budget?.activo ?? false) ? "SI" : "NO",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nCondicionesGenerales"),
                label: 'CONDICIONES GENERALES',
                initialValue: budget?.condicionesGenereles ?? "",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nCondicionesEspecificas"),
                label: 'CONDICIONES ESPECIFICAS',
                initialValue: budget?.condicionesEspecificas ?? "",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nfecha"),
                label: 'FECHA',
                initialValue: budget?.fecha ?? "",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nfechaValidez"),
                label: 'FECHA VALIDEZ',
                initialValue: budget?.fechaValidez ?? "",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nVERSION"),
                label: 'VERSIÓN',
                initialValue: budget?.version.toString() ?? "",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nImpMontaje"),
                label: 'IMPORTE SAT MONTAJE',
                initialValue: fmf
                    .copyWith(amount: budget?.importeSatMontaje?.toDouble())
                    .output
                    .symbolOnRight,
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nImpTrans"),
                label: 'IMPORTE SAT TRANSPORTE',
                initialValue: fmf
                    .copyWith(amount: budget?.importeSatTransporte?.toDouble())
                    .output
                    .symbolOnRight,
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nImpNeto"),
                label: 'IMPORTE SAT NETO',
                initialValue: "${budget?.importeNeto ?? ''} €",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nImpBase"),
                label: 'BASE IMPONIBLE',
                initialValue: "${budget?.baseImponible ?? ''} €",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nImpIva"),
                label: 'IMPORTE IVA',
                initialValue: "${budget?.importeIva ?? ''} €",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nDescuento"),
                label: 'DESCUENTO',
                initialValue: "${budget?.descuento ?? ''} €",
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nTransIncl"),
                label: 'TRANSPORTE INCLUIDO',
                initialValue:
                    (budget?.transporteIncluido ?? false) ? 'SI' : 'NO',
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nMontIncl"),
                label: 'MONTAJE INCLUIDO',
                initialValue: (budget?.montajeIncluido ?? false) ? 'SI' : 'NO',
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              const MyDivider(),

              const Text(
                "Datos Firma",
                style: AppTextStyle.h2Style,
              ),
              spacerS,
              MyInput(
                key: const Key("nfechaFirma"),
                label: 'FECHA FIRMA',
                initialValue: budget?.fechaFirma ?? '',
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nQuienFirma"),
                label: 'QUIEN FIRMA',
                initialValue: budget?.quienFirma ?? '',
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),
              MyInput(
                key: const Key("nNIFQuienFirma"),
                label: 'NIF QUIEN FIRMA',
                initialValue: budget?.nifQuienFirma ?? '',
                readOnly: true,
                variant: MyInputVariant.backgroundBlue,
              ),

              /*if (budget?.lineasPresupuesto != null) ...[
                spacerM,
                const Text('LINEAS DE PRESUPUESTO',
                    style: AppTextStyle.defaultStyle),
                const Divider(thickness: 2, height: 25),
                ...budget!.lineasPresupuesto!
                    .map((e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('REF.', style: AppTextStyle.defaultStyle),
                            Text(e.referencia ?? '',
                                style: AppTextStyle.defaultStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                )),
                            spacerXs,
                            const Text('DESCRIPCIÓN',
                                style: AppTextStyle.defaultStyle),
                            Text(e.descripcionBreve ?? '',
                                style: AppTextStyle.defaultStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                )),
                            spacerXs,
                            const Text('IMPORTE NETO',
                                style: AppTextStyle.defaultStyle),
                            Text('${e.importeNeto ?? ''} €',
                                style: AppTextStyle.defaultStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                )),
                            const Divider(
                              thickness: 2,
                              height: 25,
                            ),
                          ],
                        ))
                    .toList(),
              ],*/
              // spacerM,
              // const MyLabelStatus.approved()
            ],
          ),
        );
      },
    );
  }
}

class _LineasPresupuesto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BudgetDetailCubit>();
    return Container(
        width: double.infinity,
        // padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColor.blue100),
        ),
        child: BlocBuilder<BudgetDetailCubit, BudgetDetailState>(
          builder: (context, state) {

            double hSize = 350;
            if(state.dataBudgetDetail!.rowCount <= 5){
              if(state.dataBudgetDetail!.rowCount > 2){
                hSize = hSize + (20 * state.dataBudgetDetail!.rowCount);
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
                          'Presupuestos',
                          style: AppTextStyle.h3Style,
                        ),
                        Text('${state.dataBudgetDetail!.rowCount} Total'),
                        // spacerM,
                        spacerS,
                        MySearchInput(
                          hintText: 'Buscar por palabras claves...',
                          onChanged: cubit.filtro,
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
                      rowsPerPage: state.dataBudgetDetail!.rowCount <= 10 ? state.dataBudgetDetail!.rowCount : 10,
                      columns: const [
                        DataColumn2(
                          label: Text('ORDEN'),
                          fixedWidth: 50,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('REFERENCIA'),
                          fixedWidth: 90,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('URL'),
                          fixedWidth: 300,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('DESCRIPCIÓN BREVE'),
                          fixedWidth: 250,
                          // size: ColumnSize.L,
                        ),
                        DataColumn2(
                          label: Text('DESCRIPCIÓN'),
                          fixedWidth: 600,
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
                      source: state.dataBudgetDetail!,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

class MyDataBudgetDetails extends DataTableSource {
  final List<LineasPresupuesto> data;

  MyDataBudgetDetails(this.data);

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(data[index].orden?.toString() ?? '')),
      DataCell(Text(data[index].referencia ?? '')),
      DataCell(Text(data[index].url ?? '')),
      DataCell(Text(data[index].descripcionBreve ?? '')),
      DataCell(Text(data[index].descripcion ?? '')),
      DataCell(Text(data[index].cantidad?.toString() ?? '')),
      DataCell(Text("${data[index].importeNeto} €")),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
