// import 'package:dropdown_search/dropdown_search.dart' as drop;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/data/formations_repository.dart';
import 'package:vemare/app/data/local_data_repository.dart';
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
import 'package:vemare/app/view/my_services/events/other_events/enroll_event/enroll_event.dart';
import 'package:vemare/app/view/my_services/formations/enroll_training/bloc/enroll_training_cubit.dart';
import 'package:vemare/app/view/my_services/formations/enroll_training/bloc/enroll_training_state.dart';
import 'package:vemare/app/view/shared/userbloc/user_cubit.dart';
import 'package:vemare/app/view/shared/userbloc/user_state.dart';
import 'package:vemare/app/view/theme/button_style.dart';
import 'package:vemare/app/view/theme/color.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/config/service_locator.dart';

class EnrollTrainingPageArg {
  final Formation formation;
  final Locations location;

  EnrollTrainingPageArg(this.formation, this.location);
}

class EnrollTrainingPage extends StatelessWidget {
  const EnrollTrainingPage._(this.args);
  static const route = '/enroll_training';

  final EnrollTrainingPageArg args;

  static Widget create(EnrollTrainingPageArg args) {
    return BlocProvider(
      create: (context) => EnrollTrainingCubit(
        getIt.get<FormationsRepository>(),
        args.location,
        args.formation,
      ),
      child: EnrollTrainingPage._(args),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EnrollTrainingCubit>();
    return BlocBuilder<EnrollTrainingCubit, EnrollTrainingState>(
      builder: (context, state) {
        return Scaffold(
          body: MyBody(
            child: state.loading
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyBackButton(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              args.formation.title ?? '',
                              style: AppTextStyle.h1Style,
                            ),
                            spacerXs,
                            const MyShimmer(
                              margin: EdgeInsets.zero,
                              height: 360,
                            )
                          ],
                        ),
                      )
                    ],
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
                                args.formation.title ?? '',
                                style: AppTextStyle.h1Style,
                              ),
                              spacerS,
                              (state.showCalendar)
                                  ? Column(
                                      children: [
                                        Text(
                                          'Selecciona una fecha',
                                          style: AppTextStyle.defaultStyle.copyWith(fontSize: 20),
                                        ),
                                        spacerS,
                                        state.horarioSelected != null ? _ConfirmAssistance() :
                                        MyCalendar(
                                          dates: state.horarios,
                                          onSelectedDate: (horario) {
                                            if (horario.date!.isBefore(DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day))) {
                                              _dialogConfirmSchedule(context,horario,args.formation,isResume: true);
                                            } else {
                                              cubit.selectedHorario(horario);
                                            }
                                          },
                                          onSelectedDateRegistered: (horario) {
                                            _dialogConfirmSchedule(context,horario,args.formation,isResume: true);
                                          },
                                        ),
                                        spacerS,
                                        const ColorsGuide(isCalendar: true)
                                      ],
                                    )
                                  : ResumenTraining(() {
                                _dialogConfirmSchedule(context,state.horarios.first,args.formation).then((v) {
                                  if (v ?? false) {
                                    _dialogEnrollEmployee(context, state.horarios.first).then((v) {
                                      if (v ?? false) {
                                        _dialogCongratulations(context,state.horarios.first,args.formation).then((_) {
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

Future<bool?> _dialogConfirmSchedule(BuildContext context,Horario horario,Formation formation, {bool isResume = false,}) {
  return showDialog<bool>(context: context,barrierDismissible: false,
      builder: (context) {

        TextStyle style1 = AppTextStyle.nunitoSans700.copyWith(fontSize: 18,fontWeight: FontWeight.normal);
        TextStyle style2 = AppTextStyle.nunitoSans700.copyWith(fontSize: 20);
        TextStyle style3 = AppTextStyle.nunitoSans700.copyWith(fontSize: 18,fontWeight: FontWeight.normal);
        TextStyle style4 = AppTextStyle.nunitoSans700.copyWith(fontSize: 14,fontWeight: FontWeight.normal);

        String titleHorarios = horario.hours.first.dateFormat ?? '';
        if(horario.hours.length > 1){
          titleHorarios = '${horario.hours.first.dateFormat ?? ''} a ${horario.hours.last.dateFormat ?? ''}';
        }

        return Dialog(
          insetPadding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                spacerM,
                Text(
                  "Fecha Seleccionada",
                  style: AppTextStyle.nunitoSans700.copyWith(fontSize: 20),
                ),
                spacerS,
                Text('Fechas:',style: style1),
                spacerXs,
                Text(titleHorarios, style: style2,),
                if (!horario.allDay) ...[
                  spacerS,
                  Text('Horarios:',style: style1),
                  spacerXs,
                  ...horario.hours.map((e){

                    String dateF = e.dateFormat ?? '';
                    if(dateF.length > 10){
                      dateF = '${dateF.substring(0,9)}..';
                    }

                    return SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(flex: 2,child: Text(dateF,style: style3.copyWith(fontWeight: FontWeight.bold))),
                                Expanded(flex: 3,child: Text('${e.timeMorningFormat ?? ''} - ${e.endTimeMorningFormat ?? ''}',style: style3)),
                                Expanded(flex: 3,child: Text('${e.timeAfternoonFormat ?? ''} - ${e.endTimeAfternoonFormat ?? ''}',style: style3)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(flex: 2,child: Container()),
                                Expanded(flex: 3,child: Text( (e.food ?? false) ? 'Incluye almuerzo' : '',style: style4)),
                                Expanded(flex: 3,child: Container()),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ],
                spacerS,
                Text('Ubicación:',style: style1),
                spacerXs,
                Text(horario.location ?? '',style: style2,),
                spacerM,
                Text(formation.title ?? '',style: style2,),
                spacerS,
                Expanded(
                  child: SingleChildScrollView(
                      child: MyHtml(text: formation.description ?? '',bodyFontSize: 20,),
                  ),
                ),
                spacerM,
                MyButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  text: isResume ? 'Aceptar' : 'Inscribir asistentes',
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

Future<bool?> _dialogEnrollEmployee(BuildContext ctx, Horario date) {
  return showDialog<bool>(
    context: ctx,
    barrierDismissible: false,
    builder: (context) {
      return DialogEnrollEmployeeTraining(
        ctx,
        date: date,
      );
    },
  );
}

class DialogEnrollEmployeeTraining extends StatefulWidget {
  const DialogEnrollEmployeeTraining(
    this.ctx, {
    super.key,
    required this.date,
  });

  final BuildContext ctx;
  final Horario date;

  @override
  State<DialogEnrollEmployeeTraining> createState() =>
      _DialogEnrollEmployeeTrainingState();
}

class _DialogEnrollEmployeeTrainingState
    extends State<DialogEnrollEmployeeTraining> {
  var selectedEmployees = <Employee>[];
  List<Employee> people = [];
  bool loading = false;

  String? errorMessage;

  @override
  void initState() {
    var user = LocalDataRepository().user;
    var employees = context.read<UserCubit>().state.employees;

    var userSelected = employees.firstWhere((e) => e.id == user!.id);
    selectedEmployees.add(userSelected);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = widget.ctx.read<EnrollTrainingCubit>();

    TextStyle style3 = AppTextStyle.nunitoSans700.copyWith(fontSize: 20,fontWeight: FontWeight.normal);
    TextStyle style4 = AppTextStyle.nunitoSans700.copyWith(fontSize: 18);

    return Dialog(
      insetPadding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                    Text(
                      'Selecciona mínimo un (1) empleado para confirmar la asistencia.',
                      style: style3,
                      textAlign: TextAlign.center,
                    ),
                    if (((people.length +
                                selectedEmployees.length +
                                (widget.date.occupiedPlaces ?? 0)) >
                            (widget.date.places ?? 0)) &&
                        errorMessage == null) ...[
                      spacerM,
                      MsgError(
                          message:
                              'Se han terminado tus plazas contratadas (${widget.date.places}), si deseas contratar más comunícate con tu asesor comercial.'),
                    ],
                    if (errorMessage != null) ...[
                      spacerM,
                      MsgError(message: errorMessage!),
                    ],
                    spacerM,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          'Personas a inscribir (${selectedEmployees.length + people.length + (widget.date.occupiedPlaces ?? 0)}/${widget.date.places})',
                          style: style4),
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
                                                style: AppTextStyle.defaultStyle
                                                    .copyWith(
                                                        color: _isSelected
                                                            ? AppColor.neutral
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
                    .enrullFormation(
                  id: widget.date.dateId,
                  idsEmployees: selectedEmployees.map((e) => e.id!).toList(),
                  persons: people,
                )
                    .then((value) {
                  setState(() {
                    errorMessage = value!.messaje;
                    if (value.success) {
                      cubit.showEnrolled(widget.date);
                      Navigator.of(context).pop(true);
                    }
                    loading = false;
                  });
                });
              },
              text: 'Confirmar inscripciones',
              isLoading: loading,
              width: double.infinity,
              disabled: (people.length +
                          selectedEmployees.length +
                          (widget.date.occupiedPlaces ?? 0)) >
                      (widget.date.places ?? 0) ||
                  (selectedEmployees.isEmpty && people.isEmpty),
              //  disabled: selectedEmployees.isEmpty && people.isEmpty,
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
  }
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
                          Text(
                            'Completa la información de forma manual',
                            style: AppTextStyle.defaultStyle.copyWith(fontSize: 20),
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
                      person.email = email!.value;
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
    BuildContext context, Horario horario, Formation formation) {
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
                              TextSpan(
                                text: 'Hemos confirmado tu formación en',style: AppTextStyle.defaultStyle.copyWith(fontSize: 16)
                              ),
                              TextSpan(
                                text: ' ${formation.title ?? ''} ',
                                style: AppTextStyle.defaultStyle
                                    .copyWith(fontWeight: FontWeight.bold,fontSize: 16),
                              ),
                              TextSpan(
                                text: 'para el dia ',style: AppTextStyle.defaultStyle.copyWith(fontSize: 16)
                              ),
                              TextSpan(
                                text:
                                    '${DateFormat.MMMMd('es').format(horario.date!).toUpperCase()}.',
                                style: AppTextStyle.defaultStyle
                                    .copyWith(fontWeight: FontWeight.bold,fontSize: 16),
                              ),
                              TextSpan(
                                text:
                                    '\n\nTe notificaremos a ti y a los asistentes su inscripción al curso mediante notificación.',
                                  style: AppTextStyle.defaultStyle.copyWith(fontSize: 16)
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

class _ConfirmAssistance extends StatelessWidget {
  // const _ConfirmAssistance({
  //   super.key,
  // });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EnrollTrainingCubit>();
    return BlocBuilder<EnrollTrainingCubit, EnrollTrainingState>(
      builder: (context, state) {

        TextStyle style1 = AppTextStyle.nunitoSans700.copyWith(fontSize: 18,fontWeight: FontWeight.normal);
        TextStyle style2 = AppTextStyle.nunitoSans700.copyWith(fontSize: 20);
        TextStyle style3 = AppTextStyle.nunitoSans700.copyWith(fontSize: 18,fontWeight: FontWeight.normal);
        TextStyle style4 = AppTextStyle.nunitoSans700.copyWith(fontSize: 14,fontWeight: FontWeight.normal);

        String titleHorarios = state.horarioSelected!.hours.first.dateFormat ?? '';
        if(state.horarioSelected!.hours.length > 1){
          titleHorarios = '${state.horarioSelected!.hours.first.dateFormat ?? ''} a ${state.horarioSelected!.hours.last.dateFormat ?? ''}';
        }

        return Container(
          padding: const EdgeInsets.only(top: 2,bottom: 20,left: 30,right: 30),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: cubit.unseledtedHorario,
                  icon: Image.asset(
                    "assets/icons/Close.png",
                    scale: 2,
                  ),
                ),
              ),
              Text('Fechas:', style: style1),
              spacerXs,
              Text(titleHorarios, style: style2,),
              if (!state.horarios.first.allDay) ...[
                spacerS,
                Text('Horarios:',style:style1),
                spacerXs,
                ...state.horarios.first.hours.map((e){

                  String dateF = e.dateFormat ?? '';
                  if(dateF.length > 10){
                    dateF = '${dateF.substring(0,9)}..';
                  }

                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(flex: 2,child: Text(dateF,style: style3.copyWith(fontWeight: FontWeight.bold))),
                              Expanded(flex: 3,child: Text('${e.timeMorningFormat ?? ''} - ${e.endTimeMorningFormat ?? ''}',style: style3)),
                              Expanded(flex: 3,child: Text('${e.timeAfternoonFormat ?? ''} - ${e.endTimeAfternoonFormat ?? ''}',style: style3)),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(flex: 2,child: Container()),
                              Expanded(flex: 3,child: Text( (e.food ?? false) ? 'Incluye almuerzo' : '',style: style4)),
                              Expanded(flex: 3,child: Container()),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ],
              spacerXs,
              Text('Ubicación:',style: style1),
              spacerXs,
              Text(
                'Transcose Leganés - C/ Eduardo Torroja 11 28914 Leganés Madrid',
                style: style2,
              ),
              spacerM,
              const Text(
                "Confirme su asistencia a esta formación en el siguiente link, en la fecha y el horario detallado",
                style: AppTextStyle.defaultStyle,
                textAlign: TextAlign.center,
              ),
              spacerS,
              MyButton(
                onPressed: () {
                  _dialogConfirmSchedule(context, state.horarioSelected!,state.formation!).then((v) {
                    if (v ?? false) {
                      _dialogEnrollEmployee(context, state.horarioSelected!).then((v) {
                        if (v ?? false) {
                          _dialogCongratulations(context,state.horarioSelected!,state.formation!).then((_) {
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
        );
      },
    );
  }
}

class ColorsGuide extends StatelessWidget {
  const ColorsGuide({
    Key? key,
    required this.isCalendar,
  }) : super(key: key);

  final bool isCalendar;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Guía de colores", style: AppTextStyle.titleCard),
        if(isCalendar)...[
          legend(color: AppColor.primaryBlue, text: 'Día actual'),
          legend(color: AppColor.success500, text: 'En tu centro más cercano'),
          legend(color: AppColor.red, text: 'Otros centros'),
          legend(
              color: AppColor.success500,
              isSolid: true,
              text: 'Formación ya inscrita'),
        ]else...[
          legend(
              color: Colors.orange,
              isSolid: true,
              text: 'Incluye almuerzo'),
        ],
        spacerM,
      ],
    );
  }

  Widget legend(
      {required Color color, required String text, bool isSolid = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: isSolid ? color : null,
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 2)),
          ),
          spacerS,
          Text(
            text,
            style: AppTextStyle.defaultStyle,
          ),
        ],
      ),
    );
  }
}

class ResumenTraining extends StatelessWidget {
  const ResumenTraining(
    this.onPressed, {
    super.key,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnrollTrainingCubit, EnrollTrainingState>(
      builder: (context, state) {

        TextStyle style1 = AppTextStyle.nunitoSans700.copyWith(fontSize: 18,fontWeight: FontWeight.normal);
        TextStyle style2 = AppTextStyle.nunitoSans700.copyWith(fontSize: 20);
        TextStyle style3 = AppTextStyle.nunitoSans700.copyWith(fontSize: 18,fontWeight: FontWeight.normal);
        TextStyle style4 = AppTextStyle.nunitoSans700.copyWith(fontSize: 14,fontWeight: FontWeight.normal);

        String titleHorarios = state.horarios.first.dateFormat ?? '';
        if(state.horarios.length > 2){
          titleHorarios = '${state.horarios.first.dateFormat ?? ''} a ${state.horarios.last.dateFormat ?? ''}';
        }

        return SizedBox(
          // height: 340,
          width: double.infinity,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('Fechas:',style: style1),
                  spacerXs,
                  Text(titleHorarios, style: style2,),
                  if (!state.horarios.first.allDay) ...[
                    spacerS,
                    Text('Horarios:',style:style1),
                    spacerXs,
                    ...state.horarios.first.hours.map((e){

                      String dateF = e.dateFormat ?? '';
                      if(dateF.length > 10){
                        dateF = '${dateF.substring(0,9)}..';
                      }

                      return SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(flex: 2,child: Text(dateF,style: style3.copyWith(fontWeight: FontWeight.bold))),
                                  Expanded(flex: 3,child: Text('${e.timeMorningFormat ?? ''} - ${e.endTimeMorningFormat ?? ''}',style: style3)),
                                  Expanded(flex: 3,child: Text('${e.timeAfternoonFormat ?? ''} - ${e.endTimeAfternoonFormat ?? ''}',style: style3)),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(flex: 2,child: Container()),
                                  Expanded(flex: 3,child: Text( (e.food ?? false) ? 'Incluye almuerzo' : '',style: style4)),
                                  Expanded(flex: 3,child: Container()),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                  spacerS,
                  Text('Ubicación:',style: style1),
                  spacerXs,
                  Text(
                    state.horarios.first.location ?? '',
                    style: style2,
                  ),
                  spacerS,
                  const Text(
                    "Confirme su asistencia a esta formación en el siguiente link, en la fecha y el horario detallado",
                    style: AppTextStyle.defaultStyle,
                    textAlign: TextAlign.center,
                  ),
                  spacerS,
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
