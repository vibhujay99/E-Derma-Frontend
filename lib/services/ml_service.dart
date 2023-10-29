import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_derma/app_config.dart';
import 'package:e_derma/models/cancer_classification_result_model.dart';
import 'package:e_derma/models/cancer_severity_model.dart';
import 'package:e_derma/models/lesion_classification_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, Response, MultipartFile;
import 'package:http_parser/http_parser.dart';

class MLService {
  Future<CancerClassificationResult?> classifyCancer(File file) async {
    // Create a Dio instance.
    final Dio dio = Dio(
      BaseOptions(baseUrl: backendUrl),
    );

    // Create a multipart form data.
    final FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(file.path,
          filename: file.path, contentType: MediaType('image', 'jpeg')),
    });

    // Make the request.
    final Response response = await dio.post(
      '/classify_cancer',
      data: formData,
    );

    if (response.statusCode == 200) {
      if (response.data == "Invalid") {
        Get.showSnackbar(
          const GetSnackBar(
            title: "Random Image",
            message: 'Use a skin related image',
            icon: Icon(Icons.info_outline_rounded),
            duration: Duration(seconds: 59),
          ),
        );
        return null;
      }
      final res = CancerClassificationResult.fromJson(response.data);
      return res;
    } else {
      return null;
    }
  }

  Future<CancerSeverityModel?> checkSeverity(File file) async {
    // Create a Dio instance.
    final Dio dio = Dio(
      BaseOptions(baseUrl: backendUrl),
    );

    // Create a multipart form data.
    final FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(file.path,
          filename: file.path, contentType: MediaType('image', 'jpeg')),
    });

    // Make the request.
    final Response response = await dio.post(
      '/check_severity',
      data: formData,
    );

    if (response.statusCode == 200) {
      final res = response.data;
      final data = CancerSeverityModel.fromJson(res);
      return data;
    } else {
      return null;
    }
  }

  Future<LesionClassificationResult?> lesionClassify(File file) async {
    final Dio dio = Dio(
      BaseOptions(baseUrl: backendUrl),
    );

    // Create a multipart form data.
    final FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(file.path,
          filename: file.path, contentType: MediaType('image', 'jpeg')),
    });

    // Make the request.
    final Response response = await dio.post(
      '/lesion_classify',
      data: formData,
    );

    if (response.statusCode == 200) {
      final res = response.data["result"];
      final confidence = response.data["confidence"];
      final percentage = (confidence * 100).toStringAsFixed(2);
      Get.showSnackbar(
        GetSnackBar(
          title: "Your result is a $res",
          message: 'Your confidence level is $percentage %',
          icon: Icon(Icons.info_outline_rounded),
          duration: Duration(seconds: 100),
        ),
      );
      return res;
    } else {
      return null;
    }
  }
}
