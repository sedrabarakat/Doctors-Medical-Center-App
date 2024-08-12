const baseServ = "http://192.168.1.4:8000/";
const baseUrl = "${baseServ}api/";
const auth = 'auth/';

class AppUrl {
  static const requestCode = "$baseUrl${auth}request-code";
  static const verifyCode = "$baseUrl${auth}verify-code";
  static const signUp = "${baseUrl}register/doctor";

  static const getDoctorInfo="${baseUrl}doctor/me";

  static const displayOnlineSchedule="${baseUrl}online_guidance_schedule/";
  static const displaySpecificSchedule="${baseUrl}online_guidance_schedule/";//{online_guidance}
  static const deleteSpecificSchedule="${baseUrl}online_guidance_schedule/";//{online_guidance}
  static const addOnlineSchedule="${baseUrl}online_guidance_schedule/store";
  static const updateOnlineSchedule="${baseUrl}online_guidance_schedule/";//{online_guidance}/update
  static const sendCallEvent='${baseUrl}online_guidance_registeration/call/';//{registeration}
}
