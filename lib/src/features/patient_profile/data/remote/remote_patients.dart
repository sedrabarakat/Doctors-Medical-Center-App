import 'package:doctor_app/core/domain/services/api_services.dart';
import 'package:doctor_app/core/domain/urls/app_url.dart';

import '../../../../../core/data/models/base_model.dart';

class remotePatients{
  
  ApiServices apiServices;

  remotePatients(this.apiServices);
  
  Future<BaseModel>getMyPatient()async{
    final response= await apiServices.get(AppUrl.getMyPatients);

    return BaseModel(data: response['data'], message: response['message']);
  }
  
  
}