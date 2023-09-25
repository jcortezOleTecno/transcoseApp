// import 'package:dropdown_search/dropdown_search.dart' as drop;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/data/events_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/domain/model/events.dart';
import 'package:vemare/app/domain/model/formation.dart';
import 'package:vemare/app/domain/model/employee.dart';
import 'package:vemare/app/domain/model/locations.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_button/my_icon_button.dart';
import 'package:vemare/app/view/_components/my_calendar/my_calendar.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_html/my_html.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
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

class EnrollEventPageArgs {
  final Events event;
  final Locations locations;

  EnrollEventPageArgs(this.event, this.locations);
}

class EnrollEventPage extends StatelessWidget {
  const EnrollEventPage._(this.args);
  static const route = '/enroll_event';

  final EnrollEventPageArgs args;

  static Widget create(EnrollEventPageArgs args) {
    return BlocProvider(
      create: (context) => EnrollEventCubit(
        getIt.get<EventsRepository>(),
        args.locations,
        args.event,
      ),
      child: EnrollEventPage._(args),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EnrollEventCubit>();
    return BlocBuilder<EnrollEventCubit, EnrollEventState>(
      builder: (context, state) {
        return Scaffold(
          body: MyBody(
            child: state.loading
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MyBackButton(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                args.event.title ?? '',
                                style: AppTextStyle.nunito800,
                              ),
                              spacerXs,
                              Text(
                                'Selecciona una fecha',
                                style: AppTextStyle.defaultStyle
                                    .copyWith(fontSize: 16),
                              ),
                              spacerXs,
                              const MyShimmer(
                                margin: EdgeInsets.zero,
                                height: 460,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                : SingleChildScrollView(
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
                                args.event.title ?? '',
                                style: AppTextStyle.nunito800,
                              ),
                              spacerXs,
                              Text(
                                'Selecciona una fecha',
                                style: AppTextStyle.defaultStyle
                                    .copyWith(fontSize: 16),
                              ),
                              spacerXs,

                              (state.showCalendar)
                                  ? Column(
                                      children: [
                                        state.horarioSelected != null
                                            ? _ConfirmAssistance()
                                            : MyCalendar(
                                                dates: state.horarios,
                                                onSelectedDate: (horario) {
                                                  if (horario.date!.isBefore(
                                                      DateTime(
                                                          DateTime.now().year,
                                                          DateTime.now().month,
                                                          DateTime.now()
                                                              .day))) {
                                                    _dialogConfirmSchedule(
                                                        context,
                                                        horario,
                                                        args.event,
                                                        isResume: true);
                                                  } else {
                                                    cubit.selectedHorario(
                                                        horario);
                                                    /*
                                                    TODO: CONFIRMAR ASISTENCIA:: 

                                                    _dialogConfirmSchedule(
                                                            context, horario)
                                                        .then((v) {
                                                      if (v ?? false) {
                                                        _dialogEnrollEmployee(
                                                                context,
                                                                horario)
                                                            .then((v) {
                                                          if (v ?? false) {
                                                            _dialogCongratulations(
                                                                    context,
                                                                    horario)
                                                                .then((_) {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              // Navigator.of(context).pop();
                                                              // Navigator.of(context).pop();
                                                            });
                                                          }
                                                        });
                                                      }
                                                    });*/
                                                  }
                                                },
                                                onSelectedDateRegistered:
                                                    (horario) {
                                                  _dialogConfirmSchedule(
                                                      context,
                                                      horario,
                                                      args.event,
                                                      isResume: true);
                                                },
                                              ),
                                        spacerS,
                                        const ColorsGuide()
                                      ],
                                    )
                                  : ResumenEvent(() {
                                      _dialogConfirmSchedule(
                                        context,
                                        state.horarios.first,
                                        args.event,
                                      ).then((v) {
                                        if (v ?? false) {
                                          _dialogEnrollEmployee(
                                                  context,
                                                  state.horarios.first,
                                                  args.event)
                                              .then((v) {
                                            if (v ?? false) {
                                              _dialogCongratulations(
                                                      context,
                                                      state.horarios.first,
                                                      args.event)
                                                  .then((_) {
                                                Navigator.of(context).pop();
                                                Navigator.of(context).pop();
                                                // Navigator.of(context).pop();
                                                // Navigator.of(context).pop();
                                              });
                                            }
                                          });
                                        }
                                      });
                                    }),

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
}

Future<bool?> _dialogEnrollEmployee(
  BuildContext ctx,
  Horario date,
  Events event,
) {
  var selectedEmployees = <Employee>[];
  List<Employee> people = [];
  bool loading = false;
  // int limitPeople = LocalDataRepository().user?.webservice?.plazasEventos ?? 0;
  String? errorMessage;

  final cubit = ctx.read<EnrollEventCubit>();
  return showDialog<bool>(
    context: ctx,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            insetPadding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                          if (((people.length +
                                      selectedEmployees.length +
                                      (date.occupiedPlaces ?? 0) +
                                      1) >
                                  (date.places ?? 0)) &&
                              errorMessage == null) ...[
                            spacerM,
                            MsgError(
                                message:
                                    'Se han terminado tus plazas contratadas (${date.places}), si deseas contratar más comunícate con tu asesor comercial.'),
                          ],
                          if (errorMessage != null) ...[
                            spacerM,
                            MsgError(message: errorMessage!),
                          ],
                          spacerM,
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                'Personas a inscribir (${selectedEmployees.length + people.length + (date.occupiedPlaces ?? 0)}/${date.places})',
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
                                        alignment: AlignmentDirectional.center,
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(e.firstName ?? '',
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
                      //TODO: MOSTRAR MENSAJE DE ERROR

                      cubit
                          .enrollEvent(
                              dateId: date.dateId,
                              idsEmployees:
                                  selectedEmployees.map((e) => e.id!).toList(),
                              persons: people)
                          .then((value) {
                        setState(() {
                          errorMessage = value!.messaje;
                          if (value.success) {
                            cubit.showEnrolled(date);
                            Navigator.of(context).pop(true);
                          }
                          // if (value.success) {
                          //   event.horario!
                          //       .firstWhere((e) => e.dateId == date.dateId)
                          //       .isRegistered = true;
                          //   Navigator.of(context).pop(true);
                          // }
                          loading = false;
                        });
                      });
                    },
                    text: 'Confirmar inscripciones',
                    width: double.infinity,
                    isLoading: loading,
                    disabled: ((people.length + selectedEmployees.length) >
                        (date.places ??
                            0)) /*||
                         errorMessage != null*/
                    ,
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                                  person.email = value;
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

Future _dialogCongratulations(
    BuildContext context, Horario horario, Events event) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            insetPadding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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

Future<bool?> _dialogConfirmSchedule(
    BuildContext context, Horario horario, Events event,
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
                Text(
                  "Fecha Seleccionada",
                  style: AppTextStyle.nunitoSans700.copyWith(fontSize: 20),
                ),
                spacerS,
                Text('Fechas:',
                    style: AppTextStyle.nunitoSans700.copyWith(fontSize: 12)),
                spacerXs,
                Text(
                  '${horario.dateFormat} a ${horario.endDateFormat}',
                  style: AppTextStyle.nunitoSans700.copyWith(fontSize: 14),
                ),
                if (!horario.allDay) ...[
                  spacerS,
                  Text('Horarios:',
                      style: AppTextStyle.nunitoSans700.copyWith(fontSize: 12)),
                  spacerXs,
                  Text('${horario.timeFormat} • ${horario.endTimeFormat}',
                      style: AppTextStyle.defaultStyle),
                ],
                spacerS,
                Text('Ubicación:',
                    style: AppTextStyle.nunitoSans700.copyWith(fontSize: 12)),
                spacerXs,
                Text(
                  horario.location ?? '',
                  style: AppTextStyle.nunitoSans700.copyWith(fontSize: 14),
                ),
                // Row(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     Image.asset(
                //       'assets/icons/locate.png',
                //       scale: 2,
                //       color: AppColor.primaryBlue,
                //     ),
                //     spacerS,
                //     Expanded(
                //       child: Text(
                //         horario.location ?? '',
                //         style: AppTextStyle.defaultStyle,
                //       ),
                //     )
                //   ],
                // ),
                spacerM,
                Text(
                  event.title ?? '',
                  style: AppTextStyle.nunitoSans700.copyWith(fontSize: 16),
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

class _ConfirmAssistance extends StatelessWidget {
  // const _ConfirmAssistance({
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EnrollEventCubit>();
    return BlocBuilder<EnrollEventCubit, EnrollEventState>(
      builder: (context, state) {
        return Container(
          height: 340,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    spacerM,
                    Text('Fechas:',
                        style:
                            AppTextStyle.nunitoSans700.copyWith(fontSize: 12)),
                    spacerXs,
                    Text(
                      '${state.horarioSelected?.dateFormat} a ${state.horarioSelected?.endDateFormat}',
                      style: AppTextStyle.nunitoSans700.copyWith(fontSize: 14),
                    ),
                    if (!state.horarioSelected!.allDay) ...[
                      spacerS,
                      Text('Horarios:',
                          style: AppTextStyle.nunitoSans700
                              .copyWith(fontSize: 12)),
                      spacerXs,
                      Text(
                          '${state.horarioSelected?.timeFormat} • ${state.horarioSelected?.endTimeFormat}',
                          style: AppTextStyle.defaultStyle),
                    ],
                    spacerS,
                    Text('Ubicación:',
                        style:
                            AppTextStyle.nunitoSans700.copyWith(fontSize: 12)),
                    spacerXs,
                    Text(
                      'Vemare Leganés - C/ Eduardo Torroja 11 28914 Leganés Madrid',
                      style: AppTextStyle.nunitoSans700.copyWith(fontSize: 14),
                    ),
                    const Spacer(),
                    const Text(
                      "Confirme su asistencia a esta formación en el siguiente link, en la fecha y el horario detallado",
                      style: AppTextStyle.defaultStyle,
                      textAlign: TextAlign.center,
                    ),
                    spacerS,
                    MyButton(
                      onPressed: () {
                        _dialogConfirmSchedule(
                                context, state.horarioSelected!, state.event!)
                            .then((v) {
                          if (v ?? false) {
                            _dialogEnrollEmployee(context,
                                    state.horarioSelected!, state.event!)
                                .then((v) {
                              if (v ?? false) {
                                _dialogCongratulations(context,
                                        state.horarioSelected!, state.event!)
                                    .then((_) {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  // Navigator.of(context).pop();
                                  // Navigator.of(context).pop();
                                });
                              }
                            });
                          }
                        });
                      },
                      text: "Confirmar asistencia",
                      width: double.infinity,
                    )
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  onPressed: cubit.unseledtedHorario,
                  icon: Image.asset(
                    "assets/icons/Close.png",
                    scale: 2,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ResumenEvent extends StatelessWidget {
  const ResumenEvent(
    this.onPressed, {
    super.key,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnrollEventCubit, EnrollEventState>(
      builder: (context, state) {
        return SizedBox(
          height: 340,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  spacerM,
                  Text('Fechas:',
                      style: AppTextStyle.nunitoSans700.copyWith(fontSize: 12)),
                  spacerXs,
                  Text(
                    '${state.horarios.first.dateFormat} a ${state.horarios.first.endDateFormat}',
                    style: AppTextStyle.nunitoSans700.copyWith(fontSize: 14),
                  ),
                  if (!state.horarios.first.allDay) ...[
                    spacerS,
                    Text('Horarios:',
                        style:
                            AppTextStyle.nunitoSans700.copyWith(fontSize: 12)),
                    spacerXs,
                    Text(
                        '${state.horarios.first.timeFormat} • ${state.horarios.first.endTimeFormat}',
                        style: AppTextStyle.defaultStyle),
                  ],
                  spacerS,
                  Text('Ubicación:',
                      style: AppTextStyle.nunitoSans700.copyWith(fontSize: 12)),
                  spacerXs,
                  Text(
                    state.horarios.first.location ?? '',
                    style: AppTextStyle.nunitoSans700.copyWith(fontSize: 14),
                  ),
                  /* const Text(
                    "Fecha inicio:",
                    style: AppTextStyle.defaultStyle,
                  ),
                  RichText(
                    text: TextSpan(
                      style: AppTextStyle.h4Style,
                      children: [
                        TextSpan(
                          text: "${state.horarios.first.dateFormat} • ",
                        ),
                        TextSpan(
                          text: state.horarios.first.timeFormat,
                          style: AppTextStyle.defaultStyle
                              .copyWith(color: AppColor.neutral40),
                        ),
                      ],
                    ),
                  ),
                  spacerS,
                  const Text(
                    "Fecha fin:",
                    style: AppTextStyle.defaultStyle,
                  ),
                  RichText(
                    text: TextSpan(
                      style: AppTextStyle.h4Style,
                      children: [
                        TextSpan(
                          text: "${state.horarios.first.endDateFormat} • ",
                        ),
                        TextSpan(
                          text: state.horarios.first.endTimeFormat,
                          style: AppTextStyle.defaultStyle
                              .copyWith(color: AppColor.neutral40),
                        ),
                      ],
                    ),
                  ),
                  spacerS,
                  const Text(
                    "Ubicación:",
                    style: AppTextStyle.defaultStyle,
                  ),
                  Text(
                    state.locations?.location ?? '',
                    style: AppTextStyle.h4Style,
                  ),*/
                  const Spacer(),
                  const Text(
                    "Confirme su asistencia a esta formación en el siguiente link, en la fecha y el horario detallado",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.defaultStyle,
                  ),
                  spacerM,
                  MyButton(
                    onPressed: onPressed,
                    width: double.infinity,
                    text: 'Confirmar asistencia',
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class MsgError extends StatelessWidget {
  const MsgError({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColor.error200, borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.warning_amber_rounded, color: AppColor.error),
            spacerS,
            Expanded(
              child: Text(
                message,
                style: AppTextStyle.contentCard.copyWith(
                  color: AppColor.error,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ));
  }
}
