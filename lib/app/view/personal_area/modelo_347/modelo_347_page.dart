import 'package:flutter/material.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class Modelo347Page extends StatefulWidget {
  const Modelo347Page({super.key});
  static const route = '/modelo_347';

  @override
  State<Modelo347Page> createState() => _Modelo347PageState();
}

class _Modelo347PageState extends State<Modelo347Page> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Modelo 347', style: AppTextStyle.h1Style),
              Text(
                getIt.get<LocalDataRepository>().user?.name ?? '',
                style: AppTextStyle.h3Style.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              spacerL,
              Text(
                'Filtrar por año',
                style: AppTextStyle.inputLabelStyle,
              ),
              MyCustomDropdownButton(
                  hint: 'Seleccione',
                  dropdownItems: items
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  }),
              spacerM,
              ...List.generate(4, (i) {
                return _Item();
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('TRIMESTRE', style: AppTextStyle.defaultStyle),
              Text(
                'Trimestre 1',
                style: AppTextStyle.titleCard,
              ),
            ],
          ),
          spacerS,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('EMISOR', style: AppTextStyle.defaultStyle),
                    Text(
                      'VEM',
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
                      'TOTAL',
                      style: AppTextStyle.defaultStyle,
                    ),
                    Text(
                      '42.060,50 €',
                      style: AppTextStyle.titleCard,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
