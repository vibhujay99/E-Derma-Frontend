import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_derma/models/result_model.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key, required this.resultModel}) : super(key: key);

  final ResultModel resultModel;

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool detailsSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: (_, __) => Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Material(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      //image preview
                      SizedBox(
                          height: 250.h,
                          width: 360.w,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(15.r),
                                  bottomLeft: Radius.circular(15.r)),
                              child: Image.file(
                                widget.resultModel.imagePreview,
                                fit: BoxFit.cover,
                              ))),
                      Positioned(
                          top: 0,
                          left: 0,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17.0.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        Row(
                          children: [
                            //showing the prediction confidence
                            Container(
                              alignment: Alignment.center,
                              height: 20.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                      // changing the color dynamically according to the confidence
                                      color: widget.resultModel.confidence > 70
                                          ? Colors.green
                                          : widget.resultModel.confidence > 50
                                              ? Colors.orange
                                              : Colors.red,
                                      width: 1.5.w)),
                              child: Text(
                                '${widget.resultModel.confidence.toString().length > 3 ? widget.resultModel.confidence.toString().substring(0, 4) : widget.resultModel.confidence}%',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            const Text(
                              'Confidence',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff332FD0),
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset('images/leaficon.png'))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        //showing disease name
                        Text(
                          widget.resultModel.cancerDetails.getName(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),

                        SizedBox(
                          height: 5.h,
                        ),
                        detailsTab(),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //building the details tab ui
  Widget detailsTab() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Disease details',
                style: TextStyle(
                    color: Color(0xff332FD0),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: const Icon(
                  Icons.travel_explore_outlined,
                  color: Color(0xff084594),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            widget.resultModel.cancerDetails.getDescription(),
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }

}
