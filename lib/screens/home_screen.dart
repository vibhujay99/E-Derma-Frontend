import 'package:e_derma/data/cancer_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:e_derma/ui_components/image_tips.dart';
import 'package:e_derma/screens/results_screen.dart';
import 'package:e_derma/services/ml_service.dart';
import '../ui_components/side_bar_menu.dart';
import '../models/result_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'faqs_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //creating an instance of the ML Service class
  MLService mlService = MLService();

  @override
  void initState() {
    super.initState();
    //loading the tflite model on the initState
    // mlService.loadModel();
    // getWeather();
  }

  //this function let the user to select or take an image
  void pickImg() {
    //showing the bottom sheet
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Select an option',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              //Camera option
              ListTile(
                onTap: () {
                  getImage(ImageSource.camera);
                },
                leading: const Icon(Icons.camera_alt),
                title: const Text('Capture a photo from camera'),
              ),
              //Gallery option
              ListTile(
                onTap: () {
                  getImage(ImageSource.gallery);
                },
                leading: const Icon(Icons.collections),
                title: const Text('Choose a photo from gallery'),
              )
            ],
          ),
        );
      },
    );
  }

  //Capturing an image or selecting an image from storage
  Future getImage(ImageSource imgSource) async {
    //getting the user selected image
    final img = await ImagePicker().pickImage(source: imgSource);
    //dismissing the bottom sheet
    Navigator.of(context).pop();
    if (img != null) {
      //creating image file
      final image = File(img.path);
      //running the tflite model on the image
      final result = await mlService.classifyCancer(image);

      if (result != null) {
        //navigating to the results screen
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultScreen(
                      resultModel: ResultModel(
                        cancerDetails:
                            CancerDetails(code: result.getBestMatch().code),
                        confidence: result.getBestMatch().percentage,
                        imagePreview: image,
                      ),
                    )));
        //if the leaf is healthy then showing a toast
      }
      //if the model fails to predict then showing a toast
      else {
        Fluttertoast.showToast(
            msg: 'Couldn\'t predict, please try again!',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  bool weatherLoading = false;

  //build method
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      builder: (_, __) => SafeArea(
        //auto ignore the keyboard
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: Scaffold(
            backgroundColor: const Color(0xffF7F7F7),
            drawer: const SideBarMenu(),
            appBar: AppBar(
              backgroundColor: const Color(0xff0F00FF),
              centerTitle: true,
              title: const Text(
                'E-Derma',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FaqsScreen()));
                      },
                      child: const Icon(Icons.help_rounded)),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Center(
                  child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildHomeBody(),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }

  //Home page body UI
  Widget buildHomeBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 65),
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'GET STARTED',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color(0xff0F00FF)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      height: 100,
                      child: Lottie.asset('images/plant-home.json')),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Identify leaf diseases & find remedies within seconds!',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.75),
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        pickImg();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff0F00FF),
                          borderRadius: BorderRadius.circular(50)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      child: const Text(
                        'START',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      content: const ImageTips());
                });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 15.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.r),
                color: const Color(0xff0F00FF).withOpacity(0.12)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.info,
                  color: const Color(0xff0F00FF).withOpacity(0.5),
                  size: 25,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  '''Quality of the photo will\nalways affect the final result''',
                  style: TextStyle(
                      color: const Color(0xff0F00FF).withOpacity(0.7),
                      fontSize: 15.sp),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
