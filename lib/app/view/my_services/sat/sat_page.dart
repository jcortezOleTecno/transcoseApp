import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:vemare/app/data/sat_repository.dart';
import 'package:vemare/app/domain/model/sat_forms.dart';
import 'package:vemare/app/domain/value_object/status.dart';
import 'package:vemare/app/view/_components/my_body/my_body.dart';
import 'package:vemare/app/view/_components/my_button/my_back_button.dart';
import 'package:vemare/app/view/_components/my_button/my_button.dart';
import 'package:vemare/app/view/_components/my_dropdown_button/my_drop_down_button.dart';
import 'package:vemare/app/view/_components/my_filters/my_filters.dart';
import 'package:vemare/app/view/_components/my_input/my_input.dart';
import 'package:vemare/app/view/_components/my_spacer/my_spacer.dart';
import 'package:vemare/app/view/_components/tap_to_hide_keyboard/tap_to_hide_keyboard.dart';
import 'package:vemare/app/view/theme/text_style.dart';
import 'package:vemare/app/view/theme/theme.dart';
import 'package:vemare/config/service_locator.dart';

import '../../_components/my_multi_radio_button/multi_radio_button.dart';
import 'bloc/sat_cubit.dart';
import 'bloc/sat_state.dart';

class SatPage extends StatelessWidget {
  const SatPage._();
  static const route = '/sat_page';

  static Widget create() {
    return BlocProvider(
      create: (context) => SatCubit(
        getIt.get<SatRepository>(),
      ),
      child: const SatPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SatCubit>();
    return MyTapToHideKeyboard(
      child: Scaffold(
        body: MyBody(
            child: BlocConsumer<SatCubit, SatState>(
          listener: (context, state) {
            if (state.status == FormStatus.done) {
              successMessage(context, state).then((value) => cubit.clearForm());
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyBackButton(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'SAT',
                          style: AppTextStyle.h1Style,
                        ),
                        Text(
                          '¡Te ayudamos!',
                          style: AppTextStyle.defaultStyle,
                        ),
                        // spacerM,
                        // const Text(
                        //   'Elige el área de ayuda',
                        //   style: AppTextStyle.inputLabelStyle,
                        // ),
                        // MyCustomDropdownButton<String>(
                        //     hint: 'EQUIPAMENTO',
                        //     buttonWidth: double.infinity,
                        //     hintStyle: AppTextStyle.inputStyle,
                        //     dropdownItems: state.forms
                        //         .map((item) => DropdownMenuItem(
                        //               value: item,
                        //               child: Text(item,
                        //                   overflow: TextOverflow.ellipsis,
                        //                   maxLines: 1,
                        //                   style: AppTextStyle.inputStyle),
                        //             ))
                        //         .toList(),
                        //     value: state.formSelect,
                        //     onChanged: cubit.formSelect),
                        // spacerS,

                        spacerS,
                        FormEquipamento(),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        )),
      ),
    );
  }

  Future<dynamic> successMessage(BuildContext context, SatState state) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
              spacerS,
              Text(
                state.fechaCita!,
                style: AppTextStyle.h1Style,
              ),
              spacerS,
              Text(
                state.franjaHoraria!,
                style: AppTextStyle.defaultStyle,
              ),
              spacerM,
              const Text(
                'Su solicitud ha quedado registrada. Confirmaremos tu cita lo antes posible, o te propondremos una nueva fecha',
                textAlign: TextAlign.center,
                style: AppTextStyle.defaultStyle,
              ),
              spacerM,
              MyButton(
                  width: double.infinity,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: 'Aceptar')
            ]),
          ),
        );
      },
    );
  }
}

class FormEquipamento extends StatefulWidget {
  const FormEquipamento({
    Key? key,
  }) : super(key: key);

  @override
  State<FormEquipamento> createState() => _FormEquipamentoState();
}

class _FormEquipamentoState extends State<FormEquipamento> {
  late TextEditingController tcmarca;
  late TextEditingController tcmodelo;
  late TextEditingController tcproducto;
  late TextEditingController tcnumeroSerie;
  late TextEditingController tctipoAveria;

  @override
  void initState() {
    tcmarca = TextEditingController();
    tcmodelo = TextEditingController();
    tcnumeroSerie = TextEditingController();
    tctipoAveria = TextEditingController();
    tcproducto = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    tcmarca.dispose();
    tcmodelo.dispose();
    tcnumeroSerie.dispose();
    tctipoAveria.dispose();
    tcproducto.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SatCubit>();
    return BlocBuilder<SatCubit, SatState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spacerM,
            const Text(
              'Elige el área de ayuda',
              style: AppTextStyle.inputLabelStyle,
            ),
            MyCustomDropdownButton<String>(
                hint: 'EQUIPAMENTO',
                buttonWidth: double.infinity,
                hintStyle: AppTextStyle.inputStyle,
                dropdownItems: state.forms
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(item,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: AppTextStyle.inputStyle),
                        ))
                    .toList(),
                value: state.formSelect,
                onChanged: (v) {
                  cubit.formSelect(v);
                  clearControllers();
                }),
            spacerS,
            const MyDivider(),
            if (!state.loading) ...[
              spacerS,
              if (state.formSelect == 'EQUIPAMENTO') ...[
                const Text('Tipo de máquina*',
                    style: AppTextStyle.inputLabelStyle),
                MyCustomDropdownButton<String>(
                  hint: 'Tipo de máquina',
                  buttonWidth: double.infinity,
                  hintStyle: AppTextStyle.inputStyle,
                  dropdownItems: state.tipoMaquinaValores
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: AppTextStyle.inputStyle),
                          ))
                      .toList(),
                  value: state.tipoMaquina,
                  onChanged: cubit.tipoMaquina,
                ),
                spacerM,
              ],
              if (state.formSelect != 'AD TALLER')
                MyInput(
                  label: 'Marca*',
                  hintText: 'Marca',
                  onChanged: cubit.marca,
                  controller: tcmarca,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  hasError: state.status == FormStatus.error,
                ),
              if (state.formSelect == 'EQUIPAMENTO')
                MyInput(
                  label: 'Modelo*',
                  hintText: 'Modelo',
                  controller: tcmodelo,
                  onChanged: cubit.modelo,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  hasError: state.status == FormStatus.error,
                ),
              if (state.formSelect == 'PINTURA')
                MyInput(
                  label: 'Producto*',
                  hintText: 'producto',
                  controller: tcmodelo,
                  onChanged: cubit.modelo,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  hasError: state.status == FormStatus.error,
                ),
              if (state.formSelect == 'EQUIPAMENTO')
                MyInput(
                  label: 'Número de serie*',
                  hintText: 'Número de serie',
                  onChanged: cubit.numeroSerie,
                  controller: tcnumeroSerie,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  hasError: state.status == FormStatus.error,
                ),
              MyInput(
                label: 'Tipo averia',
                required: true,
                maxLines: 6,
                textInputAction: TextInputAction.newline,
                controller: tctipoAveria,
                onChanged: cubit.tipoAveria,
                inputType: TextInputType.multiline,
                hasError: state.status == FormStatus.error,
              ),
              const Text('Tipo de incidencia*',
                  style: AppTextStyle.inputLabelStyle),
              StringRadioButtons(
                reset: state.status == FormStatus.done,
                options: state
                        .dataForms[state.formSelect == 'EQUIPAMENTO'
                            ? 0
                            : state.formSelect == 'PINTURA'
                                ? 1
                                : 2]
                        .datosFormulario
                        ?.tipoAveria
                        ?.valores ??
                    [],
                onSelectionChanged: cubit.tipoIncidencia,
              ),
              spacerS,
              MyInput(
                label: 'Código cliente*',
                hintText: 'Código cliente',
                onChanged: cubit.codigoCliente,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                hasError: state.status == FormStatus.error,
                initialValue: state.codCliente?.value ?? '',
                enabled: false,
              ),
              MyInput(
                label: 'Razón social*',
                hintText: 'Razón social',
                onChanged: cubit.razonSocial,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                hasError: state.status == FormStatus.error,
                initialValue: state.razonSocial?.value ?? '',
              ),
              MyInput(
                label: 'Población*',
                hintText: 'Población',
                onChanged: cubit.poblacion,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                hasError: state.status == FormStatus.error,
                initialValue: state.poblacion?.value ?? '',
              ),
              MyInput(
                label: 'Persona*',
                hintText: 'Persona',
                onChanged: cubit.persona,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                hasError: state.status == FormStatus.error,
                initialValue: state.persona?.value ?? '',
              ),
              MyInput(
                label: 'Teléfono*',
                hintText: 'Teléfono',
                onChanged: cubit.telefono,
                textInputAction: TextInputAction.next,
                inputType: TextInputType.phone,
                hasError: state.status == FormStatus.error,
                initialValue: state.telefono?.value ?? '',
              ),
              MyInput(
                label: 'Email*',
                hintText: 'Email',
                onChanged: cubit.email,
                textInputAction: TextInputAction.next,
                inputType: TextInputType.emailAddress,
                hasError: state.status == FormStatus.error,
                initialValue: state.email?.value ?? '',
              ),
              const Text('Cuando le gustaría que le visitaramos?*',
                  style: AppTextStyle.inputLabelStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ButtonFilter(
                    text: state.fechaCita == null
                        ? 'Cuando le gustaría que le visitaramos?'
                        : state.fechaCita!,
                    onPressed: () async {
                      FocusScope.of(context).requestFocus(FocusNode());

                      showRoundedDatePicker(
                        context: context,
                        initialDate:
                            DateTime.now().add(const Duration(days: 2)),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 1),
                        locale: const Locale('es', 'ES'),
                        height: 340,
                        borderRadius: 16,
                        theme: AppTheme.light,
                        listDateDisabled: [...state.diasOcupados],
                        selectableDayPredicate: (DateTime day) {
                          return !(day.weekday == DateTime.saturday ||
                              day.weekday == DateTime.sunday);
                        },
                      ).then((date) {
                        if (date != null) {
                          cubit.fechaCita(DateFormat.yMd('es').format(date));
                        }
                      });
                    },
                    textColor: state.fechaCita == null
                        ? Colors.grey[600]!
                        : Colors.black,
                  ),
                ],
              ),
              spacerS,
              const Text('En que franja horaria?*',
                  style: AppTextStyle.inputLabelStyle),
              StringRadioButtons(
                reset: state.status == FormStatus.done,
                options: state
                        .dataForms[state.formSelect == 'EQUIPAMENTO'
                            ? 0
                            : state.formSelect == 'PINTURA'
                                ? 1
                                : 2]
                        .datosFormulario
                        ?.franjaHoraria
                        ?.valores ??
                    [],
                onSelectionChanged: cubit.franjaHoraria,
              ),
              spacerS,
              MyButton(
                onPressed: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  await cubit.sendFormEquipamento();
                  clearControllers();
                },
                text: 'Enviar',
                isLoading: state.status == FormStatus.loading,
                width: double.infinity,
                disabled: !disabledButton(state),
              ),
              spacerM,
            ],
          ],
        );
      },
    );
  }

  void clearControllers() {
    setState(() {
      tcmarca.clear();
      tcmodelo.clear();
      tcnumeroSerie.clear();
      tctipoAveria.clear();
    });
  }

  bool disabledButton(SatState state) {
    switch (state.formSelect) {
      case 'EQUIPAMENTO':
        return state.equipamentoComplete;
      case 'PINTURA':
        return state.pinturaComplete;
      case 'AD TALLER':
        return state.tallerComplete;

      default:
        return false;
    }
  }
}

class SelectInput extends StatefulWidget {
  const SelectInput(
    this.input, {
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  final SatInput input;
  final Function(String?) onChanged;

  @override
  State<SelectInput> createState() => _SelectInputState();
}

class _SelectInputState extends State<SelectInput> {
  String? value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.input.label ?? '',
          style: AppTextStyle.inputLabelStyle,
        ),
        MyCustomDropdownButton<String>(
            hint: widget.input.label ?? '',
            buttonWidth: double.infinity,
            hintStyle: AppTextStyle.inputStyle,
            dropdownItems: widget.input.valores!
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Text(item,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTextStyle.inputStyle),
                  ),
                )
                .toList(),
            value: value,
            onChanged: (v) {
              setState(() {
                value = v;
              });
              widget.onChanged(v);
            }),
        spacerS,
      ],
    );
  }
}
