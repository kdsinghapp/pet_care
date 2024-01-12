import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_response_logIn_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Activity/MainActivity.dart';
import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Common/ShowToast.dart';
import '../Constant/string_constants.dart';


class LogInController extends GetxController {
  RxBool showProgressbar=false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map<String, dynamic> bodyParamsForSubmitLoginForm = {};
  LogInModel? logInModel;
  late SharedPreferences sharedPreferences;



  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
  }
  Future<void> callingSubmitLogInForm() async {
    bodyParamsForSubmitLoginForm = {
      ApiKeyConstants.email: emailController.text.toString(),
      ApiKeyConstants.password: passwordController.text.toString(),
      ApiKeyConstants.registerId: generateRandomString(25),

    };
    print("bodyParamsForGetEducationLevel:::::$bodyParamsForSubmitLoginForm");
    logInModel = await ApiMethods.logInApi(
        bodyParams: bodyParamsForSubmitLoginForm);
    if (logInModel!.status!="0"??false ) {
      print("LogIn Successfully complete...");
      showToastMessage("LogIn Successfully complete...");
      saveDataSharedPreference(logInModel);
    }else{
      print("LogIn Failed....");
      showToastMessage(logInModel!.message!);
      changeProgressbarStatus(false);
    }
  }


  saveDataSharedPreference(LogInModel? userdata) async{
    sharedPreferences=await SharedPreferences.getInstance();
    showToastMessage("Successfully Login Complete");
    String userDataString = jsonEncode(userdata);
    sharedPreferences.setString(StringConstants.userData, userDataString);
    changeProgressbarStatus(false);
    Get.offAndToNamed('/mainActivity');

  }

}