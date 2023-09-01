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
import 'package:vemare/app/view/_components/my_download_button/my_download_pdf_contracts.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_signature/my_signature.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/user_name/user_name.dart';
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
        child: BlocBuilder<ContratDetailCubit, ContratDetailState>(
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
                        const Text('Contrato CRD', style: AppTextStyle.h1Style),
                        const UserName(),
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
          // Container(
          //     decoration: const BoxDecoration(
          //       borderRadius: BorderRadius.only(
          //           topLeft: Radius.circular(12),
          //           topRight: Radius.circular(12)),
          //       color: AppColor.blue50,
          //     ),
          //     padding: const EdgeInsets.all(20),
          //     child: Column(
          //       children: [
          //         Row(
          //           children: [
          //             Expanded(
          //               child: Item(
          //                   title: 'CÓDIGO DE CONTRATO',
          //                   content: detail.codigoContrato.toString()),
          //             ),
          //             Expanded(
          //                 child: Item(
          //                     title: 'N° DE PROYECTO',
          //                     content: detail.numeroProyecto.toString())),
          //           ],
          //         ),
          //         spacerS,
          //         Row(
          //           children: [
          //             Expanded(
          //                 child: Item(
          //                     title: 'FECHA',
          //                     content: detail.fechaCreacionContrato ?? '')),
          //             Expanded(
          //                 child: Item(
          //                     title: 'TIPO',
          //                     content: detail.tipoContrato ?? '')),
          //           ],
          //         ),
          //       ],
          //     )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacerM,
                DownloadPdfContracts(
                  // title: "Descargar",
                  onPressed: () =>
                      getIt.get<ContratsRepository>().downloadPdfCrd(
                            codContrato: detail.codigoContrato.toString(),
                            numProyecto: detail.numeroProyecto.toString(),
                          ),
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
                  key: const Key("numProyecto"),
                  label: 'NÚMERO DE PROYECTO',
                  initialValue: detail.numeroProyecto,
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("codContrato"),
                  label: 'CÓDIGO DE CONTRATO',
                  initialValue: detail.codigoContrato?.toString() ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("feCreacion"),
                  label: 'FECHA CREACIÓN CONTRATO',
                  initialValue: detail.fechaCreacionContrato ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("tipo"),
                  label: 'TIPO CONTRATO',
                  initialValue: detail.tipoContrato ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("firmado"),
                  label: 'FIRMADO',
                  initialValue: (detail.firmado ?? false) ? "SI" : "NO",
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                // spacerM,
                /*Row(
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
                ),*/
              ],
            ),
          ),
          const MyDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacerS,
                const Text("Datos Firma", style: AppTextStyle.h2Style),
                spacerS,
                MyInput(
                  key: const Key("fecFirma"),
                  label: 'FECHA FIRMA',
                  initialValue: detail.fechaFirma,
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("repLegal"),
                  label: 'REPRESENTANTE LEGAL',
                  initialValue: detail.representanteLegal,
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("nifRepresentante"),
                  label: 'NIF REPRESENTANTE',
                  initialValue: detail.nifRepresentante,
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
              ],
            ),
          ),
          const MyDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacerS,
                const Text("Datos contrato", style: AppTextStyle.h2Style),
                spacerS,
                MyInput(
                  key: const Key("nomRepresentante"),
                  label: 'NOMBRE REPRESENTANTE',
                  initialValue: detail.datosContrato?.nombreRepresentante ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("dniRepresent"),
                  label: 'DNI REPRESENTANTE',
                  initialValue: detail.datosContrato?.dniRepresentante ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("fechaAceptado"),
                  label: 'FECHA ACEPTADO',
                  initialValue: detail.datosContrato?.fechaAceptado ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("plzEntrega"),
                  label: 'PLAZO DE ENTREGA',
                  initialValue: detail.datosContrato?.plazoEntrega ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("nomTaller"),
                  label: 'NOMBRE DE TALLER',
                  initialValue: detail.datosContrato?.nombreTaller ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("cifTaller"),
                  label: 'CIF DE TALLER',
                  initialValue: detail.datosContrato?.cifTaller ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("domicilioSocial"),
                  label: 'DOMICILIO SOCIAL',
                  initialValue: detail.datosContrato?.domicilioSocial ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("regContrato"),
                  label: 'REGISTRO CONTRATO',
                  initialValue: detail.datosContrato?.registroContrato ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("tomoContrato"),
                  label: 'TOMO REGISTRO',
                  initialValue: detail.datosContrato?.tomoRegistro ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("folioContrato"),
                  label: 'FOLIO REGISTRO',
                  initialValue: detail.datosContrato?.folioRegistro ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("hojaReg"),
                  label: 'HOJA REGISTRO',
                  initialValue: detail.datosContrato?.hojaRegistro ?? '',
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("precioT"),
                  label: 'PRECIO TOTAL',
                  initialValue: "${detail.datosContrato?.precioTotal}€",
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("entreCuta"),
                  label: 'ENTREGA CUENTA',
                  initialValue: "${detail.datosContrato?.entregaCuenta}€",
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("numMensualidades"),
                  label: 'NÚMERO DE MENSUALIDADES',
                  initialValue: detail.datosContrato?.numMensualidades,
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
                MyInput(
                  key: const Key("impMensual"),
                  label: 'IMPORTE MENSUAL',
                  initialValue: "${detail.datosContrato?.importeMensualidad}€",
                  readOnly: true,
                  variant: MyInputVariant.backgroundBlue,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
