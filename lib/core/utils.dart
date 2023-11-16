import 'package:intl/intl.dart';

int getCurrentYear() {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);
  print(formatted.split("-")[0]);
  return int.parse(formatted.split("-")[0]);
}
