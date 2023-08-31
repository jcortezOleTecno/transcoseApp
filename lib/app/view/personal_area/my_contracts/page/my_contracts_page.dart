import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/contrats.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters.dart';
import 'package:vemare/app/view/_components/my_filters_applied/my_filter_applied.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/access_denied/access_denied_page.dart';
import 'package:vemare/app/view/personal_area/my_contracts/details/contract_detail.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
import 'package:vemare/app/view/personal_area/widgets/no_contracts.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/my_contracts_cubit.dart';
import 'bloc/my_contracts_state.dart';
import 'millennium.dart';
import 'pmp.dart';
import 'rappels.dart';

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
                          Tab(text: 'Rappels'),
                          Tab(text: 'Millennium'),
                          Tab(text: 'PMP'),
                          Tab(text: 'CRD'),
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
                          Rappels(),
                          Millennium(),
                          PMP(),
                          _CRD(),
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
