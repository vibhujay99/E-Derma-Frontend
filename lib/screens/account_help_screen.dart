import 'package:flutter/material.dart';

class AccountHelpScreen extends StatefulWidget {
  const AccountHelpScreen({Key? key}) : super(key: key);

  @override
  _AccountHelpScreenState createState() => _AccountHelpScreenState();
}

class _AccountHelpScreenState extends State<AccountHelpScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                    "PROFILE",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
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
                      question:
                      "Do I need to sign up to use Paddy?",
                      answer:
                      "Yes, you do need to sign up to use Paddy."),
                  buildQuestion(
                      question:
                      "How can I change my email for my account?",
                      answer:
                      "If you like to change the email, please follow these steps.\n\n"
                          "1.	Go to the side bar\n"
                          "2.	Tap Profile\n"
                          "3.	Tap Email\n"
                          "4.	Type your email\n"
                          "5.	Tap Update Info"),
                  buildQuestion(
                      question:
                      "How do I access my Paddy account? I’ve forgotten my password.",
                      answer:
                      "1.	Open the Paddy app\n"
                          "2.	Tap “Forgot Password?”\n"
                          "3.	Enter the email address which is linked with your account\n"
                          "4.	You will receive an email with link to reset your password"),
                  buildQuestion(
                      question:
                      "How do I edit my profile?",
                      answer:
                      "If you want to update your profile information, please follow these steps.\n\n"
                          "1.	Go to the side bar\n"
                          "2.	Tap Profile\n"
                          "3.	Change your profile details\n"
                          "4.	Tap Update Info"),

                ],
              ),
            ),
          )
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