import 'package:e_derma/data/lesion_data.dart';
import 'package:e_derma/models/lesion_result_model.dart';
import 'package:flutter/material.dart';
import 'package:e_derma/screens/faqs_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:e_derma/ui_components/image_tips.dart';
import 'package:e_derma/services/ml_service.dart';
import '../ui_components/side_bar_menu.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_derma/screens/lesion_results_screen.dart';

class DetectSkinLesion extends StatefulWidget {
  const DetectSkinLesion({super.key});

  @override
  State<DetectSkinLesion> createState() => _DetectSkinLesionState();
}

class _DetectSkinLesionState extends State<DetectSkinLesion> {
  MLService mlService = MLService();

  void initState() {
    super.initState();
  }

  bool loading = false;

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
      setState(() {
        loading = true;
      });
      try {
        //running the tflite model on the image
        final result = await mlService.lesionClassify(image);
        print(result);
        setState(() {
          loading = false;
        });
        // final result = true;
        if (result != null) {
          //navigating to the results screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LesionResultsScreen(
                lesionResultModel: LesionResultModel(
                    lesionDetails:
                        LesionDetails(result: result.getBestMatch().result),
                    imagePreview: image,
                    confidence: result.getBestMatch().confidence),
              ),
            ),
          );
          //if the leaf is healthy then showing a toast
        }
      } catch (e) {
        //if the model fails to predict then showing a toast
        Fluttertoast.showToast(
            msg: "Done",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.yellowAccent,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      setState(() {
        loading = false;
      });
    }
  }

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
                            builder: (context) => const FaqsScreen(),
                          ),
                        );
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
    return Stack(
      children: [
        Column(
          children: [
            Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blueAccent.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50)),
                        padding: const EdgeInsets.all(5),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.arrow_back),
                            Text("Go back"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 65),
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 25),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'CLASSIFY SKIN LESIONS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Color(0xff0F00FF),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  height: 100,
                                  child: Lottie.asset('images/lesion.json')),
                              const SizedBox(
                                height: 25,
                              ),
                              Text(
                                'Classify skin lesion within seconds!',
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
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 15.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.r),
                            color: const Color(0xff0F00FF).withOpacity(0.12)),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
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
                                  color:
                                      const Color(0xff0F00FF).withOpacity(0.7),
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
                ),
              ],
            ),
          ],
        ),
        loading
            ? SizedBox(
                height: MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    kBottomNavigationBarHeight,
                child: Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator()))
            : const SizedBox(),
      ],
    );
  }
}
