class Filter {
  final DateTime? startDate;
  final DateTime? endDate;
  final String? month;
  final String? year;
  final int? quarter;
  final String? status;
  final String? statusTram;
  final String? statusSust;

  Filter({
    this.startDate,
    this.endDate,
    this.month,
    this.year,
    this.quarter,
    this.status,
    this.statusTram,
    this.statusSust,
  });

  Map<String, dynamic> toJson() => {
    "start_date": startDate != null
        ? '${startDate?.month}/${startDate?.day}/${startDate?.year}'
        : '',
    "end_date": endDate != null
        ? '${endDate?.month}/${endDate?.day}/${endDate?.year}'
        : '',
    "mes": month ?? '',
    "anio": year ?? '',
    "trimestre": quarter?.toString() ?? '',
    "estado": status ?? '',
    "estado_tramitacion": statusTram ?? '',
    "estado_sustitucion": statusSust ?? '',
  };

  List<String> quantityFilter(){
    List<String> result = [];

    if(startDate != null) result.add('start_date');
    if(endDate != null) result.add('end_date');
    if(month != null && month!.isNotEmpty) result.add('mes');
    if(year != null && year!.isNotEmpty) result.add('anio');
    if(quarter != null) result.add('trimestre');
    if(status != null && status!.isNotEmpty) result.add('estado');
    if(statusTram != null && statusTram!.isNotEmpty) result.add('estado_tramitacion');
    if(statusSust != null && statusSust!.isNotEmpty) result.add('estado_sustitucion');

    return result;
  }
}

class FilterReturns {
  DateTime? startDate;
  DateTime? endDate;
  String? estado;
  String? situacion;
  String? referencia;
  String? mes;
  String? anio;
  int? quarter;

  FilterReturns({
    this.startDate,
    this.endDate,
    this.estado,
    this.situacion,
    this.referencia,
    this.mes,
    this.anio,
    this.quarter,
  });

  Map<String, dynamic> toJson() => {
    "start_date": startDate != null ? '${startDate?.year}-${startDate?.month}-${startDate?.day}' : '',
    "end_date": endDate != null ? '${endDate?.year}-${endDate?.month}-${endDate?.day}' : '',
    "estado": estado ?? '',
    "situacion": situacion ?? '',
    "trimestre": quarter?.toString() ?? '',
    "referencia": referencia?.toString() ?? '',
    "mes": mes ?? '',
    "anio": anio ?? '',
  };

  Map<String, dynamic> toJsonName() => {
    "start_date": startDate != null ? '${startDate?.day}/${startDate?.month}/${startDate?.year}' : '',
    "end_date": endDate != null ? '${endDate?.day}/${endDate?.month}/${endDate?.year}' : '',
    "estado": estado ?? '',
    "situacion": situacion ?? '',
    "trimestre": quarter?.toString() ?? '',
    "referencia": referencia?.toString() ?? '',
    "mes": mes ?? '',
    "anio": anio ?? '',
  };

  List<String> quantityFilter(){
    List<String> result = [];

    if(startDate != null && endDate != null){
      result.add('Fecha desde hasta');
    }else if(startDate != null){
      result.add('Fecha desde');
    }else if(endDate != null){
      result.add('Fecha hasta');
    }
    if(mes != null && mes!.isNotEmpty) result.add('Por Mes');
    if(anio != null && anio!.isNotEmpty) result.add('Por año');
    if(quarter != null) result.add('Por trimestre');
    if(estado != null && estado!.isNotEmpty) result.add('Por estado');
    if(referencia != null && referencia!.isNotEmpty) result.add('Por referencia');
    if(situacion != null && situacion!.isNotEmpty) result.add('Por situación');

    return result;
  }
}

class FilterReturnsNew {
  DateTime? startDate;
  DateTime? endDate;
  String? albaran;
  String? referencia;
  String? mes;
  String? anio;
  int? quarter;

  FilterReturnsNew({
    this.startDate,
    this.endDate,
    this.mes,
    this.anio,
    this.quarter,
    this.albaran,
    this.referencia,
  });

  Map<String, dynamic> toJson() => {
    "start_date": startDate != null ? '${startDate?.month}/${startDate?.day}/${startDate?.year}' : '',
    "end_date": endDate != null ? '${endDate?.month}/${endDate?.day}/${endDate?.year}' : '',
    "albaran": albaran ?? '',
    "trimestre": quarter?.toString() ?? '',
    "referencia": referencia?.toString() ?? '',
    "mes": mes ?? '',
    "anio": anio ?? '',
  };

  Map<String, dynamic> toJsonName() => {
    "start_date": startDate != null ? '${startDate?.month}/${startDate?.day}/${startDate?.year}' : '',
    "end_date": endDate != null ? '${endDate?.month}/${endDate?.day}/${endDate?.year}' : '',
    "albaran": albaran ?? '',
    "trimestre": quarter?.toString() ?? '',
    "referencia": referencia?.toString() ?? '',
    "mes": mes ?? '',
    "anio": anio ?? '',
  };

  List<String> quantityFilter(){
    List<String> result = [];

    if(startDate != null && endDate != null){
      result.add('Fecha desde hasta');
    }else if(startDate != null){
      result.add('Fecha desde');
    }else if(endDate != null){
      result.add('Fecha hasta');
    }
    if(mes != null && mes!.isNotEmpty) result.add('Por Mes');
    if(anio != null && anio!.isNotEmpty) result.add('Por año');
    if(quarter != null) result.add('Por trimestre');
    if(albaran != null && albaran!.isNotEmpty) result.add('Por albaran');
    if(referencia != null && referencia!.isNotEmpty) result.add('Por referencia');

    return result;
  }
}