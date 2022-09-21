import 'dart:io';



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:localstore/localstore.dart';
import 'package:uuid/uuid.dart';

import '../model/user_model.dart';
import '../services/api_service.dart';
import '../view/home_tab_page.dart';
// import 'package:dio/dio.dart';

class AuthController extends GetxController {
  UserModel? user;
  //  for Login
  final db = Localstore.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String gender = "";
  getUserData() async {
    Map<String, dynamic>? usersJsonList = await db.collection('users').get();
    if (usersJsonList != null)
      user = UserModel.fromJson(usersJsonList.values.first);
    print(user);
    update();
  }

  logIn() async {
    ApiServices apiService = ApiServices();
    var jsonResponse;
    jsonResponse = await apiService.login(
        emailController.text.trim(), passwordController.text.trim());
    print('jsonResponse' + jsonResponse.toString());
    user = UserModel.fromJson(jsonResponse[0]);

// save the item
    db.collection('users').doc(user!.id).set(jsonResponse[0]);
    update();
    // var res = CallApi.postData();
    Get.offAll(() => HomeTabPage());
  }

  register() {
    Uuid uuid = Uuid();
    String id = uuid.v4();
    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      id: id,
      profilePic: "",
      gender: gender,
    );
    ApiServices apiServices = ApiServices();
    apiServices.register(userModel);
  }

  uploadFile(File file) async {
    getUserData();

    ApiServices apiServices = ApiServices();
    apiServices.uploadFile(file, user!.id!);
  }
}
