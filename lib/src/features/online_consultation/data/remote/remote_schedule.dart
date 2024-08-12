import 'package:doctor_app/core/domain/services/api_services.dart';
import 'package:doctor_app/core/domain/urls/app_url.dart';
import '../../../../../core/data/models/base_model.dart';

class RemoteSchedule {
  ApiServices apiServices;

  RemoteSchedule(this.apiServices);

  Future<BaseModel> getScheduleList({
    required int doctor_id
}) async {

    final Response = await apiServices.get(
        AppUrl.displayOnlineSchedule,
          queryParams: {
        "doctor_id":"$doctor_id"
    }
   );

    return BaseModel(data: Response['data'], message: Response['message']);
  }

  Future<BaseModel> getSpecificSchedule({required int Schedule_id}) async {
    final Response =
        await apiServices.get("${AppUrl.displaySpecificSchedule}$Schedule_id");

    return BaseModel(data: Response['data'], message: Response['message']);
  }

  Future<BaseModel> updateSpecificSchedule(
      {required int Schedule_id,
      required String date,
      required String fromTime,
      required String toTime}) async {
    final Response = await apiServices
        .put("${AppUrl.displaySpecificSchedule}$Schedule_id/update", body: {
      "date": date,
      "from_min": fromTime,
      "to_min": toTime
    });

    return BaseModel(data: Response['data'], message: Response['message']);
  }

  Future<BaseModel> deleteSpecificSchedule({required int Schedule_id}) async {
    final Response = await apiServices
        .delete("${AppUrl.displaySpecificSchedule}$Schedule_id",
    );

    return BaseModel(data: Response['data'], message: Response['message']);
  }

  Future<BaseModel> addSpecificSchedule(
      {required String date,
      required String fromTime,
      required String toTime}) async {
    final Response = await apiServices.post(AppUrl.addOnlineSchedule,
        body: {"date": date, "from_min": fromTime, "to_min": toTime});
    return BaseModel(message: Response['message'], data: null);
  }

  Future<BaseModel> sendCallEvent({
    required registeration_id
})async{
    final Response= await apiServices.post(
      "${AppUrl.sendCallEvent}$registeration_id"
    );
    return BaseModel(message: Response['message'], data: null);
  }
}
