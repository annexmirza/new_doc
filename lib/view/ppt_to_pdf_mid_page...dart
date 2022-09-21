
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:new_doc/view/widgets/custom_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../constants.dart';
import '../controllers/conversion_controller.dart';
import 'widgets/custom_text.dart';

class PpttoPdfMidScreen extends StatelessWidget {
  ConversionController conversionController = Get.put(ConversionController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ConversionController>(builder: (conversionController) {
          return conversionController.isLoading
              ? Center(
                  child: CircularPercentIndicator(
                    radius: 100.h,
                    percent: conversionController.percent,
                    center: Text("Converting..."),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
                )
              : Column(
                  children: [
                    Container(
                      height: 250.h,
                      decoration: BoxDecoration(color: apporengeColor),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 10.h),
                              child: CustomText(
                                  titletext: "PPT to PDF",
                                  fontsize: 35.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900)),
                          Padding(
                            padding: EdgeInsets.only(top: 50.h),
                            child: Container(
                              height: 200.h,
                              // color: Colors.red,
                              width: 150.h,
                              child: SvgPicture.asset(
                                "assets/DoctoJpegI.svg",
                                semanticsLabel: 'A red up arrow',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15.h,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: CustomText(
                                  titletext: "Features",
                                  fontsize: 35.sp,
                                  color: apporengeColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20.w),
                                  child: Container(
                                    height: 10.h,
                                    width: 10.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 11.h,
                                ),
                                CustomText(
                                    titletext:
                                        '''After converting a PDF to Jpeg Document 
        you are free to Eidit the Document content''',
                                    fontsize: 15.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 20.w),
                                  child: Container(
                                    height: 10.h,
                                    width: 10.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.h,
                                ),
                                CustomText(
                                    titletext:
                                        '''After converting a Doc to PDF Document 
        you are free to Eidit the Document content''',
                                    fontsize: 15.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Divider(
                                color: Colors.white,
                                thickness: 2.h,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(right: 17.w),
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.w),
                                    color: Colors.white,
                                  ),
                                  width: 350.w,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            customButton(
                                text: "Selected Doc",
                                height: 60.h,
                                width: 220.w,
                                color: apporengeColor,
                                onTapFunction: () {
                                  conversionController.convertPPTToPdf();
                                },
                                radius: 10,
                                textSize: 20.sp,
                                fontWeight: FontWeight.bold),
                            SizedBox(
                              height: Get.height / 32.5,
                            )
                          ],
                        ),
                      ),
                      color: Color(0xff35343a),
                      width: Get.width,
                      height: Get.height / 1.531,
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
