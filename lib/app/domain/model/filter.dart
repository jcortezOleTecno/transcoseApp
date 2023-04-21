class Filter {
  final DateTime? startDate;
  final DateTime? endDate;
  final String? month;
  final String? year;
  final int? quarter;

  Filter(
    this.startDate,
    this.endDate,
    this.month,
    this.year,
    this.quarter,
  );

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
      };
}
