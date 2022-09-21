import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controllers/invoice_controller.dart';
import 'invoice_items_screen.dart';
import 'widgets/custom_button.dart';

class InvoiceCustomerDetailsScreen extends StatelessWidget {
  InvoiceCustomerDetailsScreen({Key? key}) : super(key: key);
  InvoiceCOntroller invoiceCOntroller = Get.put(InvoiceCOntroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appGreenColor,
        foregroundColor: Colors.white,
        title: Text('Customer Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
              ),
              Container(
                  width: 340.w,
                  child: TextFormField(
                    controller: invoiceCOntroller.customerNameController,
                    decoration: InputDecoration(
                      labelText: 'Customer Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
              SizedBox(
                height: 25.h,
              ),
              Container(
                width: 340.w,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: invoiceCOntroller.customerEmailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                width: 340.w,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: invoiceCOntroller.customerContactController,
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              customButton(
                  text: "Next",
                  height: 60.h,
                  width: 220.w,
                  color: appGreenColor,
                  onTapFunction: () {
                    Get.to(() => InvoiceItemsScreen());
                    // conversionController.convertPPTToPdf();
                  },
                  radius: 10,
                  textSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ],
          ),
        ),
      ),
    );
  }
}
