import 'package:dartz/dartz.dart';

import '../../../../core/domain/error_handler/network_exceptions.dart';

abstract class EventRepo{


  Future<Either<NetworkExceptions, String>> AcceptCall(
      {required String channelName,
      });

  Future<Either<NetworkExceptions, String>> DeclineCall(
      {required String channelName,
      });



}