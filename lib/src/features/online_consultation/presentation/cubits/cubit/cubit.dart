import 'package:bloc/bloc.dart';
import 'package:doctor_app/core/data/data_sources/local.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:doctor_app/src/features/online_consultation/data/models/schedules_model.dart';
import 'package:doctor_app/src/features/online_consultation/data/models/specific_schedule.dart';
import 'package:doctor_app/src/features/online_consultation/presentation/cubits/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../data/models/registeraitions.dart';
import '../../../domain/schedule_repo.dart';
import '../agora/video_call_cubit.dart';

class ScheduleCubit extends Cubit<ScheduleStates> {
  ScheduleRepo scheduleRepo;

  ScheduleCubit(this.scheduleRepo) : super(InitialState());

  static ScheduleCubit get(context) => BlocProvider.of(context);

  var DateController = TextEditingController();
  var FromController = TextEditingController();
  var ToController = TextEditingController();

  Future<void> addSchedule(context) async {
    emit(Loading_AddSchedule_State());
    await scheduleRepo
        .addSpecificSchedule(
            date: DateController.text,
            fromTime: FromController.text,
            toTime: ToController.text)
        .then((value) {
      value.fold((error) {
        emit(Error_AddSchedule_State());
      }, (BaseModel) {
        getScheduleList(context);
        emit(Success_AddSchedule_State());
      });
    });
  }

  List<SchedulesModel> myDates = [];

  Future<void> getScheduleList(context) async {
    emit(Loading_GetSchedule_State());
    await HomeCubit.get(context).getDoctorInfo();
    if (HomeCubit.doctorModel != null) {
      await scheduleRepo
          .getScheduleList(doctor_id: HomeCubit.doctorModel!.id)
          .then((value) {
        value.fold((error) {
          print(error);
          emit(Error_GetSchedule_State());
        }, (List) {
          myDates = List;
          emit(Success_GetSchedule_State());
        });
      });
    }
  }

  var Schedule_id;

  void setSchedule_id({required int value}) {
    Schedule_id = value;
  }

  SpecificScheduleModel? specificScheduleModel;

  Future<void> getSpecificSchedule() async {
    emit(Loading_GetSpecificSchedule_State());
    await scheduleRepo
        .getSpecificSchedule(Schedule_id: Schedule_id)
        .then((value) {
      value.fold((error) {
        emit(Error_GetSpecificSchedule_State());
      }, (data) {
        specificScheduleModel = data;
        emit(Success_GetSpecificSchedule_State());
      });
    });
  }

  Future<void> deleteSpecificSchedule({required context}) async {
    emit(Loading_DeleteSpecificSchedule_State());
    await scheduleRepo
        .deleteSpecificSchedule(Schedule_id: Schedule_id)
        .then((value) {
      value.fold((error) {
        emit(Error_DeleteSpecificSchedule_State());
      }, (message) {
        getScheduleList(context);
        emit(Success_DeleteSpecificSchedule_State());
      });
    });
  }

  Future<void> sendCallEvent(
      {required RegisteraitionsModel registeration,
      required BuildContext context}) async {
    emit(Loading_sendCall_State());
    await scheduleRepo
        .sendCallEvent(registeration_id: registeration.id)
        .then((value) {
      value.fold((error) {
        emit(Error_sendCall_State());
      }, (message) {
        VideoCallCubit.get(context).initAgora(
            token: HiveService.Auth_Box!.get('Token'),
            channel: registeration.channel_name!,
            RemoteUid: registeration.patient.userId);
        context.go(AppRouter.kVideoCall);
        emit(Success_sendCall_State());
      });
    });
  }
}
