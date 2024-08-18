import 'package:doctor_app/core/domain/services/api_services.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/urls/app_url.dart';

class AppointmentRemote{
  ApiServices apiServices;

  AppointmentRemote(this.apiServices);


  Future<BaseModel>getComingAppointment()async{
    final Response = await apiServices.get(AppUrl.getComingAppointment);
    return BaseModel(data: Response['data']);
  }

  Future<BaseModel>getArchiveAppointment()async{
    final Response = await apiServices.get(AppUrl.getArchiveAppointment);
    return BaseModel(data: Response['data']);
  }


}