import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/warranty.dart';
import 'package:vemare/app/domain/model/warranty_details.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_signature/my_signature.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/my_orders/warranty_details/bloc/warranty_details_cubit.dart';
import 'package:vemare/app/view/personal_area/my_orders/warranty_details/bloc/warranty_details_state.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
import 'package:vemare/app/view/personal_area/widgets/warranty.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class WarrantyDetailPage extends StatelessWidget {
  const WarrantyDetailPage._();
  static const route = '/warranty_detail';

  static Widget create(Warranty warranty) {
    return BlocProvider(
      create: (context) => WarrantyDetailsCubit(
        getIt.get<MyAccountRepository>(),
        warranty,
      ),
      child: const WarrantyDetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WarrantyDetailsCubit>();
    return Scaffold(
      body: BlocBuilder<WarrantyDetailsCubit, WarrantyDetailsState>(
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
                        const Text('Nº DE GARANTÍA',
                            style: AppTextStyle.defaultStyle),
                        spacerXs,
                        Text(state.warranty!.numero.toString(),
                            style: AppTextStyle.h3Style),
                        spacerM,
                        WarrantyDetail(state.warranty!, state.details),
                        spacerM,
                        const MyDivider(),
                        spacerS,
                        const Text('Productos', style: AppTextStyle.h2Style),
                        spacerM,
                        const _Products(),
                        /*if (state.warranty!.visar == 'Si' &&
                            state.warranty!.firmado == 'No') */
                        ...[
                          spacerM,
                          MyIconButton(
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
                        ],
                        spacerL,
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

class _Products extends StatelessWidget {
  const _Products({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WarrantyDetailsCubit, WarrantyDetailsState>(
      builder: (context, state) {
        if (state.loading) {
          return const MyShimmer(
            margin: EdgeInsets.zero,
            borderRadius: 12,
            height: 150,
          );
        }
        return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.blue100),
            ),
            child: Column(
              children: state.details!.referencias!
                  .map((e) => Column(
                        children: [
                          _ItemProduct(e),
                          if (state.details!.referencias!.length > 1 &&
                              state.details!.referencias!.last.referencia !=
                                  e.referencia)
                            const MyDivider(),
                        ],
                      ))
                  .toList(),
            ));
      },
    );
  }
}

class _ItemProduct extends StatelessWidget {
  const _ItemProduct(
    this.ref, {
    Key? key,
  }) : super(key: key);

  final Referencia ref;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Item(
                    title: 'REF PIEZA',
                    content: ref.referencia ?? '000000000')),
            Expanded(
                child: Item(
                    title: 'CANTIDAD',
                    content: ref.cantidad?.toString() ?? '0')),
            Expanded(
                child: Item(
                    title: 'IMPORTE',
                    content: fmf
                        .copyWith(amount: double.tryParse(ref.importeNeto!))
                        .output
                        .symbolOnRight)),
          ],
        ),
        spacerS,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Item(title: 'FAMILIA', content: ref.familia ?? '')),
            Expanded(child: Item(title: 'MARCA', content: ref.marca ?? '')),
          ],
        ),
        spacerS,
        Item(title: 'DESCRIPCIÓN', content: ref.descripcion ?? '000000000'),
      ],
    );
  }
}
