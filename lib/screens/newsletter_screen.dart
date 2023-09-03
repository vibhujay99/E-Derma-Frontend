import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NewsletterScreen extends StatefulWidget {
  const NewsletterScreen({Key? key}) : super(key: key);

  @override
  State<NewsletterScreen> createState() => _NewsletterScreenState();
}

class _NewsletterScreenState extends State<NewsletterScreen> {

  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: GestureDetector(
            onTap: (){
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.arrow_back_rounded))),
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                  SizedBox(
                      height: 200,
                      child: Lottie.asset("images/newsletter.json", repeat: false)),
                  const Text(
                    "Subscribe to our newsletter!",
                    style: TextStyle(
                        color: Color(0xff0F00FF),
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    " Stay up-to-date with the latest articles of your choice, important tips& tricks and many more.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 25,),
                  Text('Enter your email below to get started.', style: TextStyle(
                    fontSize: 12,
                    color: const Color(0xff0F00FF).withOpacity(0.75),
                  ),),
                  const SizedBox(height: 7,),
                  textBox(context)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textBox(BuildContext context){
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: MediaQuery.of(context).size.height*0.075,
        color: Colors.grey.withOpacity(0.1),
        child: Row(
          children: [
            Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: email,
                    decoration : const InputDecoration(
                      hintText: 'Enter your email',
                      border: InputBorder.none
                    ),
                  ),
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              color: const Color(0xff0F00FF),
              child: const Text('Subscribe', style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
            )
          ],
        ),
      ),
    );
  }
}
