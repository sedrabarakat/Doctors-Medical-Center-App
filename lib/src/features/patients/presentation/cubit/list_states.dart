abstract class Patients_ListStates{}

class Init_State extends Patients_ListStates{}

class Loading_GetPatientsList_State extends Patients_ListStates{}
class Success_GetPatientsList_State extends Patients_ListStates{}
class Error_GetPatientsList_State   extends Patients_ListStates{}