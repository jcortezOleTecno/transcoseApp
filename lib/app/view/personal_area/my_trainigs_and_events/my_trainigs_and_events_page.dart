import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/my_account_repository.dart';
import 'package:vemare/app/domain/model/detail_event.dart';
import 'package:vemare/app/domain/model/trainings_event.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/personal_area/my_trainigs_and_events/bloc/my_trainigs_and_events_state.dart';
import 'package:vemare/app/view/personal_area/widgets/item_card.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

import 'bloc/my_trainigs_and_events_cubit.dart';

class MyTrainingAndEventsPage extends StatelessWidget {
  const MyTrainingAndEventsPage._({super.key});
  static const route = '/my_trainings_and_events';

  static Widget create() {
    return BlocProvider(
      create: (context) => MyTrainigsAndEventsCubit(
        getIt.get<MyAccountRepository>(),
      ),
      child: const MyTrainingAndEventsPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<MyTrainigsAndEventsCubit>();
    return Scaffold(
      body: MyBody(
        child: BlocBuilder<MyTrainigsAndEventsCubit, MyTrainigsAndEventsState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text('Mis formaciones y eventos',
                      style: AppTextStyle.h1Style),
                  Text(
                    LocalDataRepository().user?.name ?? '',
                    style: AppTextStyle.h3Style.copyWith(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  spacerL,
                  MyIconButton(
                    onPressed: () {
                      myFilters(context).then((filter) {
                        if (filter != null) {
                          cubit.getData(filter: filter);
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
                    ...List.generate(4, (i) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: MyShimmer(
                          height: 130,
                          margin: EdgeInsets.zero,
                        ),
                      );
                    }),
                  if (!state.loading)
                    ...state.data
                        .map((e) => _TrainingsAndEventCard(e))
                        .toList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _TrainingsAndEventCard extends StatelessWidget {
  const _TrainingsAndEventCard(
    this.data, {
    Key? key,
  }) : super(key: key);

  final TrainingsEvents data;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.blue100),
      ),
      child: Column(
        children: [
          Container(
              width: double.infinity,
              // padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColor.blue50,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                        child: Item(title: 'NOMBRE', content: data.name ?? '')),
                    _popupMenu(context, data)
                  ],
                ),
              )),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Item(
                        title: 'FECHA',
                        content: DateFormat.yMd('es')
                            .format(data.fecha ?? DateTime.now()))),
                Expanded(child: Item(title: 'HORA', content: data.hora ?? '')),
                Expanded(
                    child: Item(
                        title: 'TIPO',
                        content: data.tipo?.toUpperCase() ?? '')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuButton<dynamic> _popupMenu(
      BuildContext context, TrainingsEvents data) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      constraints: const BoxConstraints(maxWidth: 200),
      onSelected: (value) {
        switch (value) {
          case 1:
            getIt<MyAccountRepository>()
                .getDetail(id: data.id?.toString() ?? '', type: data.tipo!)
                .then(
              (value) {
                _dialogDetail(context, value);
              },
            );
            break;
          case 2:
            context
                .read<MyTrainigsAndEventsCubit>()
                .cancelRegistration(data.id!);
            break;
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              value: 1,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Ver detalles',
                      style: AppTextStyle.inputStyle
                          .copyWith(color: AppColor.primaryBlue),
                    ),
                    spacerXs,
                    Image.asset('assets/icons/IconEdit.png', scale: 2)
                  ],
                ),
              )),
          PopupMenuItem(
              value: 2,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Cancelar asistencia',
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

  Future<bool?> _dialogDetail(
    BuildContext context,
    DetailEvent data,
  ) {
    return showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            insetPadding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const MySpacer(height: 15),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.blue100,
                    ),
                    child: Image.asset('assets/icons/calendar.png', scale: 2),
                  ),
                  spacerM,
                  RichText(
                    text: TextSpan(
                      style: AppTextStyle.h3Style,
                      children: [
                        TextSpan(
                          text: data.date ?? '',
                        ),
                        TextSpan(
                          text: ' • ${data.time} - ${data.endTime}',
                          style: AppTextStyle.defaultStyle
                              .copyWith(color: AppColor.neutral40),
                        ),
                      ],
                    ),
                  ),
                  spacerS,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icons/locate.png',
                        scale: 2,
                        color: AppColor.primaryBlue,
                      ),
                      spacerS,
                      Text(
                        data.location ?? '',
                        style: AppTextStyle.defaultStyle,
                      )
                    ],
                  ),
                  spacerM,
                  if (data.googleMeet != null) ...[
                    MyButton(
                      onPressed: () async {
                        await launchUrlString(data.googleMeet!);
                        // await launchUrlString("https://www.google.com.ve");
                      },
                      text: 'Ir a Google meet',
                      variant: MyButtonVariant.link,
                    ),
                    spacerM,
                  ],
                  Text(
                    data.title ?? '',
                    style: AppTextStyle.h3Style,
                  ),
                  spacerS,
                  Expanded(
                      child: SingleChildScrollView(
                          child: MyHtml(text: data.description ?? ''))),
                  spacerM,
                  MyButton(
                    onPressed: () => Navigator.of(context).pop(),
                    text: 'Aceptar',
                    width: double.infinity,
                    variant: MyButtonVariant.outlinedBold,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
