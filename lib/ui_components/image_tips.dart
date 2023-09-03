import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_derma/models/weather_model.dart';
import 'package:e_derma/services/weather_service.dart';

class ImageTips extends StatefulWidget {
  const ImageTips({Key? key}) : super(key: key);

  @override
  _ImageTipsState createState() => _ImageTipsState();
}

class _ImageTipsState extends State<ImageTips> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'How to capture an image for better results?',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Always pluck the leaf from the plant and place it on a clear background when capturing the photo. Make sure you have a good lighting condition too.",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15,),
            const Text("Eg :", style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height*0.25,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('images/tip1.JPG'))),
            ),
            const SizedBox(height: 25,),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff0F00FF)),
                  child: const Text(
                    'Got it!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
