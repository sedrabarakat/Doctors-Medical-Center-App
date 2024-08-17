import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:doctor_app/core/data/models/base_model.dart';
import 'package:doctor_app/core/data/models/doctor_model.dart';
import 'package:doctor_app/core/domain/services/api_services.dart';
import 'package:doctor_app/core/domain/urls/app_url.dart';
import 'package:doctor_app/src/features/patient_profile/data/models/file_model.dart';
import 'package:doctor_app/src/features/patient_profile/data/models/service_model.dart';
import 'package:doctor_app/src/features/patient_profile/data/models/session_detail_model.dart';
import 'package:doctor_app/src/features/patient_profile/data/models/session_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PatientRemoteDataSource {
  final ApiServices _services;
  PatientRemoteDataSource(this._services);
  Future<BaseModels> getPatientSessions(int id) async {
    final response = await _services.get("${AppUrl.getPatientSession}$id");
    return BaseModels.fromJson(
        response['data'], (itemJson) => SessionModel.fromJson(itemJson));
  }

  Future<BaseModel<SessionModel>> getSession(int id) async {
    final response = await _services.get("${AppUrl.getSession}$id");
    return BaseModel.fromJson(response, (json) => SessionModel.fromJson(json));
  }

  Future<BaseModels> getServices() async {
    final response = await _services.get(AppUrl.getServices);
    return BaseModels.fromJson(
        response['data'], (itemJson) => ServiceModel.fromJson(itemJson));
  }

  Future<BaseModel<SessionDetailModel>> addSessionDetails(int sessionId,
      int serviceId, String description, String? labStatus) async {
    final response = await _services
        .post("${AppUrl.addSessionDetails}$sessionId/details/add", body: {
      'service_id': serviceId,
      'description': description,
      'lab_status': labStatus,
    });
    return BaseModel.fromJson(
        response, (json) => SessionDetailModel.fromJson(json));
  }

  Future<BaseModel<SessionDetailModel>> getSessionDetailsInformation(
      int sessionDetailsId) async {
    final response = await _services
        .get("${AppUrl.getSessionDetailsInformation}$sessionDetailsId");
    return BaseModel.fromJson(
        response, (json) => SessionDetailModel.fromJson(json));
  }

  Future<BaseModel<DoctorModel>> getDoctorInformation(int id) async {
    final response = await _services.get("${AppUrl.getDoctorInformation}$id");
    return BaseModel.fromJson(response, (json) => DoctorModel.fromJson(json));
  }

  Future<BaseModel<FileModel>> uploadFileIntoSessionDetails({
    required int sessionDetailsId,
    required Uint8List file,
    required String fileType,
    required String fileName,
    required BuildContext context,
  }) async {
    final response = await _services.postFiles(
      context,
      "${AppUrl.uploadFileIntoSessionDetails}$sessionDetailsId/upload-file",
      formData: FormData.fromMap({
        'file': MultipartFile.fromBytes(file, filename: fileName),
        'file_type': fileType,
      }),
    );
    return BaseModel.fromJson(response, (json) => FileModel.fromJson(json));
  }

  Future<BaseModel> downloadFile(
      {required String path,
      required String savePath,
      required BuildContext context,
      required int fileId}) async {
    await _services.downloadFile(
        context, "${AppUrl.downloadFile}$path", savePath, fileId);
    return BaseModel(data: null, message: "downloaded successfully");
  }
}
