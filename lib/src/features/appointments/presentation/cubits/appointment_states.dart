abstract class AppointmentStates{}

class Init_States extends AppointmentStates{}


class Loading_GetComingAppointment_State extends AppointmentStates{}
class Success_GetComingAppointment_State extends AppointmentStates{}
class Error_GetComingAppointment_State   extends AppointmentStates{}



class Loading_GetArchiveAppointment_State extends AppointmentStates{}
class Success_GetArchiveAppointment_State extends AppointmentStates{}
class Error_GetArchiveAppointment_State   extends AppointmentStates{}