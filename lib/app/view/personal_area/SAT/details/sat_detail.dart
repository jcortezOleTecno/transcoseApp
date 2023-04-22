import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/intervencion_detalle.dart';
import 'package:vemare/app/domain/model/intervenciones.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/sat_details_cubit.dart';
import 'bloc/sat_details_state.dart';

class SatDetailPage extends StatelessWidget {
  const SatDetailPage._();

  static const route = '/sat_detail';

  static Widget create(Intervenciones data) {
    return BlocProvider(
      create: (context) => SatDetailCubit(
        getIt.get<MyAccountRepository>(),
        data,
      ),
      child: const SatDetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SatDetailCubit>();
    return Scaffold(
      body: MyBody(
        child: BlocConsumer<SatDetailCubit, SatDetailState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SingleChildScrollView(
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
                          LocalDataRepository().user?.name ?? '',
                          style: AppTextStyle.h3Style,
                        ),
                        const Divider(),
                        spacerXs,
                        state.loading
                            ? const MyShimmer(
                                margin: EdgeInsets.zero,
                                height: 540,
                                borderRadius: 12,
                              )
                            : _Detail(state.detail!),
                        // if ((state.detail?.firmado ?? 'No') == 'No' &&
                        //     !state.loading) ...[
                        //   MyIconButton(
                        //     onPressed: () {
                        //       myDialogSignature(context,
                        //           sign: (name, nif, signature) async {
                        //         await cubit.sign(
                        //           name: name,
                        //           nif: nif,
                        //           signature: signature,
                        //         );
                        //       });
                        //     },
                        //     text: 'Firmar',
                        //     icon: Image.asset(
                        //       'assets/icons/firma.png',
                        //       scale: 2,
                        //     ),
                        //   ),
                        //   spacerM,
                        // ]
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail(
    this.detail, {
    Key? key,
  }) : super(key: key);

  final IntervencionesDetalle detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.blue100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Item(
                    title: 'CÓDIGO DE INTERVENCIÓN',
                    content: detail.codigoIntervencion.toString()),
              ),
              Expanded(
                child: Item(
                    title: 'CLASIFICACIÓN',
                    content: detail.clasificacion ?? ''),
              ),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'FECHA PLANIFICACION',
                      content: detail.fechaPlanificacion ?? '')),
              Expanded(
                  child: Item(
                      title: 'HORA PLANIFICACION',
                      content: detail.horaPlanificacion ?? '')),
            ],
          ),
          spacerS,
          Item(title: 'ASUNTO', content: detail.asunto ?? ''),
          spacerS,
          Item(
              title: 'TRABAJO REALIZADO',
              content: detail.trabajoRealizado ?? ''),
          spacerS,
          Item(
              title: 'MATERIAL UTILIZADO',
              content: detail.materialUtilizado ?? ''),
          spacerS,
          Item(title: 'OBSERVACIONES', content: detail.observaciones ?? ''),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(title: 'FIRMANO', content: detail.firmado ?? '')),
              Expanded(
                  child: Item(
                      title: 'FECHA CARGO', content: detail.fechaCargo ?? '')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(title: 'ALBARAN', content: detail.albaran ?? '')),
              Expanded(
                  child: Item(
                      title: 'FECHA CIERRE',
                      content: detail.fechaCierre ?? '')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'EN GARANTIA',
                      content: (detail.enGarantia ?? false) ? 'SI' : 'NO')),
              Expanded(
                  child: Item(
                      title: 'N° DE GARANTIA',
                      content: detail.numeroGarantia ?? '')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'FECHA LLEGADA MATERIAL',
                      content: detail.fechaLlegadaMaterial ?? '')),
              Expanded(
                  child: Item(
                      title: 'FECHA SALIDA PROVEEDOR',
                      content: detail.fechaSalidaProveedor ?? '')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'FECHA SALIDA CLIENTE',
                      content: detail.fechaSalidaCliente ?? '')),
              Expanded(
                  child: Item(
                      title: 'MARCA', content: detail.marcaIntervencion ?? '')),
            ],
          ),
          if (detail.maquinas != null) ...[
            spacerS,
            Center(
              child: Text(
                'MAQUINAS',
                style: AppTextStyle.defaultStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const MyDivider(),
            ...detail.maquinas!
                .map(
                  (e) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      spacerS,
                      Item(
                          title: 'COD. MAQUINA',
                          content: e.codigoMaquina?.toString() ?? ''),
                      spacerS,
                      Row(
                        children: [
                          Expanded(
                              child:
                                  Item(title: 'MARCA', content: e.marca ?? '')),
                          Expanded(
                              child: Item(
                                  title: 'MODELO', content: e.modelo ?? '')),
                        ],
                      ),
                      spacerS,
                      Row(
                        children: [
                          Expanded(
                              child: Item(
                                  title: 'N° DE SERIE',
                                  content: e.numeroSerie ?? '')),
                          Expanded(
                              child: Item(
                                  title: 'AÑO',
                                  content:
                                      e.anioFabricacion?.toString() ?? '')),
                        ],
                      ),
                      spacerS,
                      Row(
                        children: [
                          Expanded(
                              child: Item(
                                  title: 'GARANTÍA',
                                  content: e.garantia ?? '')),
                          Expanded(
                              child: Item(
                                  title: 'INICIO GARANTÍA',
                                  content: e.fiGarantia ?? '')),
                          Expanded(
                              child: Item(
                                  title: 'FIN GARANTÍA',
                                  content: e.ffGarantia ?? '')),
                        ],
                      ),
                      spacerS,
                      Row(
                        children: [
                          Expanded(
                              child: Item(title: 'PMP', content: e.pmp ?? '')),
                          Expanded(
                            child: Item(
                                title: 'INICIO PMP', content: e.fiPmp ?? ''),
                          ),
                          Expanded(
                            child:
                                Item(title: 'FIN PMP', content: e.ffPmp ?? ''),
                          ),
                        ],
                      ),
                      spacerS,
                      Row(
                        children: [
                          Expanded(
                              child: Item(
                                  title: 'N° PMP',
                                  content: e.numeroPmp?.toString() ?? '')),
                          Expanded(
                              child: Item(
                                  title: 'TIPO DE EQUIPO TALLER',
                                  content: e.tipoEquipoTaller ?? '')),
                        ],
                      ),
                      spacerS,
                      if (e != detail.maquinas!.last) const MyDivider(),
                    ],
                  ),
                )
                .toList(),
            // if (detail.servicions != null) ...[
            //   spacerS,
            //   Center(
            //     child: Text(
            //       'SERVICIOS',
            //       style: AppTextStyle.defaultStyle
            //           .copyWith(fontWeight: FontWeight.bold),
            //     ),
            //   ),
            //   const MyDivider(),
            //   ...detail.servicions!
            //       .map((e) => Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               spacerS,
            //               Text(
            //                 e.nombre ?? '',
            //                 style: AppTextStyle.defaultStyle
            //                     .copyWith(fontWeight: FontWeight.bold),
            //               ),
            //               spacerS,
            //               Row(
            //                 children: [
            //                   Expanded(
            //                       child: Item(
            //                           title: 'MANTENIMIENTO',
            //                           content: fmf
            //                               .copyWith(
            //                                   amount: e.importeMantenimiento)
            //                               .output
            //                               .symbolOnRight)),
            //                   Expanded(
            //                       child: Item(
            //                           title: 'REPARACIÓN',
            //                           content: fmf
            //                               .copyWith(amount: e.importeReparacion)
            //                               .output
            //                               .symbolOnRight)),
            //                   Expanded(
            //                       child: Item(
            //                           title: 'AVERIA',
            //                           content: fmf
            //                               .copyWith(amount: e.importeAveria)
            //                               .output
            //                               .symbolOnRight))
            //                 ],
            //               ),
            //               spacerS,
            //               if (e != detail.servicions!.last) const MyDivider(),
            //             ],
            //           ))
            //       .toList()
            // ]
          ]
        ],
      ),
    );
  }
}
