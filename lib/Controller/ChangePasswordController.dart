
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_logIn_model.dart';
import '../Common/ShowToast.dart';
import '../Constant/string_constants.dart';


class ChangePasswordController extends GetxController {

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController cnfPasswordController = TextEditingController();

  Map<String, dynamic> bodyParamsForChangePasswordForm = {};
  LogInModel? logInModel;
  GetResponseModel? getResponseModel;
  late SharedPreferences sharedPreferences;

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
      logInModel= LogInModel.fromJson(jsonData);
    }

  }

  Future<void> callingSubmitChangePasswordForm() async {
    bodyParamsForChangePasswordForm = {
      ApiKeyConstants.oldPassword: currentPasswordController.text.toString(),
      ApiKeyConstants.newPassword: newPasswordController.text.toString(),
      ApiKeyConstants.userId: logInModel!.result!.id!,

    };
    print("bodyParamsForGetEducationLevel:::::$bodyParamsForChangePasswordForm");
    getResponseModel = await ApiMethods.changePasswordApi(
        bodyParams: bodyParamsForChangePasswordForm);
    if (getResponseModel!.status!="0"??false ) {
      print("LogIn Successfully complete...");
      showToastMessage("Password Change Successfully complete...");
    }else{
      print("LogIn Failed....");
      showToastMessage(getResponseModel!.message!);
    }
  }

}