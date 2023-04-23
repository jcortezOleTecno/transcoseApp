import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/contract_detail.dart';
import 'package:vemare/app/domain/model/contrats.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_download_button/my_download_button.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_signature/my_signature.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/contract_details_cubit.dart';
import 'bloc/contract_details_state.dart';

class ContractDetailPage extends StatelessWidget {
  const ContractDetailPage._();

  static const route = '/contract_detail';

  static Widget create(Contrats contrat) {
    return BlocProvider(
      create: (context) => ContratDetailCubit(
        getIt.get<ContratsRepository>(),
        contrat,
      ),
      child: const ContractDetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContratDetailCubit>();
    return Scaffold(
      body: MyBody(
        child: BlocConsumer<ContratDetailCubit, ContratDetailState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MyBackButton(),
                      const Spacer(),
                      if (!state.loading)
                        ButtonDownloadPdf(
                          future: () =>
                              getIt.get<ContratsRepository>().downloadPdfCrd(
                                    codContrato:
                                        state.detail!.codigoContrato.toString(),
                                    numProyecto:
                                        state.detail!.numeroProyecto.toString(),
                                  ),
                        ),
                      spacerS,
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Contrato CRD', style: AppTextStyle.h1Style),
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
                            : _Revision(state.detail!),
                        if (!(state.detail?.firmado ?? false) &&
                            !state.loading) ...[
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
                          spacerM,
                        ]
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

class _Revision extends StatelessWidget {
  const _Revision(
    this.detail, {
    Key? key,
  }) : super(key: key);

  final ContratDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
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
          Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: AppColor.blue50,
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Item(
                            title: 'CÓDIGO DE CONTRATO',
                            content: detail.codigoContrato.toString()),
                      ),
                      Expanded(
                          child: Item(
                              title: 'N° DE PROYECTO',
                              content: detail.numeroProyecto.toString())),
                    ],
                  ),
                  spacerS,
                  Row(
                    children: [
                      Expanded(
                          child: Item(
                              title: 'FECHA',
                              content: detail.fechaCreacionContrato ?? '')),
                      Expanded(
                          child: Item(
                              title: 'TIPO',
                              content: detail.tipoContrato ?? '')),
                    ],
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Item(
                            title: 'REPRESENTANTE',
                            content:
                                detail.datosContrato?.nombreRepresentante ??
                                    '')),
                    Expanded(
                        child: Item(
                            title: 'DNI',
                            content:
                                detail.datosContrato?.dniRepresentante ?? '')),
                  ],
                ),
                spacerS,
                Row(
                  children: [
                    Expanded(
                        child: Item(
                            title: 'FECHA ACEPTADO',
                            content:
                                detail.datosContrato?.fechaAceptado ?? '')),
                    Expanded(
                        child: Item(
                            title: 'PLAZO DE ENTREGA',
                            content: detail.datosContrato?.plazoEntrega ?? '')),
                  ],
                ),
                spacerS,
                Row(
                  children: [
                    Expanded(
                        child: Item(
                            title: 'TALLER',
                            content: detail.datosContrato?.nombreTaller ?? '')),
                    Expanded(
                        child: Item(
                            title: 'CIF TALLER',
                            content: detail.datosContrato?.cifTaller ?? '')),
                  ],
                ),
                spacerS,
                Item(
                    title: 'DOMICILIO SOCIAL',
                    content: detail.datosContrato?.domicilioSocial ?? ""),
                spacerS,
                Item(
                    title: 'REGISTRO CONTRATO',
                    content: detail.datosContrato?.registroContrato ?? ""),
                spacerS,
                Row(
                  children: [
                    Expanded(
                        child: Item(
                            title: 'TOMO',
                            content: detail.datosContrato?.tomoRegistro ?? '')),
                    Expanded(
                        child: Item(
                            title: 'FOLIO',
                            content:
                                detail.datosContrato?.folioRegistro ?? '')),
                    Expanded(
                        child: Item(
                            title: 'HOJA',
                            content: detail.datosContrato?.hojaRegistro ?? '')),
                  ],
                ),
                spacerS,
                Row(
                  children: [
                    Expanded(
                        child: Item(
                            title: 'PRECIO TOTAL',
                            content: detail.datosContrato?.precioTotal ?? '')),
                    Expanded(
                        child: Item(
                            title: 'ENTREGA CUENTA',
                            content:
                                detail.datosContrato?.entregaCuenta ?? '')),
                  ],
                ),
                spacerS,
                Row(
                  children: [
                    Expanded(
                        child: Item(
                            title: 'N° MENSUALIDADES',
                            content:
                                detail.datosContrato?.numMensualidades ?? '')),
                    Expanded(
                        child: Item(
                            title: 'IMPORTE MENSUAL',
                            content: detail.datosContrato?.importeMensualidad ??
                                '')),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
