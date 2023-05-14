import 'package:intl/intl.dart';

class FunctionUtils {
  String getTimeStringFromDouble(double value) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(value.floor() * 1000);
    var newDate = date.subtract(const Duration(hours: 9));
    String formattedTime = DateFormat('HH:mm:ss').format(newDate);
    return formattedTime;
  }
}
