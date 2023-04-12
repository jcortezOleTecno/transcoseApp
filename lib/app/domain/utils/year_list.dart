final yearsList = <String>[
  DateTime.now().year.toString(),
  DateTime.now().subtract(const Duration(days: 365)).year.toString(),
  DateTime.now().subtract(const Duration(days: 365 * 2)).year.toString(),
];
