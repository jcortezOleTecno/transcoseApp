import 'package:money_formatter/money_formatter.dart';

final fmf = MoneyFormatter(
  amount: 12345678.9012345,
  settings: MoneyFormatterSettings(
    symbol: '€',
    thousandSeparator: '.',
    decimalSeparator: ',',
    symbolAndNumberSeparator: ' ',
    fractionDigits: 2,
    compactFormatType: CompactFormatType.short,
  ),
);

String myFormatMoney(double value) {
  return fmf.copyWith(amount: value).output.symbolOnRight;
}
