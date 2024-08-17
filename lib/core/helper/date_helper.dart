import 'package:intl/intl.dart';

class DateHelper {
  static String dateFormat({required DateTime date}) {
    String formatteddate = DateFormat('yyyy-MM-dd').format(date);
    return formatteddate;
  }

  static List<String> timeStampToLocal(int timeStamp) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000).toUtc();
    String formattedTime = DateFormat('h:mm a').format(dateTime.toLocal());
    List<String> timeComponents = formattedTime.split(':');
    timeComponents.insertAll(1, timeComponents[1].split(' '));
    timeComponents.removeLast();
    return timeComponents;
  }
}
