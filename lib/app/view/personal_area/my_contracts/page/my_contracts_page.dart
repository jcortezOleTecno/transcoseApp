import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/contract_millenium.dart';
import 'package:vemare/app/domain/model/contrato_pmp.dart';
import 'package:vemare/app/domain/model/contrato_rappel.dart';
import 'package:vemare/app/domain/model/contrats.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/domain/utils/year_list.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_download_button/my_download_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters.dart';
import 'package:vemare/app/view/_components/my_filters_applied/my_filter_applied.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_signature/my_signature.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/access_denied/access_denied_page.dart';
import 'package:vemare/app/view/personal_area/my_contracts/details/contract_detail.dart';
import 'package:vemare/app/view/personal_area/my_contracts/details_pmp/contract_pmp_detail.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/my_contracts_cubit.dart';
import 'bloc/my_contracts_state.dart';

class MyContractsPage extends StatelessWidget {
  const MyContractsPage._();
  static const route = '/my_contracts';

  static Widget create() {
    return BlocProvider(
      create: (context) => MyContratsCubit(
        getIt.get<ContratsRepository>(),
      ),
      child: const MyContractsPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final permissions = LocalDataRepository().user?.permissions;
    final isEmpleado = LocalDataRepository().user?.role?.id == 4;

    return Scaffold(
      body: MyBody(
        child: permissions!.where((e) => e.id == 9).isEmpty && isEmpleado
            ? const AccessDeniedWidget()
            : DefaultTabController(
                length: 4,
                child: Column(
                  children: const [
                    spacerS,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TabBar(
                        labelColor: AppColor.primaryBlue,
                        indicatorColor: AppColor.primaryBlue,
                        indicatorWeight: 2.5,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelStyle:
                            TextStyle(fontWeight: FontWeight.normal),
                        unselectedLabelColor: AppColor.neutral20,
                        tabs: [
                          Tab(text: 'CRD'),
                          Tab(text: 'Millenium'),
                          Tab(text: 'PMP'),
                          Tab(text: 'Rappel'),
                        ],
                      ),
                    ),
                    Divider(
                      height: 0,
                      thickness: 2,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          _CRD(),
                          _Millenium(),
                          _PMP(),
                          _Rappel(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _Rappel extends StatelessWidget {
  const _Rappel({
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
              const Text('Contratos Rappel', style: AppTextStyle.h1Style),
              Text(
                LocalDataRepository().user?.name ?? '',
                style: AppTextStyle.h3Style.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
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
              if (state.rappel == null) const NoExistWidget('contratos'),
              if (state.rappel != null && !state.loading)
                Column(
                  children: [
                    _ContractRappel(state.rappel!),
                    spacerM,
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

class _PMP extends StatelessWidget {
  const _PMP({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final cubit = context.read<MyContratsCubit>();
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Contratos PMP', style: AppTextStyle.h1Style),
          Text(
            LocalDataRepository().user?.name ?? '',
            style: AppTextStyle.h3Style.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          // spacerM,
          // MyIconButton(
          //   onPressed: () {
          //     myFilters(context).then((filter) {
          //       if (filter != null) {
          //         cubit.getCRD(filter);
          //       }
          //     });
          //   },
          //   text: 'Aplicar filtros',
          //   icon: Image.asset(
          //     'assets/icons/Filtro.png',
          //     scale: 2,
          //   ),
          //   variant: MyButtonVariant.outlinedBold,
          // ),
          spacerL,
          BlocBuilder<MyContratsCubit, MyContratsState>(
            builder: (context, state) {
              if (state.loading) {
                return const MyShimmer(
                  margin: EdgeInsets.zero,
                  height: 250,
                  borderRadius: 3,
                );
              }
              if (state.pmp.isEmpty) {
                return const NoExistWidget('contratos');
              }
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.pmp.map((e) => _PMPCard(e)).toList());
            },
          )
        ],
      ),
    );
  }
}

class _PMPCard extends StatelessWidget {
  const _PMPCard(
    this.pmp, {
    Key? key,
  }) : super(key: key);

  final ContratoPmp pmp;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ContractPMPDetailPage.route,
          arguments: pmp,
        );
      },
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Item(
                            title: 'COD. CONTRATO',
                            content: pmp.codigoContrato.toString())),
                    if (pmp.fechaBaja != null)
                      Expanded(
                          child: Item(
                              title: 'FECHA BAJA',
                              content: pmp.fechaBaja ?? ''))
                  ],
                ),
                spacerS,
                Row(
                  children: [
                    Expanded(
                        child: Item(
                            title: 'FECHA INICIO',
                            content: pmp.fechaInicio ?? '')),
                    Expanded(
                        child: Item(
                            title: 'FECHA FIN', content: pmp.fechaFin ?? ''))
                  ],
                ),
                spacerS,
                Row(
                  children: [
                    Expanded(
                        child: Item(
                            title: 'FIRMADO',
                            content: (pmp.firmado ?? false) ? 'SI' : 'NO')),
                    Expanded(
                        child: Item(
                            title: 'FECHA FIRMA',
                            content: pmp.fechaFirma ?? ''))
                  ],
                ),
                spacerS,
                Row(
                  children: [
                    Expanded(
                        child: Item(
                            title: 'PERSONA QUE FIRMA',
                            content: pmp.firmaPersonaquefirma ?? '')),
                    Expanded(
                        child: Item(
                            title: 'NIF',
                            content: pmp.nifPersonaquefirma ?? ''))
                  ],
                ),
                if (!(pmp.firmado ?? false)) ...[
                  spacerS,
                  MyIconButton(
                    onPressed: () {
                      myDialogSignature(context,
                          sign: (name, nif, signature) async {
                        // await cubit.sign(
                        //   name: name,
                        //   nif: nif,
                        //   signature: signature,
                        // );
                      });
                    },
                    text: 'Firmar',
                    icon: Image.asset(
                      'assets/icons/firma.png',
                      scale: 2,
                      color: AppColor.primaryBlue,
                    ),
                    variant: MyButtonVariant.outlinedBold,
                  ),
                ]
              ],
            ),
          )),
    );
  }
}

class _CRD extends StatelessWidget {
  const _CRD({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MyContratsCubit>();
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Contratos CRD', style: AppTextStyle.h1Style),
          Text(
            LocalDataRepository().user?.name ?? '',
            style: AppTextStyle.h3Style.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
          spacerM,
          MyIconButton(
            onPressed: () {
              myFilters(context).then((filter) {
                if (filter != null) {
                  cubit.getCRD(filter);
                }
              });
            },
            text: 'Aplicar filtros',
            icon: Image.asset(
              'assets/icons/Filtro.png',
              scale: 2,
            ),
            variant: MyButtonVariant.outlinedBold,
          ),
          BlocBuilder<MyContratsCubit, MyContratsState>(
            builder: (context, state) {
              if (state.filtersCRD != null) {
                return FiltersAppliedWidget(state.filtersCRD!);
              }
              return const SizedBox();
            },
          ),
          spacerL,
          BlocBuilder<MyContratsCubit, MyContratsState>(
            builder: (context, state) {
              if (state.loading) {
                return const MyShimmer(
                  margin: EdgeInsets.zero,
                  height: 250,
                  borderRadius: 12,
                );
              }
              if (state.crd.isEmpty) {
                return const NoExistWidget('contratos');
              }
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.crd.map((e) => _ContratCard(e)).toList());
            },
          )
        ],
      ),
    );
  }
}

class _Millenium extends StatelessWidget {
  const _Millenium({
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
              Text(
                LocalDataRepository().user?.name ?? '',
                style: AppTextStyle.h3Style.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
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
              if (state.mill == null) const NoExistWidget('contratos'),
              if (state.mill != null && !state.loading)
                Column(
                  children: [
                    _ContractMillenium(state.mill!),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Item(title: 'NOMBRE', content: mill.nombre ?? '')),
                Expanded(
                    child: Item(
                        title: 'COD. CONTRATO',
                        content: mill.codigoContrato.toString())),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(title: 'TELÉFONO', content: mill.movil ?? '')),
                Expanded(
                    child: Item(title: 'EMAIL', content: mill.email ?? '')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(child: Item(title: 'PACK', content: mill.pack ?? '')),
                Expanded(
                    child: Item(
                        title: 'VALOR SERVICIOS',
                        content: '${mill.valorServicios} €')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'OBJETIVO TOTAL',
                        content: '${mill.objetivoTotal} €')),
                Expanded(
                    child: Item(
                        title: 'CUOTA MENSUAL',
                        content: '${mill.cuotaMensual} €')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'CUOTA ANUAL', content: '${mill.cuotaAnual} €')),
                Expanded(
                    child: Item(
                        title: 'CUOTA ANUAL DEVOLVER',
                        content: '${mill.cuotaAnualDevolver} €')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'FECHA INICIO',
                        content: mill.fechaInicio ?? '')),
                Expanded(
                    child:
                        Item(title: 'FECHA FIN', content: mill.fechaFin ?? '')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'FECHA BAJA', content: mill.fechaBaja ?? '')),
                Expanded(
                    child: Item(
                        title: 'FECHA FIRMA', content: mill.fechaFirma ?? '')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(title: 'FIRMADO', content: mill.firmado ?? '')),
                Expanded(
                    child: Item(
                        title: 'PERSONA QUE FIRMA',
                        content: mill.firmaPersonaquefirma ?? '')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'NIF', content: mill.nifPersonaquefirma ?? '')),
                Expanded(
                    child: Item(
                        title: 'NOTA CLIENTE',
                        content: mill.notasCliente ?? '')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'CLIENTE CONTRATO',
                        content: mill.clientesContrato ?? '')),
                Expanded(
                    child: Item(
                        title: 'PORCENTAJE CONSECUCIÓN',
                        content: '${mill.porcentajeConsecucion ?? ''}%')),
              ],
            ),
            if (mill.serviciosContratados != null) ...[
              spacerS,
              const MyDivider(),
              Visibility(
                visible: mill.serviciosContratados!.isNotEmpty,
                child: Text('SERVICIOS CONTRATADOS',
                    style: AppTextStyle.defaultStyle
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
              const MyDivider()
            ],
            spacerS,
            if (mill.serviciosContratados != null)
              ...mill.serviciosContratados!
                  .map((e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Item(title: "SERVICIO", content: e.servicio ?? ''),
                          spacerS,
                          Row(
                            children: [
                              Expanded(
                                child: Item(
                                    title: "SERVICIO DEL PACK",
                                    content: (e.servicioDelPack ?? false)
                                        ? 'SI'
                                        : 'NO'),
                              ),
                              Expanded(
                                child: Item(
                                    title: "VALOR", content: '${e.valor}€'),
                              ),
                            ],
                          ),
                          spacerS,
                          Row(
                            children: [
                              Expanded(
                                child: Item(
                                    title: "CANTIDAD",
                                    content: e.cantidad.toString()),
                              ),
                              Expanded(
                                child: Item(
                                    title: "FECHA DE INICIO",
                                    content: e.fechaInicioServicio ?? ''),
                              ),
                            ],
                          ),
                          if (e != mill.serviciosContratados!.last)
                            const MyDivider(),
                        ],
                      ))
                  .toList(),
            if (mill.documentosFirmados != null) ...[
              spacerS,
              const MyDivider(),
              Visibility(
                visible: mill.documentosFirmados!.isNotEmpty,
                child: Text('DOCUMENTOS FIRMADOS',
                    style: AppTextStyle.defaultStyle
                        .copyWith(fontWeight: FontWeight.bold)),
              ),
              const MyDivider()
            ],
            spacerS,
            if (mill.documentosFirmados != null)
              ...mill.documentosFirmados!
                  .map((e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Item(
                                  title: "COD. DOCUMENTO",
                                  content: e.codigoDocumento?.toString() ?? ''),
                              ButtonDownloadPdf(
                                future: () => getIt
                                    .get<ContratsRepository>()
                                    .downloadPdfMill(
                                      anio: e.anio.toString(),
                                      codContrato:
                                          mill.codigoContrato.toString(),
                                      codDocumento:
                                          e.codigoDocumento.toString(),
                                      name: e.nombre ?? 'doc.pdf',
                                    ),
                              ),
                            ],
                          ),
                          spacerS,
                          Item(title: "NOMBRE", content: e.nombre ?? ''),
                          spacerS,
                          Item(
                              title: "DESCRIPCIÓN",
                              content: e.descripcion ?? ''),
                          spacerS,
                          Item(title: "AÑO", content: e.anio?.toString() ?? ''),
                          if (e != mill.documentosFirmados!.last)
                            const MyDivider(),
                        ],
                      ))
                  .toList(),
          ],
        ),
      ),
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
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Item(title: 'NOMBRE', content: rappel.nombre ?? '')),
                Expanded(
                    child: Item(
                        title: 'COD. CONTRATO',
                        content: rappel.codigoContrato.toString())),
                ButtonDownloadPdf(
                  future: () =>
                      getIt.get<ContratsRepository>().downloadPdfRappelDetalles(
                            codContrato: rappel.codigoContrato.toString(),
                            name: 'Rappel_${rappel.codigoContrato}.pdf',
                          ),
                ),
              ],
            ),
            spacerS,
            Item(title: 'EMAIL', content: rappel.email ?? ''),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'FECHA FIRMA',
                        content: rappel.fechaFirma ?? '')),
                Expanded(
                    child:
                        Item(title: 'FIRMADO', content: rappel.firmado ?? '')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'PERSONA QUE FIRMA',
                        content: rappel.firmaPersonaquefirma ?? '')),
                Expanded(
                    child: Item(
                        title: 'NIF',
                        content: rappel.nifPersonaquefirma ?? '')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'NOTA CLIENTE',
                        content: rappel.notasCliente ?? '')),
                Expanded(
                    child: Item(
                        title: 'CLIENTE CONTRATO',
                        content: rappel.clientesContrato ?? '')),
              ],
            ),
            spacerS,
            if (rappel.documentosFirmados != null)
              if (rappel.documentosFirmados!.isNotEmpty) ...[
                const MyDivider(),
                Center(
                  child: Text('DOCUMENTOS FIRMADOS',
                      style: AppTextStyle.defaultStyle
                          .copyWith(fontWeight: FontWeight.bold)),
                ),
                const MyDivider(),
              ],
            spacerS,
            if (rappel.documentosFirmados != null)
              ...rappel.documentosFirmados!
                  .map((e) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Item(
                                  title: "COD. DOCUMENTO",
                                  content: e.codigoDocumento?.toString() ?? ''),
                              spacerS,
                              Item(
                                  title: "AÑO",
                                  content: e.anio?.toString() ?? ''),
                              const Spacer(),
                              ButtonDownloadPdf(
                                future: () => getIt
                                    .get<ContratsRepository>()
                                    .downloadPdfRappel(
                                      codContrato:
                                          rappel.codigoContrato.toString(),
                                      codDocumento:
                                          e.codigoDocumento.toString(),
                                      name: e.nombre ?? '',
                                    ),
                              ),
                            ],
                          ),
                          spacerS,
                          Item(title: "NOMBRE", content: e.nombre ?? ''),
                          spacerS,
                          Item(
                              title: "DESCRIPCION",
                              content: e.descripcion ?? ''),
                          if (e != rappel.documentosFirmados!.last)
                            const MyDivider(),
                        ],
                      ))
                  .toList(),
          ],
        ),
      ),
    );
  }
}

class _ContratCard extends StatelessWidget {
  const _ContratCard(
    this.contrat, {
    Key? key,
  }) : super(key: key);
  final Contrats contrat;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ContractDetailPage.route,
          arguments: contrat,
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(bottom: 15),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Item(
                        title: "COD. CONTRATO",
                        content: contrat.codigoContrato.toString()),
                  ),
                  Expanded(
                      child: Item(title: "FECHA", content: contrat.fecha ?? ''))
                ],
              ),
              spacerS,
              Row(
                children: [
                  Expanded(
                    child: Item(
                        title: "N° PROYECTO",
                        content: contrat.numeroProyecto.toString()),
                  ),
                  Expanded(
                      child:
                          Item(title: "ASUNTO", content: contrat.asunto ?? ''))
                ],
              ),
              spacerS,
              Row(
                children: [
                  Expanded(
                    child: Item(
                        title: "FECHA PRESUPUESTO",
                        content: contrat.fechaPresupuesto ?? ''),
                  ),
                  Expanded(
                      child: Item(
                          title: "VERSIÓN PRESUPUESTO",
                          content: contrat.versionPresupuesto.toString()))
                ],
              ),
              spacerS,
              Row(
                children: [
                  Expanded(
                    child: Item(
                        title: "IMPORTE PRESUPUESTO",
                        content: fmf
                            .copyWith(
                                amount: double.tryParse(
                                    contrat.importePresupuesto ?? '0.0'))
                            .output
                            .symbolOnRight),
                  ),
                  Expanded(
                      child: Item(
                          title: "FIRMADO",
                          content: (contrat.firmado ?? false) ? 'SI' : 'NO'))
                ],
              ),
              spacerS,
              Row(
                children: [
                  Expanded(
                    child: Item(
                        title: "REPRESENTANTE LEGAL",
                        content: contrat.representanteLegal ?? ''),
                  ),
                  Expanded(
                      child: Item(
                          title: "NIF REPRESENTANTE",
                          content: contrat.nifRepresentante ?? ''))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
