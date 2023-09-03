import 'package:flutter/material.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({Key? key}) : super(key: key);

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
                  "FAQs",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const BuildQuestion(
                  question: "What is E-Derma?",
                  answer:
                      "E-Derma is a mobile application designed to assist users in identifying and understanding various skin diseases, lesions, and conditions. It comprises four core components: Skin Disease Diagnosis, Skin Lesion Classification, Skin Cancer Classification, and Skin Disease Severity Assessment.",
                ),
                const BuildQuestion(
                  question: "How does E-Derma work?",
                  answer:
                      "E-Derma utilizes advanced image recognition technology and machine learning algorithms to analyze uploaded images of skin issues. It provides accurate insights into potential skin diseases, classifies lesions, assesses skin cancer risk, and determines the severity of identified conditions.",
                ),
                const BuildQuestion(
                  question: "Is E-Derma's diagnosis accurate?",
                  answer:
                      "E-Derma's diagnosis is based on a sophisticated machine learning model trained on a vast dataset of skin disease images. While it strives for accuracy, please note that its suggestions are not a replacement for professional medical advice. Always consult a dermatologist for a confirmed diagnosis.",
                ),
                const BuildQuestion(
                  question: "How do I use the Skin Disease Diagnosis feature?",
                  answer:
                      "To use the Skin Disease Diagnosis feature, simply upload an image of the affected skin area. The app will analyze the image and provide potential disease suggestions. Remember, these suggestions are for informational purposes only and should be validated by a medical professional.",
                ),
                const BuildQuestion(
                  question: " What is Skin Lesion Classification?",
                  answer:
                      "Skin Lesion Classification is a component of E-Derma that categorizes various skin lesions, such as moles, spots, and growths. It helps users understand the characteristics of these lesions and provides insights into whether they might be benign or require further evaluation.",
                ),
                const BuildQuestion(
                  question: "Can E-Derma detect skin cancer?",
                  answer:
                      "Yes, the Skin Cancer Classification feature in E-Derma is designed to assess the likelihood of skin cancer based on uploaded images. However, it's crucial to emphasize that E-Derma's assessment is not a substitute for a medical diagnosis. Always consult a dermatologist for confirmation.",
                ),
                const BuildQuestion(
                  question:
                      "How does the Skin Disease Severity Assessment work?",
                  answer:
                      "The Skin Disease Severity Assessment feature gauges the severity of identified skin conditions. Users can provide information about their symptoms and the app will offer an estimation of how severe the condition might be. Again, consult a medical professional for an accurate evaluation.",
                ),
                const BuildQuestion(
                  question: " Is E-Derma's data secure?",
                  answer:
                      "Absolutely. E-Derma takes user privacy and data security seriously. All uploaded images and personal information are encrypted and stored securely. The app adheres to stringent privacy standards to protect user data.",
                ),
                const BuildQuestion(
                  question: "Can I rely solely on E-Derma for medical advice?",
                  answer:
                      "No, E-Derma is intended to provide users with information and insights about their skin conditions. It should never replace professional medical advice from a qualified dermatologist. Always seek the guidance of a medical professional for accurate diagnoses and treatment recommendations.",
                ),
                const BuildQuestion(
                  question: "How often is E-Derma's database updated?",
                  answer:
                      "E-Derma's database is regularly updated with new information, images, and advancements in skin disease research. This ensures that users have access to the most accurate and up-to-date information. Remember, while E-Derma is a valuable tool, it should always be used in conjunction with professional medical guidance. If you have concerns about your skin health, consult a dermatologist for proper evaluation and treatment.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildQuestion extends StatefulWidget {
  const BuildQuestion({Key? key, required this.question, required this.answer})
      : super(key: key);
  final String question;
  final String answer;

  @override
  State<BuildQuestion> createState() => _BuildQuestionState();
}

class _BuildQuestionState extends State<BuildQuestion> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 7,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.65,
                  child: Text(
                    widget.question,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      expanded = !expanded;
                    });
                  },
                  icon: Icon(expanded
                      ? Icons.close
                      : Icons.keyboard_arrow_down_rounded),
                ),
              ],
            ),
            SizedBox(
              height: expanded?2:0,
            ),
            Visibility(
              visible: expanded,
              child: Text(
                widget.answer,
                style: TextStyle(
                    fontSize: 16, color: Colors.black87.withOpacity(0.6)),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
