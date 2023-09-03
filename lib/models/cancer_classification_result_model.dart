import 'dart:convert';

CancerClassificationResult cancerClassificationResultFromJson(String str) =>
    CancerClassificationResult.fromJson(json.decode(str));

String cancerClassificationResultToJson(CancerClassificationResult data) =>
    json.encode(data.toJson());

class CancerClassificationResult {
  double akiec;
  double bcc;
  double bkl;
  double df;
  double mel;
  double nv;
  double vasc;

  CancerClassificationResult({
    required this.akiec,
    required this.bcc,
    required this.bkl,
    required this.df,
    required this.mel,
    required this.nv,
    required this.vasc,
  });

  CancerPercentage getBestMatch() {
    List<CancerPercentage> values = [
      CancerPercentage(code: 'akiec', percentage: akiec),
      CancerPercentage(code: 'bcc', percentage: bcc),
      CancerPercentage(code: 'bkl', percentage: bkl),
      CancerPercentage(code: 'df', percentage: df),
      CancerPercentage(code: 'mel', percentage: mel),
      CancerPercentage(code: 'nv', percentage: nv),
      CancerPercentage(code: 'vasc', percentage: vasc),
    ];

    CancerPercentage highestValue = values.reduce((value1, value2) =>
        value1.percentage > value2.percentage ? value1 : value2);
    return highestValue;
  }

  factory CancerClassificationResult.fromJson(Map<String, dynamic> json) =>
      CancerClassificationResult(
        akiec: json["akiec"] ?? 0,
        bcc: json["bcc"] ?? 0,
        bkl: json["bkl"] ?? 0,
        df: json["df"] ?? 0,
        mel: json["mel"] ?? 0,
        nv: json["nv"] ?? 0,
        vasc: json["vasc"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "akiec": akiec,
        "bcc": bcc,
        "bkl": bkl,
        "df": df,
        "mel": mel,
        "nv": nv,
        "vasc": vasc,
      };
}

class CancerPercentage {
  final String code;
  final double percentage;

  const CancerPercentage({required this.code, required this.percentage});
}
