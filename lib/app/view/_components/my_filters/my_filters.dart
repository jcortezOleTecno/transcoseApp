import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/domain/model/filter.dart';
import 'package:vemare/app/domain/model/months.dart';
import 'package:vemare/app/domain/utils/months_list.dart';
import 'package:vemare/app/domain/utils/year_list.dart';
import 'package:vemare/app/view/theme/theme.dart';

import '../../theme/button_style.dart';
import '../../theme/color.dart';
import '../../theme/text_style.dart';
import '../my_button/my_button.dart';
import '../my_button/my_icon_button.dart';
import '../my_dropdown_button/my_drop_down_button.dart';
import '../my_spacer/my_spacer.dart';

Future<Filter?> myFilters(
  BuildContext context, {
  bool status = false,
  List<String>? estadosSustitucion,
  List<String>? estadosTramitacion,
}) {
  Months? monthsSelect;
  String? yearSelect;
  DateTime? startDate;
  DateTime? endDate;
  int? quarter;
  String? estado;
  String? estSustitucion;
  String? estTramitacion;

  List<String> estados = ['abiertos', 'cerrados', 'todos'];

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
                            spacerM,
                            const Text(
                              'Filtrar por mes',
                              style: AppTextStyle.inputLabelStyle,
                            ),
                            MyCustomDropdownButton<Months>(
                              hint: 'Selecciona un mes',
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
                            if (status) ...[
                              spacerM,
                              const Text(
                                'Filtrar por estado',
                                style: AppTextStyle.inputLabelStyle,
                              ),
                              MyCustomDropdownButton<String>(
                                hint: 'Selecciona un estado',
                                dropdownItems: estados
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
                                value: estado,
                                onChanged: (value) {
                                  setState(() {
                                    estado = value;
                                  });
                                },
                              ),
                            ],
                            if (estadosTramitacion != null) ...[
                              spacerM,
                              const Text(
                                'Filtrar por estado de tramitación',
                                style: AppTextStyle.inputLabelStyle,
                              ),
                              MyCustomDropdownButton<String>(
                                hint: 'Selecciona un estado',
                                dropdownItems: estadosTramitacion
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
                                value: estTramitacion,
                                onChanged: (value) {
                                  setState(() {
                                    estTramitacion = value;
                                  });
                                },
                              ),
                            ],
                            if (estadosSustitucion != null) ...[
                              spacerM,
                              const Text(
                                'Filtrar por estado de sustitución',
                                style: AppTextStyle.inputLabelStyle,
                              ),
                              MyCustomDropdownButton<String>(
                                hint: 'Selecciona un estado',
                                dropdownItems: estadosSustitucion
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
                                value: estSustitucion,
                                onChanged: (value) {
                                  setState(() {
                                    estSustitucion = value;
                                  });
                                },
                              ),
                            ]
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
                              final filter = Filter(
                                startDate: startDate,
                                endDate: endDate,
                                month: monthsSelect?.id,
                                year: yearSelect,
                                quarter: quarter,
                                status: estado,
                                statusSust: estSustitucion,
                                statusTram: estTramitacion,
                              );
                              Navigator.of(context).pop(filter);
                            },
                            text: 'Aplicar',
                            width: double.infinity,
                            disabled: (startDate == null || endDate == null) &&
                                yearSelect == null &&
                                estado == null &&
                                estSustitucion == null &&
                                estTramitacion == null,
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
                                estSustitucion = null;
                                estTramitacion = null;
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
