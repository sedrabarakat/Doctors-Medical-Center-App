const baseServ = "http://192.168.1.4:8000/";
const baseUrl = "${baseServ}api/";
const auth = 'auth/';
const AppID_Agora = "53215bfd2c054ddc97c008da762ae819";
const AppKey_Back = '5eff8149aa24be769afc';

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

  static const declineCallEvent =
      '${baseUrl}online_guidance_registeration/declineCallEvent/'; //{channel_name}
  static const acceptCallEvent =
      '${baseUrl}online_guidance_registeration/acceptCallEvent/'; //{channel_name}

  static const getMyPatients = '${baseUrl}doctor/getMyPatients';
  static const getNextPatient = '${baseUrl}doctor/next';

  ///appointments
  static const getComingAppointment = '${baseUrl}doctor/coming';
  static const getArchiveAppointment = '${baseUrl}doctor/archive';

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

  ///**************************** Posts ****************************/
  static const getAllPosts = "${baseUrl}post";
  static const createPost = "${baseUrl}post/store";
  static const likePost = "${baseUrl}post/togglePost/";
  static const getCommentForPost = "${baseUrl}comments/on/post/";
  static const addComment = "${baseUrl}comments/on/post/store/";
}
