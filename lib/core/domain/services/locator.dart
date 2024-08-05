import 'package:doctor_app/core/domain/services/api_services.dart';
import 'package:doctor_app/core/domain/services/api_services_impl.dart';
import 'package:doctor_app/core/helper/dio_helper.dart';
import 'package:doctor_app/src/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:doctor_app/src/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

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
}
