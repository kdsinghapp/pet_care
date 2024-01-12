
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_support_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_logIn_model.dart';
import '../Common/ShowToast.dart';
import '../Constant/string_constants.dart';

class SupportController extends GetxController{
  RxBool showProgressbar=false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  SupportUsModel? supportUsModel;
  Map<String, dynamic> bodyParamsForSupportUsForm = {};
  late SharedPreferences sharedPreferences;
  late LogInModel userModel;

  @override
  void onInit() {
    super.onInit();
    getDataFromLocal();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getDataFromLocal() async {
    await callingDataFromLocalDataBase();
  }

  Future<void> callingDataFromLocalDataBase() async{
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      userModel= LogInModel.fromJson(jsonData);
      nameController.value=TextEditingValue(text: userModel.result!.firstName!);
      emailController.value=TextEditingValue(text: userModel.result!.email!);
      phoneNumberController.value=TextEditingValue(text: userModel.result!.mobile!);
    }

  }

  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }

  Future<void> callingSubmitSupportForm() async {
    bodyParamsForSupportUsForm = {
      ApiKeyConstants.userId: userModel.result!.id!,
      ApiKeyConstants.token:userModel.result!.token! ,
      ApiKeyConstants.name: nameController.text.toString(),
      ApiKeyConstants.email: emailController.text.toString(),
      ApiKeyConstants.mobile: phoneNumberController.text.toString(),
      ApiKeyConstants.message: messageController.text.toString(),


    };
    print("bodyParamsForGetEducationLevel:::::$bodyParamsForSupportUsForm");
    supportUsModel = await ApiMethods.submitSupportUsApi(
        bodyParams: bodyParamsForSupportUsForm);
    if (supportUsModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      print("Message Send Successfully complete...");
      showToastMessage("Message Send Successfully complete...");
    }else{
      print("Message Send Failed....");
      showToastMessage(supportUsModel!.message!);
      changeProgressbarStatus(false);
    }
  }

}