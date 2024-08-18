import 'package:doctor_app/core/domain/services/api_services.dart';
import 'package:doctor_app/core/domain/urls/app_url.dart';

import '../../../../../core/data/models/base_model.dart';

class HomeRemote{
  ApiServices apiServices;

  HomeRemote(this.apiServices);

  Future<BaseModel>getDoctorInfo()async{
    final Response = await apiServices.get(AppUrl.getDoctorInfo);
    return BaseModel(data: Response['data'],);
  }

  Future<BaseModel>getComingAppointment()async{
    final Response = await apiServices.get(AppUrl.getComingAppointment);
    return BaseModel(data: Response['data']);
  }

  Future<BaseModel>getNextPatient()async{
    final Response = await apiServices.get(AppUrl.getNextPatient);
    return BaseModel(data: Response['data']);
  }

  Future<BaseModel>getMyPatient({
    required String search
})async{
    final response= await apiServices.get(AppUrl.getMyPatients,
      queryParams: {
      'search':search
      }
    );

    return BaseModel(data: response['data'], message: response['message']);
  }

}