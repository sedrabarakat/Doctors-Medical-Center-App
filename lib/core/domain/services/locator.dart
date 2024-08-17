import 'package:doctor_app/core/domain/services/api_services.dart';
import 'package:doctor_app/core/domain/services/api_services_impl.dart';
import 'package:doctor_app/core/helper/dio_helper.dart';
import 'package:doctor_app/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:doctor_app/src/features/auth/domain/repos/auth_repo.dart';
import 'package:doctor_app/src/features/home/data/data_sources/home_remote.dart';
import 'package:doctor_app/src/features/home/data/repo_impl/home_repo_impl.dart';
import 'package:doctor_app/src/features/home/domain/repos/home_repo.dart';
import 'package:doctor_app/src/features/online_consultation/data/remote/event_service.dart';
import 'package:doctor_app/src/features/online_consultation/data/repos/event_repo_imp.dart';
import 'package:doctor_app/src/features/online_consultation/data/repos/schedule_repo_imp.dart';
import 'package:doctor_app/src/features/online_consultation/domain/event_repo.dart';
import 'package:get_it/get_it.dart';

import '../../../src/features/online_consultation/data/remote/remote_schedule.dart';
import '../../../src/features/online_consultation/domain/schedule_repo.dart';

final getIt = GetIt.I;

Future locatorSetUp() async {
  getIt.registerLazySingleton<ApiServices>(
    () => ApiServicesImp(DioHelper().dio),
  );
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepo(getIt()),
  );

  getIt.registerLazySingleton<RemoteSchedule>(
          ()=>RemoteSchedule(getIt())
  );
  getIt.registerLazySingleton<ScheduleRepo>(
          ()=>ScheduleRepoImpl(getIt())
  );

  ///home
  getIt.registerLazySingleton<HomeRemote>(
          ()=>HomeRemote(getIt())
  );
  getIt.registerLazySingleton<HomeRepo>(
          ()=>HomeRepoImpl(getIt())
  );

  getIt.registerLazySingleton<EventService>(
          ()=>EventService(getIt())
  );
  getIt.registerLazySingleton<EventRepo>(
          ()=>EventRepoImp(getIt())
  );



}
