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

}