import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  static final DateFormat _yMMMd = DateFormat.yMMMd();

  String get yMMMd => _yMMMd.format(this);
}