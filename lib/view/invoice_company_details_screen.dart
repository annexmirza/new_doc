
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../controllers/invoice_controller.dart';
import 'invoice_customer_details_screen.dart';
import 'widgets/custom_button.dart';

class InvoiceCompanyDetailsScreen extends StatelessWidget {
  InvoiceCompanyDetailsScreen({Key? key}) : super(key: key);
  InvoiceCOntroller invoiceCOntroller = Get.put(InvoiceCOntroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appGreenColor,
        foregroundColor: Colors.white,
        title: Text('Company Details'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
              ),
              Container(
                  width: 340.w,
                  child: TextFormField(
                    controller: invoiceCOntroller.companyNameController,
                    decoration: InputDecoration(
                      labelText: 'Company Name',
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
                  controller: invoiceCOntroller.companyAddressController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: 'Address',
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
                  controller: invoiceCOntroller.invoiceNumberController,
                  decoration: InputDecoration(
                    labelText: 'Invoice Number',
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
                  controller: invoiceCOntroller.dueDateController,
                  decoration: InputDecoration(
                    labelText: 'Due Date',
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
                    Get.to(() => InvoiceCustomerDetailsScreen());
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
