import 'package:flutter/material.dart';
import '../screens/account_help_screen.dart';
import '../screens/paddy_help_screen.dart';
import '../screens/other_help_screen.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(Icons.arrow_back_rounded),
                  ),
                ),
                const Text(
                  "HOW CAN WE HELP YOU?",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "PROFILE",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                buildQuestion(
                    question: "How do I access my Paddy account in new device?",
                    answer:
                        "If you want to login your old account in new device, please follow these steps.\n\n"
                        "1.	Open the Paddy app in your new device\n"
                        "2.	On the main view of the app, it will ask for your old account’s email and password\n"
                        "3.	Type your email and password\n"
                        "4.	If you can’t remember your password, click “Forgot password?” and follow the steps\n"
                        "5.	By logging in you will get access to your new account"),
                buildQuestion(
                    question: "Do I need to sign up to use Paddy?",
                    answer: "Yes, you do need to sign up to use Paddy."),
                InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        "View All",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff0F00FF).withOpacity(0.65)),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountHelpScreen()));
                    }),
                const Text(
                  "USING PADDY",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                buildQuestion(
                    question:
                        "Why can’t I use the camera or get images from gallery?",
                    answer:
                        "You have to give permission to Paddy app to be able to use camera or library. If you already clicked no, you can change it in the phone’s settings."),
                buildQuestion(
                    question:
                        "How can I take a good, identifiable picture of my plant?",
                    answer:
                        "The best way to take decent quality photo of your plant is by using pinch and zoom camera feature. If you take the picture from a distance, the app will find it hard to identify the plant. Moreover, the background of the image shouldn’t be in green or any similar colors to the plant. We prefer a solid background color."),
                InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        "View All",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff0F00FF).withOpacity(0.65)),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PaddyHelpScreen()));
                    }),
                const Text(
                  "OTHER",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                buildQuestion(
                    question: "Some feature isn’t working. What should I do?",
                    answer:
                        "You can re-install the app which will solve the issue most of the time. If the problem persists, please feel free to contact us."),
                buildQuestion(
                    question: "How can I report a bug?",
                    answer:
                        "All you have to do is write us an email which includes the model of your smartphone, the Android or iOS version, and the description of the bug. We will be glad for your contribution in this matter."),
                GestureDetector(
                    child: Text(
                      "View All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff0F00FF).withOpacity(0.65)),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OtherHelpScreen()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildQuestion({required String question, required String answer}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              answer,
              style: TextStyle(
                  fontSize: 16, color: Colors.black87.withOpacity(0.6)),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 0,
            )
          ],
        ),
      ),
    );
  }
}
