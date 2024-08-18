import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/data/models/base_model.dart';
import 'package:doctor_app/core/data/models/doctor_model.dart';
import 'package:doctor_app/core/domain/error_handler/network_exceptions.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../data/datasource/patient_remote_data_source.dart';
import '../../data/models/file_model.dart';
import '../../data/models/session_detail_model.dart';
import '../../data/models/session_model.dart';

class PatientRepo {
  final PatientRemoteDataSource _remote;
  PatientRepo(this._remote);
  Future<Either<NetworkExceptions, BaseModels>> getPatientSessions(
      int id) async {
    try {
      final response = await _remote.getPatientSessions(id);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<SessionModel>>> getSession(
      int id) async {
    try {
      final response = await _remote.getSession(id);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModels>> getServices() async {
    try {
      final response = await _remote.getServices();
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<SessionDetailModel>>>
      addSessionDetails({
    required int sessionId,
    required int serviceId,
    required String description,
    required String? labStatus,
  }) async {
    try {
      final response = await _remote.addSessionDetails(
          sessionId, serviceId, description, labStatus);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<SessionDetailModel>>>
      getSessionDetailsInformation(int sessionDetailsId) async {
    try {
      final response =
          await _remote.getSessionDetailsInformation(sessionDetailsId);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<DoctorModel>>>
      getDoctorInformation(int id) async {
    try {
      final response = await _remote.getDoctorInformation(id);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel<FileModel>>>
      uploadFileIntoSessionDetails(
          {required int sessionDetailsId,
          required Uint8List file,
          required String fileType,
          required String fileName,
          required BuildContext context}) async {
    try {
      final response = await _remote.uploadFileIntoSessionDetails(
          context: context,
          sessionDetailsId: sessionDetailsId,
          file: file,
          fileType: fileType,
          fileName: fileName);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }

  Future<Either<NetworkExceptions, BaseModel>> downloadFile(
      {required String path,
      required String savePath,
      required BuildContext context,
      required int fileId}) async {
    try {
      final response = await _remote.downloadFile(
          path: path, savePath: savePath, context: context, fileId: fileId);
      return right(response);
    } catch (error) {
      return left(NetworkExceptions.getException(error));
    }
  }
}
