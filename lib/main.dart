import 'package:bloc/bloc.dart';
import 'package:doctor_app/core/cubit/bloc_observer.dart';
import 'package:doctor_app/core/domain/services/locator.dart';
import 'package:doctor_app/src/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/data/data_sources/local.dart';
import 'core/helper/token_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  await HiveService.initilized();

  await TokenHelper.init();

  await locatorSetUp();
  runApp(const DoctorApp());
}
