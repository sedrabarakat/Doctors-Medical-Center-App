const baseServ = "http://192.168.1.7:8000/";
const baseUrl = "${baseServ}api/";
const auth = 'auth/';

class AppUrl {
  ///**************************** Auth ****************************/
  static const requestCode = "$baseUrl${auth}request-code";
  static const verifyCode = "$baseUrl${auth}verify-code";
  static const signUp = "${baseUrl}register/doctor";

  ///**************************** Doctor ****************************/
  static const getDoctorInfo = "${baseUrl}doctor/me";

  ///**************************** Online Consulting ****************************/
  static const displayOnlineSchedule = "${baseUrl}online_guidance_schedule/";
  static const displaySpecificSchedule =
      "${baseUrl}online_guidance_schedule/"; //{online_guidance}
  static const deleteSpecificSchedule =
      "${baseUrl}online_guidance_schedule/"; //{online_guidance}
  static const addOnlineSchedule = "${baseUrl}online_guidance_schedule/store";
  static const updateOnlineSchedule =
      "${baseUrl}online_guidance_schedule/"; //{online_guidance}/update
  static const sendCallEvent =
      '${baseUrl}online_guidance_registeration/call/'; //{registeration}
  ///**************************** Patient ****************************/
  static const patientList = "${baseUrl}dashboard/patient";
  static const getPatientSession = "${baseUrl}dashboard/session/sessions/";
  static const getSession = "${baseUrl}dashboard/session/";
  static const getServices = '${baseUrl}dashboard/service';
  static const addSessionDetails = "${baseUrl}dashboard/session/";
  static const getSessionDetailsInformation =
      "${baseUrl}dashboard/session/details/";
  static const uploadFileIntoSessionDetails =
      "${baseUrl}dashboard/session/details/";
  static const getDoctorInformation = "${baseUrl}dashboard/doctor/";
  static const downloadFile = "${baseServ}storage/";
}
