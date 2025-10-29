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

Future<FilterReturns?> myFiltersReturns(BuildContext context,
    { required FilterReturns filterReturns,required List<String> listSituacion,required List<ReturnsStatusModel> listEstados,}){

  String? yearSelect = filterReturns.anio;
  int? quarter = filterReturns.quarter;
  String? situacion = filterReturns.situacion;
  String? referencia = filterReturns.referencia;
  DateTime? startDate = filterReturns.startDate;
  DateTime? endDate = filterReturns.endDate;

  Months? monthsSelect;
  String? estado;

  List<String> estadosName = [];
  for (var element in listEstados) {
    if(filterReturns.estado != null && element.codigoEstado.toString() == filterReturns.estado){ estado = element.nombre; }
    estadosName.add(element.nombre!);
  }

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
                              'Filtrar por estado',
                              style: AppTextStyle.inputLabelStyle,
                            ),
                            MyCustomDropdownButton<String>(
                              hint: 'Selecciona un estado',
                              dropdownItems: estadosName.map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(item.toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppTextStyle.inputStyle,
                                ),
                              )).toList(),
                              buttonWidth: double.infinity,
                              value: estado,
                              onChanged: (value) {
                                setState(() {
                                  if(value != null){
                                    estado = value;
                                  }else{
                                    estado = null;
                                  }
                                });
                              },
                            ),
                            spacerM,
                            const Text(
                              'Filtrar por situación',
                              style: AppTextStyle.inputLabelStyle,
                            ),
                            MyCustomDropdownButton<String>(
                              hint: 'Selecciona un situación',
                              dropdownItems: listSituacion
                                  .map((item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item.toUpperCase(),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: AppTextStyle.inputStyle,
                                ),
                              ))
                                  .toList(),
                              buttonWidth: double.infinity,
                              value: situacion,
                              onChanged: (value) {
                                setState(() {
                                  if(value != null && value.isNotEmpty){
                                    situacion = value;
                                  }else{
                                    situacion = null;
                                  }
                                });
                              },
                            ),
                            spacerM,
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
                                        firstDate: DateTime(DateTime.now().year - 20),
                                        lastDate: DateTime.now().add(const Duration(days: 1)),
                                        locale: const Locale('es', 'ES'),
                                        textNegativeButton: "Cancelar", // Texto en minúscula para el botón Cancelar
                                        textPositiveButton: "Aceptar", // Texto en minúscula para el botón Aceptar
                                        height: 340,
                                        borderRadius: 16,
                                        styleYearPicker: MaterialRoundedYearPickerStyle(
                                          textStyleYear: const TextStyle(fontSize: 18, color: AppColor.primary),
                                        ),
                                        styleDatePicker: MaterialRoundedDatePickerStyle(
                                          textStyleDayButton: const TextStyle(fontSize: 26, color: Colors.white),
                                          textStyleYearButton: const TextStyle(fontSize: 22,color: Colors.white,),
                                          textStyleDayHeader: const TextStyle(fontSize: 18,color: AppColor.primary,),
                                          textStyleMonthYearHeader: const TextStyle(fontSize: 22, color: AppColor.primary, fontWeight: FontWeight.bold),
                                          colorArrowNext: AppColor.primary,
                                          colorArrowPrevious: AppColor.primary,
                                          textStyleButtonPositive: const TextStyle(fontSize: 18, color: AppColor.primary, fontWeight: FontWeight.bold),
                                          textStyleButtonNegative: const TextStyle(fontSize: 18, color: AppColor.primary),

                                          textStyleCurrentDayOnCalendar: const TextStyle(fontSize: 20, color: AppColor.primary, fontWeight: FontWeight.bold),
                                          textStyleDayOnCalendar: const TextStyle(fontSize: 20, color: AppColor.primary),
                                          textStyleDayOnCalendarSelected: const TextStyle(fontSize: 22, color: AppColor.whiteF, fontWeight: FontWeight.bold),
                                          textStyleDayOnCalendarDisabled: TextStyle(fontSize: 20, color: AppColor.primary.withOpacity(0.1)),
                                        ),
                                        theme: ThemeData(
                                            primaryColor: AppColor.primary,
                                            colorScheme: const ColorScheme.light(
                                              primary: AppColor.primary,
                                              surface: AppColor.whiteF,
                                              onSurface: AppColor.whiteF,
                                              onPrimary: Colors.black,
                                            ),
                                            disabledColor: Colors.black,
                                            dialogBackgroundColor: AppColor.whiteF, // Fondo del diálogo
                                            dialogTheme: DialogTheme(
                                              titleTextStyle: AppTextStyle.inputHintStyle.copyWith(color: AppColor.whiteF),
                                              surfaceTintColor: AppColor.whiteF,
                                              backgroundColor: AppColor.whiteF,
                                              contentTextStyle: AppTextStyle.inputHintStyle.copyWith(color: AppColor.whiteF),
                                              shadowColor: AppColor.whiteF,
                                            )
                                        ),
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
                                        textNegativeButton: "Cancelar", // Texto en minúscula para el botón Cancelar
                                        textPositiveButton: "Aceptar", // Texto en minúscula para el botón Aceptar
                                        height: 340,
                                        borderRadius: 16,
                                        styleYearPicker: MaterialRoundedYearPickerStyle(
                                          textStyleYear: const TextStyle(fontSize: 16, color: AppColor.primary),
                                        ),
                                        styleDatePicker: MaterialRoundedDatePickerStyle(
                                          textStyleDayButton: const TextStyle(fontSize: 26, color: Colors.white),
                                          textStyleYearButton: const TextStyle(fontSize: 22,color: Colors.white,),
                                          textStyleDayHeader: const TextStyle(fontSize: 18,color: AppColor.primary,),
                                          textStyleMonthYearHeader: const TextStyle(fontSize: 22, color: AppColor.primary, fontWeight: FontWeight.bold),
                                          colorArrowNext: AppColor.primary,
                                          colorArrowPrevious: AppColor.primary,
                                          textStyleButtonPositive: const TextStyle(fontSize: 18, color: AppColor.primary, fontWeight: FontWeight.bold),
                                          textStyleButtonNegative: const TextStyle(fontSize: 18, color: AppColor.primary),

                                          textStyleCurrentDayOnCalendar: const TextStyle(fontSize: 20, color: AppColor.primary, fontWeight: FontWeight.bold),
                                          textStyleDayOnCalendar: const TextStyle(fontSize: 20, color: AppColor.primary),
                                          textStyleDayOnCalendarSelected: const TextStyle(fontSize: 22, color: AppColor.whiteF, fontWeight: FontWeight.bold),
                                          textStyleDayOnCalendarDisabled: TextStyle(fontSize: 20, color: AppColor.primary.withOpacity(0.1)),
                                        ),
                                        theme: ThemeData(
                                            primaryColor: AppColor.primary,
                                            colorScheme: const ColorScheme.light(
                                              primary: AppColor.primary,
                                              surface: AppColor.whiteF,
                                              onSurface: AppColor.whiteF,
                                              onPrimary: Colors.black,
                                            ),
                                            disabledColor: Colors.black,
                                            dialogBackgroundColor: AppColor.whiteF, // Fondo del diálogo
                                            dialogTheme: DialogTheme(
                                              titleTextStyle: AppTextStyle.inputHintStyle.copyWith(color: AppColor.whiteF),
                                              surfaceTintColor: AppColor.whiteF,
                                              backgroundColor: AppColor.whiteF,
                                              contentTextStyle: AppTextStyle.inputHintStyle.copyWith(color: AppColor.whiteF),
                                              shadowColor: AppColor.whiteF,
                                            )
                                        ),
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
                              String? codEstado;
                              if(estado != null){
                                for (var element in listEstados) {
                                  if(element.nombre! == estado){ codEstado = element.codigoEstado.toString(); }
                                }
                              }
                              final filter = FilterReturns(
                                  startDate: startDate,
                                  endDate: endDate,
                                  mes: monthsSelect?.id,
                                  anio: yearSelect,
                                  quarter: quarter,
                                  estado: codEstado,
                                  situacion: situacion,
                                  referencia: referencia
                              );
                              Navigator.of(context).pop(filter);
                            },
                            text: 'Aplicar',
                            width: double.infinity,
                            disabled: (startDate == null || endDate == null) && yearSelect == null && estado == null && referencia == null && situacion == null && quarter == null && monthsSelect == null,
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
                                estado = null;
                                referencia = null;
                                situacion = null;
                              });
                              String? codEstado;
                              if(estado != null){
                                for (var element in listEstados) {
                                  if(element.nombre! == estado){ codEstado = element.codigoEstado.toString(); }
                                }
                              }
                              final filter = FilterReturns(
                                  startDate: startDate,
                                  endDate: endDate,
                                  mes: monthsSelect?.id,
                                  anio: yearSelect,
                                  quarter: quarter,
                                  estado: codEstado,
                                  situacion: situacion,
                                  referencia: referencia
                              );
                              Navigator.of(context).pop(filter);
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
