import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'About us',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 150,
                    child: ClipOval(
                        child: LottieBuilder.asset("images/about_us_img.json"))),
                const SizedBox(height: 30,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    'E-Derma is a mobile application designed to assist users in identifying and understanding various skin diseases, lesions, and conditions. It comprises four core components: Skin Disease Diagnosis, Skin Lesion Classification, Skin Cancer Classification, and Skin Disease Severity Assessment.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
