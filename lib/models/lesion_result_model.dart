import 'dart:io';
import 'package:e_derma/data/lesion_data.dart';

class LesionResultModel {
  LesionDetails lesionDetails;

  File imagePreview;

  double confidence;

  LesionResultModel(
      {required this.lesionDetails,
      required this.imagePreview,
      required this.confidence});
}
