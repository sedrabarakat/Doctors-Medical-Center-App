abstract class ScheduleStates{}


class InitialState extends ScheduleStates{}

class Loading_AddSchedule_State extends ScheduleStates{}
class Success_AddSchedule_State extends ScheduleStates{}
class Error_AddSchedule_State extends ScheduleStates{}

class Loading_GetSchedule_State extends ScheduleStates{}
class Success_GetSchedule_State extends ScheduleStates{}
class Error_GetSchedule_State extends ScheduleStates{}


class Loading_GetSpecificSchedule_State extends ScheduleStates{}
class Success_GetSpecificSchedule_State extends ScheduleStates{}
class Error_GetSpecificSchedule_State extends ScheduleStates{}

class Loading_sendCall_State extends ScheduleStates{}
class Success_sendCall_State extends ScheduleStates{}
class Error_sendCall_State extends ScheduleStates{}

class Loading_DeleteSpecificSchedule_State extends ScheduleStates{}
class Success_DeleteSpecificSchedule_State extends ScheduleStates{}
class Error_DeleteSpecificSchedule_State extends ScheduleStates{}