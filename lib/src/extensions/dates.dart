import 'package:intl/intl.dart';

final DateFormat ddMMyyyy = DateFormat('dd/MM/yyyy');

extension DateSupport on DateTime {
  /// format DateTime to 'dd/MM/yyyy' format
  String get formatDDMMYYY {
    return ddMMyyyy.format(this);
  }
}
