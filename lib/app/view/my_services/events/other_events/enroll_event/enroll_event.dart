// import 'package:dropdown_search/dropdown_search.dart' as drop;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_calendar/my_calendar.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/my_services/events/other_events/enroll_event/bloc/enroll_event_cubit.dart';
import 'package:vemare/app/view/my_services/events/other_events/enroll_event/bloc/enroll_event_state.dart';
import 'package:vemare/app/view/my_services/formations/enroll_training/enroll_training.dart';
import 'package:vemare/app/view/shared/userbloc/user_cubit.dart';
import 'package:vemare/app/view/shared/userbloc/user_state.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class EnrollEventPage extends StatelessWidget {
  const EnrollEventPage._(this.event);
  static const route = '/enroll_event';

  final Events event;

  static Widget create(Events event) {
    return BlocProvider(
      create: (context) => EnrollEventCubit(
        getIt.get<EventsRepository>(),
      ),
      child: EnrollEventPage._(event),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnrollEventCubit, EnrollEventState>(
      builder: (context, state) {
        return Scaffold(
          body: MyBody(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyBackButton(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          event.title ?? '',
                          style: AppTextStyle.h1Style,
                        ),
                        spacerM,

                        MyCalendar(
                          dates: event.horario ?? [],
                          onSelectedDate: (horario) {
                            if (horario.date!.isBefore(DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day))) {
                              _dialogConfirmSchedule(context, horario,
                                  isResume: true);
                            } else {
                              _dialogConfirmSchedule(context, horario)
                                  .then((v) {
                                if (v ?? false) {
                                  _dialogEnrollEmployee(
                                          context, horario, state.peopleCounter)
                                      .then((v) {
                                    if (v ?? false) {
                                      _dialogCongratulations(context, horario)
                                          .then((_) {
                                        Navigator.of(context).pop();
                                        // Navigator.of(context).pop();
                                        // Navigator.of(context).pop();
                                        // Navigator.of(context).pop();
                                      });
                                    }
                                  });
                                }
                              });
                            }
                          },
                          onSelectedDateRegistered: (horario) {
                            _dialogConfirmSchedule(context, horario,
                                isResume: true);
                          },
                        ),
                        spacerS,
                        const ColorsGuide()

                        //TEST
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> _dialogConfirmSchedule(BuildContext context, Horario horario,
      {bool isResume = false}) {
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
                              .format(horario.date!)
                              .toUpperCase(),
                        ),
                        TextSpan(
                          text:
                              ' - ${DateFormat.jm().format(DateFormat.j('es').parse(horario.time!))}',
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
                      Expanded(
                        child: Text(
                          horario.location ?? '',
                          style: AppTextStyle.defaultStyle,
                        ),
                      )
                    ],
                  ),
                  spacerM,
                  Text(
                    event.title ?? '',
                    style: AppTextStyle.h3Style,
                  ),
                  spacerS,
                  Expanded(
                      child: SingleChildScrollView(
                          child: MyHtml(text: event.description ?? ''))),
                  spacerM,
                  MyButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    text: isResume ? 'Aceptar' : 'Confirmar horario',
                    width: double.infinity,
                  ),
                  if (!isResume) ...[
                    spacerS,
                    MyButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      text: 'Volver',
                      width: double.infinity,
                      variant: MyButtonVariant.outlinedBold,
                    ),
                  ]
                ],
              ),
            ),
          );
        });
  }

  Future<bool?> _dialogEnrollEmployee(
      BuildContext ctx, Horario date, int limitPeople) {
    var selectedEmployees = <Employee>[];
    List<Employee> people = [];
    bool loading = false;
    final cubit = ctx.read<EnrollEventCubit>();
    return showDialog<bool>(
      context: ctx,
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
                            const Text('Inscribe personas',
                                style: AppTextStyle.h1Style),
                            spacerS,
                            const Text(
                              'Selecciona mínimo un (1) empleado para confirmar la asistencia.',
                              style: AppTextStyle.defaultStyle,
                              textAlign: TextAlign.center,
                            ),
                            if ((people.length + selectedEmployees.length) >
                                limitPeople) ...[
                              spacerM,
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: AppColor.error200,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.warning_amber_rounded,
                                          color: AppColor.error),
                                      spacerS,
                                      Expanded(
                                        child: Text(
                                          'Se han terminado tus plazas contratadas ($limitPeople), si deseas contratar más comunícate con tu asesor comercial.',
                                          style:
                                              AppTextStyle.contentCard.copyWith(
                                            color: AppColor.error,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ],
                            spacerM,
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  'Personas a inscribir (${selectedEmployees.length + people.length}/$limitPeople)',
                                  style: AppTextStyle.inputLabelStyle),
                            ),
                            spacerXs,
                            BlocBuilder<UserCubit, UserState>(
                              builder: (context, state) {
                                return MyCustomDropdownButton<Employee>(
                                  buttonWidth: double.infinity,
                                  hint: 'Selecciona uno o varios',
                                  onChanged: (value) {},
                                  selectedItemBuilder: (context) {
                                    return state.employees.map(
                                      (item) {
                                        return Container(
                                          alignment:
                                              AlignmentDirectional.center,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Text(
                                            selectedEmployees
                                                .map((e) => e.firstName)
                                                .join(', '),
                                            style: AppTextStyle.inputStyle
                                                .copyWith(
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                            maxLines: 1,
                                          ),
                                        );
                                      },
                                    ).toList();
                                  },
                                  dropdownElevation: 1,
                                  dropdownWidth:
                                      MediaQuery.of(context).size.width * .81,
                                  dropdownItems: state.employees.map((e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      enabled: false,
                                      child: StatefulBuilder(
                                        builder: (context, menuSetState) {
                                          // ignore: no_leading_underscores_for_local_identifiers
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                        e.firstName ?? '',
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
                                                      ? const Icon(
                                                          Icons.check_box)
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
                                );
                              },
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
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        cubit
                            .enrollEvent(
                                dateId: date.dateId,
                                idsEmployees: selectedEmployees
                                    .map((e) => e.id!)
                                    .toList(),
                                persons: people)
                            .then((value) {
                          setState(() {
                            event.horario!
                                .firstWhere((e) => e.dateId == date.dateId)
                                .isRegistered = true;
                          });
                          Navigator.of(context).pop(true);
                        });
                      },
                      text: 'Confirmar inscripciones',
                      width: double.infinity,
                      isLoading: loading,
                      disabled: (people.length + selectedEmployees.length) >
                          limitPeople,
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

  Future<Employee?> _dialogEnrollPeople(BuildContext context) {
    Employee person = Employee();
    Email? email;
    return showDialog<Employee?>(
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
                            MyInput(
                              label: 'email',
                              required: true,
                              hintText: 'email',
                              inputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              onChanged: (value) {
                                try {
                                  setState(() {
                                    email = Email(value);
                                  });
                                } catch (e) {
                                  setState(() {
                                    email = null;
                                  });
                                }
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
                          person.firstName == '' ||
                          person.lastName == null ||
                          person.lastName == '' ||
                          person.phone == null ||
                          person.phone == '' ||
                          email == null ||
                          email?.value == '',
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

  Future _dialogCongratulations(BuildContext context, Horario horario) {
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
                                  text: ' ${event.title ?? ''} ',
                                  style: AppTextStyle.defaultStyle
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(
                                  text: 'para el dia ',
                                ),
                                TextSpan(
                                  text:
                                      '${DateFormat.MMMMd('es').format(horario.date!).toUpperCase()}.',
                                  style: AppTextStyle.defaultStyle
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const TextSpan(
                                  text:
                                      '\nTe notificaremos a ti y a los asistentes su inscripción al curso mediante notificación.',
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

  /*Future<bool?> _dialogResume(
    BuildContext context,
    Horario horario,
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
                              .format(horario.date!)
                              .toUpperCase(),
                        ),
                        TextSpan(
                          text:
                              ' - ${DateFormat.jm().format(DateFormat.j('es').parse(horario.time!))}',
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
                        horario.location ?? '',
                        style: AppTextStyle.defaultStyle,
                      )
                    ],
                  ),
                  spacerM,
                  Text(
                    widget.event.title ?? '',
                    style: AppTextStyle.h3Style,
                  ),
                  spacerS,
                  Expanded(
                      child: SingleChildScrollView(
                          child: MyHtml(text: widget.event.description ?? ''))),
                  spacerM,
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
  }*/
}
