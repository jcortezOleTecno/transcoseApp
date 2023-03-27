// import 'package:dropdown_search/dropdown_search.dart' as drop;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_calendar/my_calendar.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class EnrollTrainingPage extends StatelessWidget {
  const EnrollTrainingPage({super.key});
  static const route = '/enroll_training';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyBackButton(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Nombre de la formación',
                    style: AppTextStyle.h1Style,
                  ),
                  spacerS,
                  Text(
                    'Selecciona un area de formación',
                    style: AppTextStyle.defaultStyle,
                  ),
                  spacerXL,
                  MyCalendar(
                    dates: [
                      DateTime(2023, 3, 21),
                      DateTime(2023, 3, 23),
                      DateTime(2023, 3, 29),
                    ],
                    onSelectedDate: (dateTime) {
                      _dialogConfirmSchedule(context, dateTime).then((v) {
                        if (v!) {
                          _dialogEnrollEmployee(context, dateTime);
                        }
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool?> _dialogConfirmSchedule(
      BuildContext context, DateTime dateTime) {
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
                          text: DateFormat.MMMMd('es')
                              .format(dateTime)
                              .toUpperCase(),
                        ),
                        TextSpan(
                          text: ' 14:30 - 16:30 h',
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
                      const Text(
                        'Calle Libertad 20, Madrid',
                        style: AppTextStyle.defaultStyle,
                      )
                    ],
                  ),
                  spacerM,
                  Text(
                    "Nombre de la formación",
                    style: AppTextStyle.h3Style,
                  ),
                  spacerS,
                  Text(
                    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id consectetur quis enim, neque. Diam massa ornare mauris sed vestibulum. Curabitur erat nisl nibh sit vulputate cras auctor.
Enim, ipsum pellentesque vestibulum sed elit. Quis tortor libero nisi, lorem nullam arcu facilisis.''',
                    style: AppTextStyle.defaultStyle,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  MyButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    text: 'Confirmar horario',
                    width: double.infinity,
                  ),
                  spacerS,
                  MyButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    text: 'Volver',
                    width: double.infinity,
                    variant: MyButtonVariant.outlinedBold,
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<bool?> _dialogEnrollEmployee(BuildContext context, DateTime dateTime) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: StatefulBuilder(
            builder: (context, setState) {
              var employees = <String>[
                'Nombre de empleado',
                'Nombre de empleado',
                'Nombre de empleado',
                'Nombre de empleado',
                'Nombre de empleado',
                'Nombre de empleado'
              ];
              var selectedEmployees = <String>[];
              return Container(
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
                      child:
                          Image.asset('assets/icons/empleados.png', scale: 2),
                    ),
                    spacerM,
                    const Text('Inscribe empleados',
                        style: AppTextStyle.h1Style),
                    spacerS,
                    const Text(
                      'Selecciona mínimo un (1) empleado para confirmar la asistencia.',
                      style: AppTextStyle.defaultStyle,
                      textAlign: TextAlign.center,
                    ),
                    spacerM,
                    MyCustomDropdownMulti(
                        employees: employees,
                        selectedEmployees: selectedEmployees),
                    const Spacer(),
                    MyButton(
                      onPressed: () {},
                      text: 'Confirmar inscripciones',
                      width: double.infinity,
                    ),
                    spacerS,
                    MyButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      text: 'Volver',
                      width: double.infinity,
                      variant: MyButtonVariant.outlinedBold,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class MyCustomDropdownMulti extends StatelessWidget {
  const MyCustomDropdownMulti({
    Key? key,
    required this.employees,
    required this.selectedEmployees,
  }) : super(key: key);

  final List<String> employees;
  final List<String> selectedEmployees;

  @override
  Widget build(BuildContext context) {
    return MyCustomDropdownButton(
      hint: 'Selecciona uno o varios',
      dropdownItems: employees.map((e) {
        return DropdownMenuItem<String>(
          value: e,
          enabled: false,
          child: StatefulBuilder(
            builder: (context, menuSetState) {
              final _isSelected = selectedEmployees.contains(e);
              return InkWell(
                onTap: () {
                  _isSelected
                      ? selectedEmployees.remove(e)
                      : selectedEmployees.add(e);
                  // setState(() {});
                  menuSetState(() {});
                },
                child: Container(
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      _isSelected
                          ? const Icon(Icons.check_box_outlined)
                          : const Icon(Icons.check_box_outline_blank),
                      const SizedBox(width: 16),
                      Text(
                        e,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }).toList(),
      value: selectedEmployees.isEmpty ? null : selectedEmployees.last,
      onChanged: (value) {},
      selectedItemBuilder: (context) {
        return employees.map(
          (item) {
            return Container(
              alignment: AlignmentDirectional.center,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                selectedEmployees.join(', '),
                style: const TextStyle(
                  fontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            );
          },
        ).toList();
      },
    );
  }
}
