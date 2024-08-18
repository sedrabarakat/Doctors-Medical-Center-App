import 'package:doctor_app/core/domain/services/api_services.dart';

import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/urls/app_url.dart';

class EventService{

   ApiServices apiServices;

   EventService(this.apiServices);


  Future<BaseModel>AccepteCall({
    required String channelName
  })async{
    final Response= await apiServices.post("${AppUrl.acceptCallEvent}$channelName");

    return BaseModel(data: Response['data'],message: Response['message']);
  }

  Future<BaseModel>DeclineCall({
    required String channelName
  })async{
    final Response= await apiServices.post("${AppUrl.declineCallEvent}$channelName");

    return BaseModel(data: Response['data'],message: Response['message']);
  }








}