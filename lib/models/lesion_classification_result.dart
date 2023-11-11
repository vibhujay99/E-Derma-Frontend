import 'dart:convert';

LesionClassificationResult lesionClassificationResultFromJson(String str) =>
    LesionClassificationResult.fromJson(json.decode(str));

String lesionClassificationResultToJson(LesionClassificationResult data) =>
    json.encode(data.toJson());

class LesionClassificationResult {
  final double scars;
  final double bullaVesicles;
  final double randomImage;

  const LesionClassificationResult(
      this.scars, this.bullaVesicles, this.randomImage);

  factory LesionClassificationResult.fromJson(Map<String, dynamic> json) =>
      LesionClassificationResult(json['scars'] as double,
          json['bullaVesicles'] as double, json['randomImage'] as double);

  Map<String, dynamic> toJson() => {
        "scars": scars,
        "bullaVesicles": bullaVesicles,
        "randomImage": randomImage,
      };

  LesionPercentage getBestMatch() {
    final values = [
      LesionPercentage(result: "scars", confidence: scars),
      LesionPercentage(result: 'bullaVesicles', confidence: bullaVesicles),
      LesionPercentage(result: 'randomImage', confidence: randomImage),
    ];

    LesionPercentage highestValue = values.reduce((value1, value2) =>
        value1.confidence > value2.confidence ? value1 : value2);
    return highestValue;
  }
}

class LesionPercentage {
  final String result;
  final double confidence;

  const LesionPercentage({required this.result, required this.confidence});
}
