import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/intervenciones.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/SAT/details/sat_detail.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/my_sat_state.dart';
import 'bloc/my_sat_cubit.dart';

class MySatPage extends StatelessWidget {
  const MySatPage._();
  static const route = '/sat';

  static Widget create() {
    return BlocProvider(
      create: (context) => MySatCubit(
        getIt.get<MyAccountRepository>(),
      ),
      child: const MySatPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MySatCubit>();
    return Scaffold(
      body: MyBody(
        child: BlocBuilder<MySatCubit, MySatState>(
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
                  spacerM,
                  MyIconButton(
                    onPressed: () {
                      myFilters(context, status: true).then((filter) {
                        if (filter != null) {
                          cubit.getSats(filter: filter);
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
    this.data, {
    Key? key,
  }) : super(key: key);

  final Intervenciones data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          SatDetailPage.route,
          arguments: data,
        );
      },
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'CÓDIGO',
                        content: data.codigoIntervencion?.toString() ?? '')),
                Expanded(
                    child: Item(
                        title: 'FECHA INTERVENCIÓN',
                        content: data.fechaIntervencion ?? '')),
              ],
            ),
            spacerS,
            Item(title: 'ASUNTO', content: data.asuntoIntervencion ?? ''),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'FECHA PLANIFICACIÓN',
                        content: data.fechaPlanificacion ?? '')),
                Expanded(
                    child: Item(
                        title: 'HORA PLANIFICACIÓN',
                        content: data.horaPlanificacion ?? '')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(title: 'NÚMERO', content: data.numero ?? '')),
                Expanded(
                    child: Item(
                        title: 'FECHA CIERRE',
                        content: data.fechaCierreIntervencion ?? '')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'NÚMERO ALBARAN',
                        content: data.numeroAlbaran ?? '')),
                Expanded(
                    child: Item(
                        title: 'EN GARANTIA',
                        content: (data.enGarantia ?? false) ? 'SI' : 'NO')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'NÚMERO GARANTÍA',
                        content: data.numeroGarantia ?? '')),
                Expanded(
                    child: Item(
                        title: 'LLEGADA MATERIAL',
                        content: data.fechaLlegadaMaterial ?? '')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'SALIDA PROVEEDOR',
                        content: data.fechaSalidaProveedor ?? '')),
                Expanded(
                    child: Item(
                        title: 'SALIDA CLIENTE',
                        content: data.fechaSalidaCliente ?? '')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(title: 'TALLER', content: data.taller ?? '')),
                Expanded(
                    child: Item(
                        title: 'TIPO AGRUPACIÓN',
                        content: data.tipoAgrupacion ?? '')),
              ],
            ),
            spacerS,
            Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'TIPO INTERVENCIÓN',
                        content: data.tipoIntervencion ?? '')),
                Expanded(
                    child: Item(
                        title: 'MARCA INTERVENCIÓN',
                        content: data.marcaIntervencion ?? '')),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /*PopupMenuButton<dynamic> _popupMenu() {
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
  }*/
}
