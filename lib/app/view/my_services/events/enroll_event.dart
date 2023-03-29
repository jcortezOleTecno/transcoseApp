// import 'package:dropdown_search/dropdown_search.dart' as drop;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/domain/model/people.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_calendar/my_calendar.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';

class EnrollEventPage extends StatelessWidget {
  const EnrollEventPage({super.key});
  static const route = '/enroll_event';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyBody(
        child: SingleChildScrollView(
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
                      'Nombre del evento',
                      style: AppTextStyle.h1Style,
                    ),
                    spacerM,

                    MyCalendar(
                      dates: [
                        DateTime(2023, 3, 28),
                        DateTime(2023, 3, 30),
                        DateTime(2023, 3, 29),
                      ],
                      onSelectedDate: (dateTime) {
                        _dialogConfirmSchedule(context, dateTime).then((v) {
                          if (v!) {
                            _dialogEnrollEmployee(context).then((v) {
                              if (v!) {
                                _dialogCongratulations(context, dateTime);
                              }
                            });
                          }
                        });
                      },
                    ),

                    //TEST
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> _dialogConfirmSchedule(
    BuildContext context,
    DateTime dateTime,
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
                    "Nombre del evento",
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

  Future<bool?> _dialogEnrollEmployee(BuildContext context) {
    var employees = <String>[
      'Nombre A',
      'Nombre B',
      'Nombre C',
      'Nombre D',
      'Nombre E',
      'Nombre F'
    ];
    var selectedEmployees = <String>[];
    List<Person> people = [];
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
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
                              child: Image.asset(
                                'assets/icons/empleados.png',
                                scale: 2,
                              ),
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Empleados a inscribir',
                                  style: AppTextStyle.inputLabelStyle),
                            ),
                            spacerXs,
                            MyCustomDropdownButton(
                              buttonWidth: double.infinity,
                              hint: 'Selecciona uno o varios',
                              onChanged: (value) {},
                              selectedItemBuilder: (context) {
                                return employees.map(
                                  (item) {
                                    return Container(
                                      alignment: AlignmentDirectional.center,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(
                                        selectedEmployees.join(', '),
                                        style: AppTextStyle.inputStyle.copyWith(
                                            overflow: TextOverflow.ellipsis),
                                        maxLines: 1,
                                      ),
                                    );
                                  },
                                ).toList();
                              },
                              dropdownElevation: 1,
                              dropdownWidth:
                                  MediaQuery.of(context).size.width * .81,
                              dropdownItems: employees.map((e) {
                                return DropdownMenuItem<String>(
                                  value: e,
                                  enabled: false,
                                  child: StatefulBuilder(
                                    builder: (context, menuSetState) {
                                      final _isSelected =
                                          selectedEmployees.contains(e);
                                      return InkWell(
                                        onTap: () {
                                          _isSelected
                                              ? selectedEmployees.remove(e)
                                              : selectedEmployees.add(e);
                                          setState(() {});
                                          menuSetState(() {});
                                        },
                                        child: Container(
                                          height: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Text(e,
                                                    style: AppTextStyle
                                                        .defaultStyle
                                                        .copyWith(
                                                            color: _isSelected
                                                                ? AppColor
                                                                    .neutral
                                                                : AppColor
                                                                    .neutral40)),
                                              ),
                                              _isSelected
                                                  ? const Icon(Icons.check_box)
                                                  : const Icon(Icons
                                                      .check_box_outline_blank),
                                              const SizedBox(width: 16),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                              }).toList(),
                              value: selectedEmployees.isEmpty
                                  ? null
                                  : selectedEmployees.first,
                            ),
                            spacerM,
                            MyIconButton(
                              onPressed: () {
                                _dialogEnrollPeople(context).then((v) {
                                  if (v != null) {
                                    setState(() {
                                      people.add(v);
                                    });
                                  }
                                });
                              },
                              text: 'Inscribir personas manualmente',
                              icon: Image.asset(
                                'assets/icons/mas.png',
                                scale: 2,
                              ),
                              variant: MyButtonVariant.link,
                            ),
                            spacerM,
                            Visibility(
                              visible: people.isNotEmpty,
                              child: Container(
                                width: double.infinity,
                                clipBehavior: Clip.antiAlias,
                                height: 180,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: AppColor.blue100),
                                ),
                                child: ListView.separated(
                                  itemBuilder: (context, i) {
                                    return ListTile(
                                      title: Text(
                                        '${people[i].firstName!} ${people[i].lastName!}',
                                        style: AppTextStyle.inputLabelStyle,
                                      ),
                                      subtitle: Text(
                                        people[i].phone!,
                                        style: AppTextStyle.defaultStyle,
                                      ),
                                      trailing: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              people.removeAt(i);
                                            });
                                          },
                                          icon: Image.asset(
                                            'assets/icons/Trash.png',
                                            scale: 2,
                                          )),
                                    );
                                  },
                                  itemCount: people.length,
                                  separatorBuilder: (_, __) {
                                    return const Divider(
                                        color: AppColor.blue100, thickness: 2);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    MyButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      text: 'Confirmar inscripciones',
                      width: double.infinity,
                      disabled: selectedEmployees.isEmpty && people.isEmpty,
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
          },
        );
      },
    );
  }

  Future<Person?> _dialogEnrollPeople(BuildContext context) {
    Person person = Person();
    return showDialog<Person?>(
      barrierColor: Colors.transparent,
      useSafeArea: true,
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
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
                              child: Image.asset(
                                'assets/icons/Add-user.png',
                                scale: 2,
                              ),
                            ),
                            spacerM,
                            const Text('Inscribir persona',
                                style: AppTextStyle.h1Style),
                            spacerS,
                            const Text(
                              'Completa la información de forma manual',
                              style: AppTextStyle.defaultStyle,
                              textAlign: TextAlign.center,
                            ),
                            spacerM,
                            MyInput(
                              label: 'Nombre',
                              hintText: 'Nombre',
                              required: true,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              onChanged: (name) {
                                setState(() {
                                  person.firstName = name;
                                });
                              },
                            ),
                            MyInput(
                              label: 'Apellido',
                              required: true,
                              hintText: 'Apellidos',
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                setState(() {
                                  person.lastName = value;
                                });
                              },
                            ),
                            MyInput(
                              label: 'Teléfono móvil',
                              required: true,
                              hintText: 'Teléfono móvil',
                              inputType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                setState(() {
                                  person.phone = value;
                                });
                              },
                            ),
                            // const Spacer(),
                          ],
                        ),
                      ),
                    ),
                    MyIconButton(
                      onPressed: () {
                        Navigator.of(context).pop(person);
                      },
                      text: 'Inscribir',
                      icon: Image.asset(
                        'assets/icons/mas.png',
                        scale: 2,
                        color: Colors.white,
                      ),
                      disabled: person.firstName == null ||
                          person.lastName == null ||
                          person.phone == null,
                    ),
                    spacerS,
                    MyButton(
                      onPressed: () => Navigator.of(context).pop(),
                      text: 'Cancelar',
                      width: double.infinity,
                      variant: MyButtonVariant.outlinedBold,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future _dialogCongratulations(BuildContext context, DateTime dateTime) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              insetPadding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const MySpacer(height: 15),
                          Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.blue100,
                            ),
                            child: Image.asset(
                              'assets/icons/calendar.png',
                              scale: 1.5,
                            ),
                          ),
                          spacerM,
                          const Text('¡Felicidades!',
                              style: AppTextStyle.h1Style),
                          spacerS,
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: AppTextStyle.defaultStyle.copyWith(
                                color: Colors.black,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'Hemos confirmado tu formación en',
                                ),
                                TextSpan(
                                  text: ' Lorem ipsun ',
                                  style: AppTextStyle.defaultStyle
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(
                                  text: 'para el dia ',
                                ),
                                TextSpan(
                                  text:
                                      '${DateFormat.MMMMd('es').format(dateTime).toUpperCase()}.',
                                  style: AppTextStyle.defaultStyle
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(
                                  text:
                                      '\nTe notificaremos a ti y a los asistentes su inscripción al curso mediante notificación por la APP y vía SMS.',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    MyButton(
                      onPressed: () => Navigator.of(context).pop(),
                      text: 'Aceptar',
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
