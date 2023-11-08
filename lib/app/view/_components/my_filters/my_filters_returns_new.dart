import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/domain/model/months.dart';
import 'package:vemare/app/domain/model/returns_model.dart';
import 'package:vemare/app/domain/utils/months_list.dart';
import 'package:vemare/app/domain/utils/year_list.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/theme/theme.dart';

import '../../theme/button_style.dart';
import '../../theme/color.dart';
import '../../theme/text_style.dart';
import '../my_button/my_button.dart';
import '../my_button/my_icon_button.dart';
import '../my_dropdown_button/my_drop_down_button.dart';
import '../my_spacer/my_spacer.dart';

Future<FilterReturnsNew?> myFiltersReturnsNew({required BuildContext context, required FilterReturnsNew filterReturns }){

  String? yearSelect = filterReturns.anio;
  int? quarter = filterReturns.quarter;
  String? referencia = filterReturns.referencia;
  String? albaran = filterReturns.albaran;
  DateTime? startDate = filterReturns.startDate;
  DateTime? endDate = filterReturns.endDate;

  Months? monthsSelect;

  if(filterReturns.mes != null){
    for (var element in monthsList) {
      if(element.id == filterReturns.mes){ monthsSelect = element; }
    }
  }

  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MySpacer(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Aplicar filtros',
                                    style: AppTextStyle.h2Style),
                                IconButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    icon: const Icon(Icons.close))
                              ],
                            ),
                            const Text(
                              'Filtrar por referencia',
                              style: AppTextStyle.inputLabelStyle,
                            ),
                            MyInput(
                              key: const Key('Filtrar por referencia'),
                              label: '',
                              hintText: 'Filtrar por referencia',
                              onChanged: (value){
                                setState(() {
                                  if(value.isNotEmpty){
                                    referencia = value;
                                  }else{
                                    referencia = null;
                                  }
                                });
                              },
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.sentences,
                              initialValue: referencia ?? '',
                              //variant: MyInputVariant.backgroundBlue,
                            ),
                            spacerM,
                            const Text(
                              'Filtrar por albaran',
                              style: AppTextStyle.inputLabelStyle,
                            ),
                            MyInput(
                              key: const Key('Filtrar por albaran'),
                              label: '',
                              hintText: 'Filtrar por albaran',
                              onChanged: (value){
                                setState(() {
                                  if(value.isNotEmpty){
                                    albaran = value;
                                  }else{
                                    albaran = null;
                                  }
                                });
                              },
                              textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.sentences,
                              initialValue: albaran ?? '',
                              //variant: MyInputVariant.backgroundBlue,
                            ),
                            spacerM,
                            const Text(
                              'Filtrar por mes',
                              style: AppTextStyle.inputLabelStyle,
                            ),
                            MyCustomDropdownButton<Months>(
                              hint: 'Selecciona un mes',
                              // buttonDecoration: const BoxDecoration(
                              //   color: AppColor.blue50
                              // ),
                              dropdownItems: monthsList
                                  .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item.name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: AppTextStyle.inputStyle,
                                        ),
                                      ))
                                  .toList(),
                              buttonWidth: double.infinity,
                              value: monthsSelect,
                              onChanged: (value) {
                                setState(() {
                                  monthsSelect = value;
                                  yearSelect = null;
                                  quarter = null;
                                  startDate = null;
                                  endDate = null;
                                });
                              },
                            ),
                            spacerM,
                            const Text(
                              'Filtrar por año',
                              style: AppTextStyle.inputLabelStyle,
                            ),
                            MyCustomDropdownButton<String>(
                              hint: 'Selecciona un año',
                              dropdownItems: yearsList
                                  .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: AppTextStyle.inputStyle,
                                        ),
                                      ))
                                  .toList(),
                              buttonWidth: double.infinity,
                              value: yearSelect,
                              onChanged: (value) {
                                setState(() {
                                  yearSelect = value;
                                  monthsSelect = null;
                                  quarter = null;
                                  startDate = null;
                                  endDate = null;
                                });
                              },
                            ),
                            spacerM,
                            const Text(
                              'Filtrar por trimestre',
                              style: AppTextStyle.inputLabelStyle,
                            ),
                            MyCustomDropdownButton<int>(
                              hint: 'Selecciona un trimestre',
                              dropdownItems: [1, 2, 3, 4]
                                  .map((item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: AppTextStyle.inputStyle,
                                        ),
                                      ))
                                  .toList(),
                              buttonWidth: double.infinity,
                              value: quarter,
                              onChanged: (value) {
                                setState(() {
                                  quarter = value;
                                  monthsSelect = null;
                                  yearSelect = null;
                                  startDate = null;
                                  endDate = null;
                                });
                              },
                            ),
                            spacerM,
                            const Text(
                              'Filtrar por fechas',
                              style: AppTextStyle.inputLabelStyle,
                            ),
                            Row(
                              children: [
                                ButtonFilter(
                                    text: startDate == null
                                        ? 'Desde'
                                        : DateFormat.yMd('es')
                                        .format(startDate!),
                                    onPressed: () async {
                                      showRoundedDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate:
                                        DateTime(DateTime.now().year - 20),
                                        lastDate: DateTime.now()
                                            .add(const Duration(days: 1)),
                                        locale: const Locale('es', 'ES'),
                                        height: 340,
                                        borderRadius: 16,
                                        theme: AppTheme.light,
                                      ).then((date) {
                                        if (date != null) {
                                          setState(() {
                                            startDate = date;
                                            endDate = null;
                                            yearSelect = null;
                                            monthsSelect = null;
                                            quarter = null;
                                          });
                                        }
                                      });
                                    },
                                    textColor: startDate == null
                                        ? Colors.grey[600]!
                                        : Colors.black),
                                spacerS,
                                ButtonFilter(
                                    text: endDate == null
                                        ? 'Hasta'
                                        : DateFormat.yMd('es').format(endDate!),
                                    onPressed: startDate == null
                                        ? null
                                        : () {
                                      showRoundedDatePicker(
                                        context: context,
                                        initialDate: startDate!,
                                        firstDate: startDate!,
                                        lastDate: DateTime.now()
                                            .add(const Duration(days: 1)),
                                        locale: const Locale('es', 'ES'),
                                        height: 340,
                                        borderRadius: 16,
                                        theme: AppTheme.light,
                                      ).then((date) {
                                        if (date != null) {
                                          setState(() {
                                            endDate = date;

                                            yearSelect = null;
                                            monthsSelect = null;
                                            quarter = null;
                                          });
                                        }
                                      });
                                    },
                                    textColor: endDate == null
                                        ? Colors.grey[600]!
                                        : Colors.black),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          MyButton(
                            onPressed: () {
                              final filter = FilterReturnsNew(
                                startDate: startDate,
                                endDate: endDate,
                                mes: monthsSelect?.id,
                                anio: yearSelect,
                                quarter: quarter,
                                albaran: albaran,
                                referencia: referencia
                              );
                              Navigator.of(context).pop(filter);
                            },
                            text: 'Aplicar',
                            width: double.infinity,
                            disabled: (startDate == null || endDate == null) && yearSelect == null && albaran == null && referencia == null && quarter == null && monthsSelect == null,
                          ),
                          spacerS,
                          MyIconButton(
                            onPressed: () {
                              setState(() {
                                yearSelect = null;
                                monthsSelect = null;
                                quarter = null;
                                startDate = null;
                                endDate = null;
                                albaran = null;
                                referencia = null;
                              });
                            },
                            text: 'Borrar filtros',
                            variant: MyButtonVariant.outlinedBold,
                            icon: Image.asset(
                              'assets/icons/Trash.png',
                              scale: 2,
                              color: AppColor.primaryBlue,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      });
}

class ButtonFilter extends StatelessWidget {
  const ButtonFilter(
      {Key? key,
      required this.textColor,
      required this.onPressed,
      required this.text})
      : super(key: key);

  final Color textColor;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: MaterialButton(
      onPressed: onPressed,
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      height: 44,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(text,
              style: AppTextStyle.inputStyle.copyWith(color: textColor))),
    ));
  }
}
