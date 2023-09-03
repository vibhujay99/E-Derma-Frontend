import 'dart:io';
import 'package:e_derma/data/cancer_data.dart';

class ResultModel{
  CancerDetails cancerDetails;
  //image file selected by the user
  File imagePreview;
  //confidence of the prediction made by the model
  double confidence;

  //constructor
  ResultModel({required this.cancerDetails, required this.imagePreview, required this.confidence});
}