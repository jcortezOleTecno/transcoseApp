import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vemare/app/data/contracts_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/contract_pmp_detail.dart';
import 'package:vemare/app/domain/model/contrato_pmp.dart';
import 'package:vemare/app/domain/utils/money_formatter.dart';
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

import 'bloc/contract_pmp_details_cubit.dart';
import 'bloc/contract_pmp_details_state.dart';

class ContractPMPDetailPage extends StatelessWidget {
  const ContractPMPDetailPage._();

  static const route = '/contract_pmp_detail';

  static Widget create(ContratoPmp contrat) {
    return BlocProvider(
      create: (context) => ContratPMPDetailCubit(
        getIt.get<ContratsRepository>(),
        contrat,
      ),
      child: const ContractPMPDetailPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContratPMPDetailCubit>();
    return Scaffold(
      body: MyBody(
        child: BlocConsumer<ContratPMPDetailCubit, ContratPMPDetailState>(
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
                        const Text('Contrato PMP', style: AppTextStyle.h1Style),
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
                        if ((state.detail?.firmado ?? 'No') == 'No' &&
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

class _Detail extends StatelessWidget {
  const _Detail(
    this.detail, {
    Key? key,
  }) : super(key: key);

  final ContratPmpDetail detail;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ContratPMPDetailCubit>().state;
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
                    title: 'CÓDIGO DE CONTRATO',
                    content: detail.codigoContrato.toString()),
              ),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'FECHA DE INICIO',
                      content: detail.fechaInicio ?? '')),
              Expanded(
                  child:
                      Item(title: 'FECHA FIN', content: detail.fechaFin ?? '')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(title: 'FIRMANO', content: detail.firmado ?? '')),
              Expanded(
                  child: Item(
                      title: 'FECHA FIRMA', content: detail.fechaFirma ?? '')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'PERSONA FIRMA',
                      content: detail.personaFirma ?? '')),
              Expanded(
                  child: Item(
                      title: 'NIF', content: detail.nifPersonafirma ?? '')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'FECHA BAJA', content: detail.fechaBaja ?? '')),
              Expanded(
                  child: Item(
                      title: 'IMPORTE TOTAL',
                      content: '${detail.importeTotal ?? ''}€')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'DESCUENTO',
                      content: '${detail.descuento ?? ''}€')),
              Expanded(
                  child: Item(
                      title: 'IMPORTE FINAL',
                      content: '${detail.importeFinal ?? ''}€')),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                  child: Item(
                      title: 'CUOTA INICIAL',
                      content: '${detail.cuotaInicial ?? ''}€')),
              Expanded(
                  child: Item(
                      title: 'CUOTA MENSUAL',
                      content: '${detail.cuotaMensual ?? ''}€')),
            ],
          ),
          spacerS,
          Item(
              title: 'NUMERO DE CUOTAS',
              content: detail.numeroCuotas?.toString() ?? '0'),
          if (detail.maquinas != null)
            if (detail.maquinas!.isNotEmpty) ...[
              spacerS,
              const MyDivider(),
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
                      children: [
                        spacerS,
                        Row(
                          children: [
                            Expanded(
                                child: Item(
                                    title: 'MARCA', content: e.marca ?? '')),
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
                                child:
                                    Item(title: 'PMP', content: e.pmp ?? '')),
                            Expanded(
                                child: Item(
                                    title: 'N° DE PMP',
                                    content: e.numeroPmp?.toString() ?? '')),
                          ],
                        ),
                        spacerS,
                        Row(
                          children: [
                            Expanded(
                                child: Item(
                                    title: 'TIPO DE EQUIPO TALLER',
                                    content: e.tipoEquipoTaller ?? '')),
                          ],
                        ),
                        spacerS,
                        Row(
                          children: [
                            Expanded(
                                child: Item(
                                    title: 'FECHA INICIAL PMP',
                                    content: e.fiPmp ?? '')),
                            Expanded(
                                child: Item(
                                    title: 'FECHA FINAL PMP',
                                    content: e.ffPmp ?? '')),
                          ],
                        ),
                        spacerS,
                        if (e != detail.maquinas!.last) const MyDivider(),
                      ],
                    ),
                  )
                  .toList(),
              if (detail.servicions != null)
                if (detail.servicions!.isNotEmpty) ...[
                  spacerS,
                  const MyDivider(),
                  Center(
                    child: Text(
                      'SERVICIOS',
                      style: AppTextStyle.defaultStyle
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const MyDivider(),
                  ...detail.servicions!
                      .map((e) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              spacerS,
                              Text(
                                e.nombre ?? '',
                                style: AppTextStyle.defaultStyle
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              spacerS,
                              Row(
                                children: [
                                  Expanded(
                                      child: Item(
                                          title: 'MANTENIMIENTO',
                                          content: fmf
                                              .copyWith(
                                                  amount:
                                                      e.importeMantenimiento)
                                              .output
                                              .symbolOnRight)),
                                  Expanded(
                                      child: Item(
                                          title: 'REPARACIÓN',
                                          content: fmf
                                              .copyWith(
                                                  amount: e.importeReparacion)
                                              .output
                                              .symbolOnRight)),
                                  Expanded(
                                      child: Item(
                                          title: 'AVERIA',
                                          content: fmf
                                              .copyWith(amount: e.importeAveria)
                                              .output
                                              .symbolOnRight))
                                ],
                              ),
                              spacerS,
                              if (e != detail.servicions!.last)
                                const MyDivider(),
                            ],
                          ))
                      .toList()
                ],
              if (detail.documentoFirmado != null) ...[
                spacerS,
                const MyDivider(),
                Center(
                  child: Text(
                    'DOCUMENTO FIRMADO',
                    style: AppTextStyle.defaultStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const MyDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Item(
                        title: "COD. DOCUMENTO",
                        content: detail.documentoFirmado?.codigoDocumento
                                ?.toString() ??
                            ''),
                    ButtonDownloadPdf(
                      future: () => getIt
                          .get<ContratsRepository>()
                          .downloadPdfPmp(
                              codContrato:
                                  state.detail!.codigoContrato.toString(),
                              codDocumento: detail
                                  .documentoFirmado!.codigoDocumento!
                                  .toString(),
                              name:
                                  detail.documentoFirmado?.nombre ?? 'Doc.pdf'),
                    ),
                  ],
                ),
                spacerS,
                Item(
                    title: "NOMBRE",
                    content: detail.documentoFirmado?.nombre ?? ''),
                spacerS,
                Item(
                    title: "DESCRIPCIÓN",
                    content: detail.documentoFirmado?.descripcion ?? ''),
                spacerS,
                Item(
                    title: "AÑO",
                    content: detail.documentoFirmado?.anio?.toString() ?? ''),
              ]
            ]
        ],
      ),
    );
  }
}
