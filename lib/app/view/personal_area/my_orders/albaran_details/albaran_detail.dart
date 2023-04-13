import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/albaran.dart';
import 'package:vemare/app/domain/model/albaran_details.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/my_orders/albaran_details/bloc/albaran_details_cubit.dart';
import 'package:vemare/app/view/personal_area/my_orders/albaran_details/bloc/albaran_details_state.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class AlbaranDetailPage extends StatelessWidget {
  const AlbaranDetailPage._();

  static const route = '/albaran_detail';

  static Widget create(Albaran albaran) {
    return BlocProvider(
      create: (context) => AlbaranDetailCubit(
        getIt.get<MyAccountRepository>(),
        albaran,
      ),
      child: const AlbaranDetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AlbaranDetailCubit, AlbaranDetailState>(
        builder: (context, state) {
          return MyBody(
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
                        const Text('Documento', style: AppTextStyle.h3Style),
                        spacerXs,
                        Text(state.albaran?.documento?.toString() ?? '000',
                            style: AppTextStyle.h2Style),
                        spacerM,
                        _AlbaranDetails(state),
                        spacerM,
                        const Divider(
                          thickness: 1.5,
                          color: AppColor.blue100,
                        ),
                        spacerM,
                        const Text('Productos', style: AppTextStyle.h2Style),
                        spacerM,
                        if (state.loading)
                          const MyShimmer(
                            height: 180,
                            margin: EdgeInsets.zero,
                          ),
                        if (!state.loading)
                          ...state.details
                              .map((e) => _ProductsCard(e))
                              .toList(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ProductsCard extends StatelessWidget {
  const _ProductsCard(
    this.details, {
    Key? key,
  }) : super(key: key);

  final AlbaranDetails details;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'CONTADOR', content: details.contador ?? '000')),
              Expanded(
                  child: Item(
                      title: 'LINEA',
                      content: details.linea?.toString() ?? '000')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'REFERENCIA',
                      content: details.referencia ?? '000')),
              Expanded(
                  child: Item(
                      title: 'CANTIDAD',
                      content: details.cantidad?.toString() ?? '000')),
            ],
          ),
          spacerS,
          Item(
              title: 'DESCRIPCIÓN REFERENCIA',
              content: details.descripcionReferencia ?? '')
        ]),
      ),
    );
  }
}

class _AlbaranDetails extends StatelessWidget {
  final AlbaranDetailState state;

  const _AlbaranDetails(this.state);
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
            'Detalle del albarán',
            style: AppTextStyle.titleCard,
          ),
          spacerM,
          Row(
            children: [
              Expanded(
                child: Item(
                    title: 'UNIDADES',
                    content: state.details.length.toString()),
              ),
              Expanded(
                child: Item(
                    title: 'IMPORTE',
                    content: fmf
                        .copyWith(amount: state.albaran!.totalImporte ?? 0.0)
                        .output
                        .symbolOnRight),
              )
            ],
          ),
        ],
      ),
    );
  }
}
