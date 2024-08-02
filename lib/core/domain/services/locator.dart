import 'package:doctor_app/core/domain/services/api_services.dart';
import 'package:doctor_app/core/domain/services/api_services_impl.dart';
import 'package:doctor_app/core/helper/dio_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.I;

Future locatorSetUp() async {
  getIt.registerLazySingleton<ApiServices>(
    () => ApiServicesImp(DioHelper().dio),
  );
}
