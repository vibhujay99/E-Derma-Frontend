import 'package:e_derma/screens/detect_cancer_screen.dart';
import 'package:e_derma/screens/detect_severity_screen.dart';
import 'package:e_derma/screens/detect_skin_lesion.dart';
import 'package:e_derma/ui_components/side_bar_menu.dart';
import 'package:flutter/material.dart';

import 'faqs_screen.dart';

class SelectOptionScreen extends StatefulWidget {
  const SelectOptionScreen({Key? key}) : super(key: key);

  @override
  State<SelectOptionScreen> createState() => _SelectOptionScreenState();
}

class _SelectOptionScreenState extends State<SelectOptionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const SideBarMenu(),
        appBar: AppBar(
          backgroundColor: const Color(0xff0F00FF),
          centerTitle: true,
          title: const Text(
            'E-Derma',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FaqsScreen(),
                      ),
                    );
                  },
                  child: const Icon(Icons.help_rounded)),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 45,
              ),
              const Text(
                "Choose an option",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "You can classify cancer, check the severity, classify the lesions and diagnose the disease with E-Derma.",
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 85, vertical: 75),
                color: Colors.lightBlue.withOpacity(0.75),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetectCancerScreen(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Classify Cancer",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.search_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 85, vertical: 75),
                color: Colors.orange.withOpacity(0.65),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetectSeverityScreen(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Check Severity",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 75),
                color: Colors.redAccent.withOpacity(0.65),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetectSkinLesion(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Lesion Classification",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.category_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 75),
                color: Colors.green.withOpacity(0.65),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetectSkinLesion(),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Disease Diagnosis",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.face_retouching_natural_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
