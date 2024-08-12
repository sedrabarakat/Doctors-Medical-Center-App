import 'package:doctor_app/core/data/data_sources/local.dart';

class TokenHelper{
  static bool hasToken = false;
  static Future<void> init() async {
    String? token =  HiveService.Auth_Box!.get('Token');
    hasToken = token != null;
  }
}