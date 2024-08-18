import 'package:doctor_app/core/data/models/doctor_profile_model.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/services/api_services.dart';
import '../../../../../core/domain/urls/app_url.dart';

class RemoteDoctorProfile{
  ApiServices _apiServices;

  RemoteDoctorProfile(this._apiServices);

  Future<BaseModel<DoctorProfileModel>> getProfile({required int id}) async {
    final response = await _apiServices.get("${AppUrl.getDoctorProfile}$id", queryParams: {'id':id.toString()});

    return BaseModel.fromJson(
        response, (json) => DoctorProfileModel.fromJson(json));
  }


}