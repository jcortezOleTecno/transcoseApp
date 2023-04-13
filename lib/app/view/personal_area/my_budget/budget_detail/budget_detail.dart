import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/budget_repository.dart';
import 'package:vemare/app/domain/model/budget.dart';
import 'package:vemare/app/domain/model/budget_detail.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_label_status/my_label_status.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/my_budget/budget_detail/bloc/budget_detail_cubit.dart';
import 'package:vemare/app/view/personal_area/my_budget/budget_detail/bloc/budget_detail_state.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
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
    return Scaffold(
      body: BlocConsumer<BudgetDetailCubit, BudgetDetailState>(
        listener: (context, state) {
          // TODO: implement listener
        },
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
                              Text(
                                'N° DEL PRESUPUESTO',
                                style: AppTextStyle.defaultStyle,
                              ),
                              Text(
                                state.budget!.numero.toString(),
                                style: AppTextStyle.h3Style,
                              ),
                              spacerL,
                              Visibility(
                                  visible: !state.loading,
                                  replacement: MyShimmer(
                                    height: 400,
                                    margin: EdgeInsets.zero,
                                  ),
                                  child: _DetailBudget(state.budgetDetails)),
                              spacerL,
                            ],
                          ),
                        ),
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
                      onPressed: () {},
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
          const Text(
            'Detalles del presupuesto',
            style: AppTextStyle.titleCard,
          ),
          spacerM,
          Row(
            children: [
              Expanded(
                  child: Item(title: 'FECHA', content: budget?.fecha ?? '')),
              Expanded(
                  child: Item(
                      title: 'CÓDIGO',
                      content: budget?.codigo.toString() ?? '')),
            ],
          ),
          spacerM,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'FECHA VALIDEZ',
                      content: budget?.fechaValidez ?? '')),
              Expanded(
                  child: Item(
                      title: 'ACTIVO',
                      content: (budget?.activo ?? false) ? 'SI' : 'NO')),
            ],
          ),
          spacerM,
          Item(title: 'ASUNTO', content: budget?.asunto ?? ''),
          if (budget?.condicionesGenereles != null &&
              budget?.condicionesGenereles != '') ...[
            spacerM,
            Item(
                title: 'CONDICIONES GENERALES',
                content: budget?.condicionesGenereles ?? '')
          ],
          if (budget?.condicionesEspecificas != null &&
              budget?.condicionesEspecificas != '') ...[
            spacerM,
            Item(
                title: 'CONDICIONES ESPECIFICAS',
                content: budget?.condicionesEspecificas ?? ''),
          ],
          spacerM,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'VERSIÓN',
                      content: budget?.version.toString() ?? '')),
              Expanded(
                  child: Item(
                      title: 'IMP. SAT MONTAJE',
                      content: budget?.importeSatMontaje ?? '0,00 €')),
            ],
          ),
          spacerM,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'IMP. SAT TRANSPORTE',
                      content: budget?.importeSatTransporte ?? '0,00 €')),
              Expanded(
                  child: Item(
                      title: 'IMPORTE NETO',
                      content: '${budget?.importeNeto ?? '0,00'} €')),
            ],
          ),
          spacerM,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'BASE IMPONIBLE',
                      content: '${budget?.baseImponible ?? '0,00'} €')),
              Expanded(
                  child: Item(
                      title: 'IMPORTE IVA',
                      content: '${budget?.importeIva ?? '0,00'} €')),
            ],
          ),
          spacerM,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'DESCUENTO',
                      content: '${budget?.descuento ?? '0,00'} €')),
              Expanded(
                  child: Item(
                      title: 'TRANSPORTE INCLUIDO',
                      content:
                          (budget?.transporteIncluido ?? false) ? 'SI' : 'NO')),
            ],
          ),
          spacerM,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'MONTAJE INCLUIDO',
                      content:
                          (budget?.montajeIncluido ?? false) ? 'SI' : 'NO')),
              Expanded(
                  child: Item(
                      title: 'FECHA FIRMA', content: budget?.fechaFirma ?? '')),
            ],
          ),
          spacerM,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'QUIEN FIRMA', content: budget?.quienFirma ?? '')),
              Expanded(
                  child: Item(
                      title: 'NIF QUIEN FIRMA',
                      content: budget?.nifQuienFirma ?? '')),
            ],
          ),
          if (budget?.lineasPresupuesto != null) ...[
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
          ],
          // spacerM,
          // const MyLabelStatus.approved()
        ],
      ),
    );
  }
}
