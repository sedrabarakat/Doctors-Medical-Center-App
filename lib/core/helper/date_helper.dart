import 'package:intl/intl.dart';

class DateHelper{

  static String dateFormat({
   required DateTime date
}){
    String formatteddate=DateFormat('yyyy-MM-dd').format(date);
    return formatteddate;
  }
}