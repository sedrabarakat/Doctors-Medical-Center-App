import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/domain/services/api_services.dart';
import 'package:doctor_app/src/features/online_consultation/data/remote/event_service.dart';
import '../../../../../core/data/models/base_model.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../domain/event_repo.dart';

class EventRepoImp extends EventRepo{
  EventService eventService;

  EventRepoImp(this.eventService);

  @override
  Future<Either<NetworkExceptions, String>> AcceptCall(
      {required String channelName,
      }) async {
    try {
      BaseModel baseModel = await eventService.AccepteCall(channelName: channelName);
      return right(baseModel.message);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  @override
  Future<Either<NetworkExceptions, String>> DeclineCall(
      {required String channelName,
      }) async {
    try {
      BaseModel baseModel = await eventService.DeclineCall(channelName: channelName);
      return right(baseModel.message);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }



}