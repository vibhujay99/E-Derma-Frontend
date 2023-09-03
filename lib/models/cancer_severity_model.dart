import 'package:e_derma/models/cancer_classification_result_model.dart';

class CancerSeverityModel {
  final double low;
  final double high;
  final double medium;

  const CancerSeverityModel(this.low, this.high, this.medium);

  factory CancerSeverityModel.fromJson(Map<String, dynamic> json) =>
      CancerSeverityModel(
        json['low'] as double,
        json['high'] as double,
        json['medium'] as double,
      );

  CancerPercentage getBestMatch(){
    final values = [
      CancerPercentage(code: 'low', percentage: low),
      CancerPercentage(code: 'high', percentage: high),
      CancerPercentage(code: 'medium', percentage: medium),
    ];
    CancerPercentage highestValue = values.reduce((value1, value2) =>
    value1.percentage > value2.percentage ? value1 : value2);
    return highestValue;
  }
}
