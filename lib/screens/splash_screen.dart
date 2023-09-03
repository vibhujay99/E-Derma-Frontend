import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:lottie/lottie.dart';
import 'package:e_derma/screens/onboarding_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'E-Derma',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              SizedBox(
                  height: 50,
                  child: Image.asset('images/leaficon.png'))
            ],
          ),
          Lottie.asset("images/animation_llxaz0xs.json", repeat: false, height: 250,)
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    checkFirstOpen();
  }

  //checking if its the first launch to show onboarding screen
  checkFirstOpen() async {
    // Read value
    bool firstTime = await IsFirstRun.isFirstRun();

    if (firstTime) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
      });
    } else {
      Future.delayed(const Duration(milliseconds: 2000), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LogInScreen()));
      });
    }
  }
}
