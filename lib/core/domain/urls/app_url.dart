const baseServ = "http://192.168.1.9:8000/";
const baseUrl = "${baseServ}api/";
const auth = 'auth/';

class AppUrl {
  static const requestCode = "$baseUrl${auth}request-code";
  static const verifyCode = "$baseUrl${auth}verify-code";
}
