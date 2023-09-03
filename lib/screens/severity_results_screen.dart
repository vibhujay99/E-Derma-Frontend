import 'dart:io';

import 'package:e_derma/models/cancer_classification_result_model.dart';
import 'package:flutter/material.dart';

class SeverityResultsScreen extends StatefulWidget {
  const SeverityResultsScreen({
    Key? key,
    required this.image,
    required this.result,
  }) : super(key: key);
  final File image;
  final CancerPercentage result;

  @override
  State<SeverityResultsScreen> createState() => _SeverityResultsScreenState();
}

class _SeverityResultsScreenState extends State<SeverityResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                padding: EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50)),
                  padding: const EdgeInsets.all(5),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.arrow_back),
                      Text("Go back"),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Here is your results",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.file(
                  widget.image,
                  width: MediaQuery.of(context).size.width - 30,
                  height: MediaQuery.of(context).size.width - 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.result.code.toUpperCase()} Severity",
                    style: TextStyle(
                      fontSize: 22,
                      color: widget.result.code == 'high'
                          ? Colors.red
                          : widget.result.code == 'low'
                              ? Colors.green
                              : Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Chip(
                    label: Text(
                      "${widget.result.percentage}% confidence",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Colors.blueAccent.withOpacity(0.15),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                  "E-Derma has predicted a severity level of ${widget.result.code} for the image you provided. Always keep in mind that these results are predicted my machine learning models which may not provide with 100% accuracy."),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(50)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.info_outline),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const Text(
                        "Please consider taking professional consultation.",
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
