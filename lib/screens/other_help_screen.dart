import 'package:flutter/material.dart';

class OtherHelpScreen extends StatefulWidget {
  const OtherHelpScreen({Key? key}) : super(key: key);

  @override
  _OtherHelpScreenState createState() => _OtherHelpScreenState();
}

class _OtherHelpScreenState extends State<OtherHelpScreen> {
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
                    "OTHER",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buildQuestion(
                      question: "Some feature isn’t working. What should I do?",
                      answer:
                      "You can re-install the app which will solve the issue most of the time. If the problem persists, please feel free to contact us."),
                  buildQuestion(
                      question:
                      "How can I report a bug?",
                      answer:
                      "All you have to do is write us an email which includes the model of your smartphone, the Android or iOS version, and the description of the bug. We will be glad for your contribution in this matter."),
                  buildQuestion(
                      question:
                      "I can’t find my answer here. What should I do?",
                      answer:
                      "You can reach us. You can find the contact information by clicking “contact us”. You are more than welcome to contact us."),
                  buildQuestion(
                      question:
                      "Is my information safe?",
                      answer:
                      "Although we require access to your gallery, we never access any photos without your permission. We will never share your personal information with anyone."),
                  buildQuestion(
                      question:
                      "Can I also water the plant when I use liquid fertilizer?",
                      answer:
                      "Yes, you can. But on the days when you’re using liquid fertilizer, make sure you don’t over or underwater the plant."),

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