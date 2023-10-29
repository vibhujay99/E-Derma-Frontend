import 'package:flutter/material.dart';
import 'dart:io';

import 'package:e_derma/models/cancer_classification_result_model.dart';

class LesionResultsScreen extends StatefulWidget {
  const LesionResultsScreen({
    Key? key,
    required this.image,
    required this.result,
  }) : super(key: key);
  final File image;
  final CancerPercentage result;

  @override
  State<LesionResultsScreen> createState() => _LesionResultsScreenState();
}

class _LesionResultsScreenState extends State<LesionResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
