import 'package:bloc/bloc.dart';
import 'package:vemare/app/data/local_data_repository.dart';
import 'package:vemare/app/data/sat_repository.dart';
import 'package:vemare/app/domain/model/sat_forms.dart';
import 'package:vemare/app/domain/value_object/email.dart';
import 'package:vemare/app/domain/value_object/name.dart';
import 'package:vemare/app/domain/value_object/phone.dart';
import 'package:vemare/app/domain/value_object/status.dart';

import 'sat_state.dart';

class SatCubit extends Cubit<SatState> {
  SatCubit(this._satRepository)
      : super(
          SatState(
            forms: ['EQUIPAMENTO', 'PINTURA', 'AD TALLER'],
            formSelect: 'EQUIPAMENTO',
            codCliente: LocalDataRepository().isLogged
                ? Name(LocalDataRepository().user!.code!)
                : null,
            razonSocial: LocalDataRepository().isLogged
                ? Name(LocalDataRepository().user?.name ?? '')
                : null,
            telefono: LocalDataRepository().isLogged
                ? Phone(LocalDataRepository().user?.phone ?? '')
                : null,
            email: LocalDataRepository().isLogged
                ? Email(LocalDataRepository().user?.email ?? '')
                : null,
            persona: LocalDataRepository().isLogged
                ? Name(LocalDataRepository().user?.responsibleName ?? '')
                : null,
            poblacion: LocalDataRepository().isLogged
                ? Name(LocalDataRepository().user?.city ?? '')
                : null,
            cif: LocalDataRepository().isLogged
                ? Name(LocalDataRepository().user?.webservice?.cif ?? '')
                : null,
          ),
        ) {
    getForm();
  }

  final SatRepository _satRepository;

  Future<void> getForm() async {
    emit(state.copyWith(loading: true));

    List<SatForms> data = [];
    List<String> diasOcupados = [];
    List<DateTime> fechas = [];
    // await Future.wait([
    await _satRepository.getSatForms().then(data.addAll);
    if (LocalDataRepository().isLogged) {
      await _satRepository.diasOcupados().then(diasOcupados.addAll);
      // ]);
      for (var e in diasOcupados) {
        List<String> fechaSplit = e.split('/');
        DateTime fecha = DateTime(
          int.parse(fechaSplit[2]), // año
          int.parse(fechaSplit[1]), // mes
          int.parse(fechaSplit[0]), // día
        );
        fechas.add(fecha);
      }
    }
    emit(state.copyWith(
      dataForms: data,
      diasOcupados: fechas,
      tipoMaquinaValores: data[0].datosFormulario?.tipoMaquina?.valores ?? [],
      loading: false,
    ));
  }

  void formSelect(String? value) {
    emit(state.copyWith(
      formSelect: value,
      fechaCita: null,
      franjaHoraria: null,
      marca: null,
      modelo: null,
      producto: null,
      numeroSerie: null,
      tipoAveria: null,
      tipoIncidencia: null,
      tipoMaquina: null,
      status: FormStatus.editing,
    ));
  }

  void tipoMaquina(String? value) {
    emit(state.copyWith(
      tipoMaquina: value,
      status: FormStatus.editing,
    ));
  }

  void marca(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          marca: Name(value.trim()),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          marca: null,
        ),
      );
    }
  }

  void modelo(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          modelo: Name(value.trim()),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          modelo: null,
        ),
      );
    }
  }

  void producto(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          producto: Name(value.trim()),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          producto: null,
        ),
      );
    }
  }

  void numeroSerie(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          numeroSerie: Name(value.trim()),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          numeroSerie: null,
        ),
      );
    }
  }

  void tipoAveria(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          tipoAveria: Name(value.trim()),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          tipoAveria: null,
        ),
      );
    }
  }

  void tipoIncidencia(String? value) {
    emit(state.copyWith(
      tipoIncidencia: value,
      status: FormStatus.editing,
    ));
  }

  void codigoCliente(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          codCliente: Name(value.trim()),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          codCliente: null,
        ),
      );
    }
  }

  void razonSocial(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          razonSocial: Name(value.trim()),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          razonSocial: null,
        ),
      );
    }
  }

  void cif(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          cif: Name(value.trim()),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          cif: null,
        ),
      );
    }
  }

  void poblacion(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          poblacion: Name(value.trim()),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          poblacion: null,
        ),
      );
    }
  }

  void persona(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          persona: Name(value.trim()),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          persona: null,
        ),
      );
    }
  }

  void telefono(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          telefono: Phone(value.trim()),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          telefono: null,
        ),
      );
    }
  }

  void email(String value) {
    try {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          email: Email(value.trim()),
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormStatus.editing,
          email: null,
        ),
      );
    }
  }

  void fechaCita(String? value) {
    emit(state.copyWith(
      fechaCita: value,
      status: FormStatus.editing,
    ));
  }

  void franjaHoraria(String? value) {
    emit(state.copyWith(
      franjaHoraria: value,
      status: FormStatus.editing,
    ));
  }

  Future<void> sendFormEquipamento() async {
    emit(state.copyWith(status: FormStatus.loading));
    try {
      final data = {
        "area": state.formSelect == 'AD TALLER' ? 'TI' : state.formSelect ?? '',
        "tipo_maquina": state.tipoMaquina ?? '',
        "marca": state.marca?.value ?? '',
        "modelo": state.modelo?.value ?? '',
        "numero_serie": state.numeroSerie?.value ?? '',
        "resumen_averia": state.tipoAveria?.value ?? '',
        "tipo_averia": state.tipoIncidencia ?? '',
        //datos fijos
        "cod_cliente": state.codCliente?.value,
        "razon_social": state.razonSocial?.value,
        "cif": state.formSelect == 'AD TALLER' ? state.cif?.value ?? '' : '',
        "poblacion": state.poblacion?.value,
        "persona": state.persona?.value,
        "telefono": state.telefono?.value,
        "email": state.email?.value,
        "fecha_cita": state.fechaCita ?? '',
        "franja_horaria": state.franjaHoraria ?? '',
      };
      await _satRepository.sendSatForms(data);

      emit(state.copyWith(status: FormStatus.done));
    } catch (e) {
      print('ERROR $e');
      emit(state.copyWith(status: FormStatus.error));
    }
  }

  void clearForm() {
    emit(state.copyWith(
      fechaCita: null,
      franjaHoraria: null,
      marca: null,
      modelo: null,
      producto: null,
      numeroSerie: null,
      tipoAveria: null,
      tipoIncidencia: null,
      tipoMaquina: null,
      status: FormStatus.editing,
    ));
  }
}
