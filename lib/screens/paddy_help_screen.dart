import 'package:flutter/material.dart';

class PaddyHelpScreen extends StatefulWidget {
  const PaddyHelpScreen({Key? key}) : super(key: key);

  @override
  _PaddyHelpScreenState createState() => _PaddyHelpScreenState();
}

class _PaddyHelpScreenState extends State<PaddyHelpScreen> {
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
                    "USING PADDY",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buildQuestion(
                      question: "Why can’t I use the camera or get images from gallery?",
                      answer:
                      "You have to give permission to Paddy app to be able to use camera or library. If you already clicked no, you can change it in the phone’s settings."),
                  buildQuestion(
                      question:
                      "How can I take a good, identifiable picture of my plant?",
                      answer:
                      "The best way to take decent quality photo of your plant is by using pinch and zoom camera feature. If you take the picture from a distance, the app will find it hard to identify the plant. Moreover, the background of the image shouldn’t be in green or any similar colors to the plant. We prefer a solid background color."),
                  buildQuestion(
                      question:
                      "Can I get information of the treatments for identified disease?",
                      answer:
                      "You can see the information of treatments in the identification results page."),
                  buildQuestion(
                      question:
                      "Why one of the detections is not accurate?",
                      answer:
                      "Sometimes changing the angle of the photo or distancing a bit can help because the app solely relies on a single photo to identify diseases. If you know about the disease, you could email us the information. You can find our contact information by clicking “contact us” in the side bar."),
                  buildQuestion(
                      question:
                      "Can I select photos from my gallery, or should I take photos from my camera?",
                      answer:
                      "Paddy allows both ways. You can either select photos from the gallery or you can take from the camera."),
                  buildQuestion(
                      question:
                      "Can I suggest a new feature?",
                      answer:
                      "Of course, you can. All you have to do is send us an email specifying the type of feature you would like to suggest. We will do our best to implement."),
                  buildQuestion(
                      question:
                      "How can I request a plant to be added to the database?",
                      answer:
                      "You can send the plant request by emailing us. You can find our contact information by clicking “contact us” in the side bar."),
                  buildQuestion(
                      question:
                      "Which languages does Paddy support?",
                      answer:
                      "Currently Paddy supports for only English. We will do our best to support other languages in future."),
                  buildQuestion(
                      question:
                      "Can I use Paddy on my computer?",
                      answer:
                      "No, unfortunately this is not possible. Our team didn’t develop a web version. However, our mobile app is supported by android and iOS platforms.  "),

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