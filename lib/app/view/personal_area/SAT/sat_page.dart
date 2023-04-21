import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/sat.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_label_status/my_label_status.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/sat_cubit.dart';
import 'bloc/sat_state.dart';

class SatPage extends StatelessWidget {
  const SatPage._();
  static const route = '/sat';

  static Widget create() {
    return BlocProvider(
      create: (context) => SatCubit(
        getIt.get<MyAccountRepository>(),
      ),
      child: const SatPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: BlocBuilder<SatCubit, SatState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('SAT', style: AppTextStyle.h1Style),
                  Text(
                    LocalDataRepository().user?.name ?? '',
                    style: AppTextStyle.h3Style.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  spacerL,
                  if (state.loading)
                    ...List.generate(2, (i) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: MyShimmer(
                          height: 310,
                          margin: EdgeInsets.zero,
                        ),
                      );
                    }),
                  if (!state.loading)
                    ...state.sats.map((e) => _SATCard(e)).toList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _SATCard extends StatelessWidget {
  const _SATCard(
    this.sat, {
    Key? key,
  }) : super(key: key);

  final Sat sat;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.blue100),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'CÓDIGO', content: sat.codigo?.toString() ?? '')),
              Expanded(child: Item(title: 'FECHA', content: sat.fecha ?? '')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'TIPO AVERIA', content: sat.tipoAveria ?? '')),
              Expanded(child: Item(title: 'MARCA', content: sat.marca ?? '')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(child: Item(title: 'MODELO', content: sat.modelo ?? '')),
              Expanded(
                  child: Item(
                      title: 'N° DE SERIE', content: sat.numeroSerie ?? '')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child:
                      Item(title: 'TIPO ACUSE', content: sat.tipoAcuse ?? '')),
              Expanded(
                  child:
                      Item(title: 'FECHA CITA', content: sat.fechaCita ?? '')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'HORA CITA',
                      content: sat.franjaHorariaCita ?? '')),
              Expanded(
                  child: Item(
                      title: 'N° DE INTERVENSIÓN',
                      content: sat.numeroIntervenciom ?? '')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(child: Item(title: 'ESTADO', content: sat.estado ?? '')),
              Expanded(
                  child: Item(title: 'TÉCNICO', content: sat.tecnico ?? '')),
            ],
          ),
        ],
      ),
    );
  }

  PopupMenuButton<dynamic> _popupMenu() {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      constraints: const BoxConstraints(maxWidth: 130),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Editar',
                  style: AppTextStyle.inputStyle
                      .copyWith(color: AppColor.primaryBlue),
                ),
                spacerXs,
                Image.asset('assets/icons/IconEdit.png', scale: 2)
              ],
            ),
          )),
          PopupMenuItem(
              child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Eliminar',
                  style: AppTextStyle.inputStyle
                      .copyWith(color: AppColor.error500),
                ),
                spacerXs,
                Image.asset('assets/icons/Trash.png', scale: 2)
              ],
            ),
          )),
        ];
      },
      child: Image.asset(
        'assets/icons/options.png',
        scale: 2,
      ),
    );
  }
}
