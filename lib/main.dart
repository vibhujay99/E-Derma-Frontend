import 'package:e_derma/screens/splash_screen.dart';
import 'package:e_derma/services/disease_data.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  DiseaseData().init();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const EDerma(),
    ),
  );
}

class EDerma extends StatelessWidget {
  const EDerma({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
