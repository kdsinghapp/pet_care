import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_signUp_model.dart';
import '../Common/ShowToast.dart';


class SingUpController extends GetxController {
  RxBool showProgressbar=false.obs;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map<String, dynamic> bodyParamsForSubmitRegistrationForm = {};
  SignUpModel? getSingUpModel;



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
  Future<void> callingSubmitRegistrationForm() async {
    bodyParamsForSubmitRegistrationForm = {
      ApiKeyConstants.firstName: firstNameController.text.toString(),
      ApiKeyConstants.lastName: lastNameController.text.toString(),
      ApiKeyConstants.email: emailController.text.toString(),
      ApiKeyConstants.mobile: phoneNumberController.text.toString(),
      ApiKeyConstants.password: passwordController.text.toString(),
      ApiKeyConstants.gender: genderController.text.toString(),
      ApiKeyConstants.age: ageController.text.toString(),
      ApiKeyConstants.category: categoryController.text.toString(),
      ApiKeyConstants.address: addressController.text.toString(),
      ApiKeyConstants.lat: "22.7196",
      ApiKeyConstants.lon: "75.8577",
      ApiKeyConstants.registerId: generateRandomString(25),

    };
    print("bodyParamsForGetEducationLevel:::::$bodyParamsForSubmitRegistrationForm");
    getSingUpModel = await ApiMethods.submitRegistrationForm(
        bodyParams: bodyParamsForSubmitRegistrationForm);
    if (getSingUpModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      print("Registration Successfully complete...");
      showToastMessage("Registration Successfully complete...");
      Get.back();
    }else{
      print("Registration Failed....");
      changeProgressbarStatus(false);
      showToastMessage(getSingUpModel!.message!);
    }
  }

}