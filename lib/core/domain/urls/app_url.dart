const baseServ = "http://192.168.1.101:8000/";
const baseUrl = "${baseServ}api/";
const auth = 'auth/';
const AppID_Agora = "53215bfd2c054ddc97c008da762ae819";
const AppKey_Back = '5eff8149aa24be769afc';

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

  static const declineCallEvent = '${baseUrl}online_guidance_registeration/declineCallEvent/';//{channel_name}
  static const acceptCallEvent = '${baseUrl}online_guidance_registeration/acceptCallEvent/';//{channel_name}
}
