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
}
