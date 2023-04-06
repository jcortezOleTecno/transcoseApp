import 'package:flutter/material.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_label_status/my_label_status.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class SatPage extends StatelessWidget {
  const SatPage({super.key});
  static const route = '/sat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: SingleChildScrollView(
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
              ...List.generate(4, (i) {
                return _SATCard();
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _SATCard extends StatelessWidget {
  const _SATCard({
    Key? key,
  }) : super(key: key);

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('REVISIÓN', style: AppTextStyle.defaultStyle),
                    Text(
                      '???',
                      style: AppTextStyle.titleCard,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FECHA',
                      style: AppTextStyle.defaultStyle,
                    ),
                    Text(
                      '00/00/00',
                      style: AppTextStyle.titleCard,
                    ),
                  ],
                ),
              ),
              _popupMenu(),
            ],
          ),
          spacerM,
          MyLabelStatus.pending(),
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
