import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:doctor_app/core/domain/error_handler/network_exceptions.dart';
import 'package:doctor_app/core/helper/image_helper.dart';
import 'package:doctor_app/src/features/auth/data/model/user_model.dart';
import 'package:doctor_app/src/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_state_button/progress_button.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _repo;
  AuthCubit(this._repo) : super(AuthInitialState());
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController signUpPhoneNumberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController sessionDurationController = TextEditingController();
  TextEditingController daysInAdvanceController = TextEditingController();
  File? pickedProfileImage;
  ButtonState loginButtonState = ButtonState.idle;
  ButtonState verifyButtonState = ButtonState.idle;
  Map<String, dynamic> days = {
    "Sunday": <FromToController>[FromToController()],
    'Monday': <FromToController>[FromToController()],
    'Tuesday': <FromToController>[FromToController()],
    'Wednesday': <FromToController>[FromToController()],
    'Thursday': <FromToController>[FromToController()],
    'Firday': <FromToController>[FromToController()],
    'Saturday': <FromToController>[FromToController()],
  };

  String code = "";
  int numberOfSuccessResend = -1;
  int waitSeconds = 10;
  bool isFinished = true;
  Future<void> requestCode() async {
    loginButtonState = ButtonState.loading;
    isFinished = false;
    emit(RequestCodeLoadingState());
    final response = await _repo.requestCode(phoneNumberController.text);
    response.fold(
      (error) {
        loginButtonState = ButtonState.fail;
        emit(RequestCodeErrorState(error: error));
      },
      (data) {
        loginButtonState = ButtonState.idle;
        emit(RequestCodeSuccessState(message: data.message));
      },
    );
  }

  Future<void> verifyCode() async {
    verifyButtonState = ButtonState.loading;
    emit(VerifyCodeLoadingState());
    final response = await _repo.verifyCode(phoneNumberController.text, code);
    response.fold((error) {
      verifyButtonState = ButtonState.fail;
      emit(VerifyCodeErrorState(error: error));
    }, (data) {
      verifyButtonState = ButtonState.idle;
      emit(VerifyCodeSuccessState(user: data.data!));
    });
  }

  void addFromToWidget(String day) {
    final int lastIndex = days[day].length - 1;

    if (days[day][lastIndex].fromController.text.isNotEmpty &&
        days[day][lastIndex].toController.text.isNotEmpty) {
      days[day].add(FromToController());
    } else {
      return;
    }
    emit(EditTimeState());
  }

  Future<void> pickImage() async {
    try {
      pickedProfileImage = await ImageHelper.pickImage(ImageSource.camera);
      if (pickedProfileImage != null) {
        emit(PickImageState());
      }
    } catch (e) {
      // todo handle this error correctly
      print(e);
    }
  }

  void deleteFromToWidget(String day, int index) {
    days[day].removeAt(index);
    emit(EditTimeState());
  }

  void finishTime() {
    isFinished = true;
    waitSeconds *= 2;
    emit(FinishTimeState());
  }
}

class FromToController {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
}
