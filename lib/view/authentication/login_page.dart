
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controllers/authentication_controller.dart';
import '../../controllers/invoice_controller.dart';
import '../widgets/custom_text_field.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  AuthController authController = Get.put(AuthController());
  InvoiceCOntroller invoiceController = Get.put(InvoiceCOntroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 100.h,
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: Text(
                'Wps name of App',
                style: TextStyle(
                    color: appDarkBlueColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              )),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                ' Log in ',
                style: TextStyle(fontSize: 20),
              )),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Customtextfield(
              textEditingController: authController.emailController,
              lableName: "Email",
            ),
          ),
          SizedBox(
            height: 20.h,
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Customtextfield(
              textEditingController: authController.passwordController,
              lableName: " Password",
            ),
          ),
          // TextButton(
          //   onPressed: () {
          //     //forgot password screen
          //   },
          //   child: const Text(
          //     'Forgot Password',
          //   ),
          // ),
          SizedBox(
            height: 60.h,
          ),

          Container(
              height: 50.h,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  authController.logIn();
                  // invoiceController.generateFile();
                  // print(nameController.text);
                  // print(passwordController.text);
                },
              )),
          Row(
            children: <Widget>[
              const Text('Does not have account?'),
              TextButton(
                child: const Text(
                  'sign up',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Get.to(() => SignupPage());

                  //signup screen
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    ));
  }
}
