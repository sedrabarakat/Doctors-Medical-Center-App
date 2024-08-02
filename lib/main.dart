import 'package:bloc/bloc.dart';
import 'package:doctor_app/core/cubit/bloc_observer.dart';
import 'package:doctor_app/core/domain/services/locator.dart';
import 'package:doctor_app/src/app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await locatorSetUp();
  runApp(const DoctorApp());
}
