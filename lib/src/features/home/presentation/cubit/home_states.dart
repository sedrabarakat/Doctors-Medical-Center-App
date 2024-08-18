abstract class HomeStates{}

class HomeInitiateState extends HomeStates{}

class Loading_GetDoctorInfo_State extends HomeStates{}
class Success_GetDoctorInfo_State extends HomeStates{}
class Error_GetDoctorInfo_State   extends HomeStates{}


class Loading_GetComingAppointment_State extends HomeStates{}
class Success_GetComingAppointment_State extends HomeStates{}
class Error_GetComingAppointment_State   extends HomeStates{}


class Loading_GetNextPatient_State extends HomeStates{}
class Success_GetNextPatient_State extends HomeStates{}
class Error_GetNextPatientt_State   extends HomeStates{}

class Loading_GetPatientsList_State extends HomeStates{}
class Success_GetPatientsList_State extends HomeStates{}
class Error_GetPatientsList_State   extends HomeStates{}

class Toggle_IsList   extends HomeStates{}