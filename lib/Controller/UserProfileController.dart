import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Activity/EditProfileActivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_models/get_response_logIn_model.dart';
import '../Constant/string_constants.dart';



class UserProfileController extends GetxController {

  final RxString name = "".obs;
  final RxString email = "".obs;
  final RxString phone = "".obs;
  final RxString profileImage = "".obs;
  final RxString employer="".obs;
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


  openEditPages(){
    Get.to(()=>const EditProfileActivity());
  }

  Future<void> getDataFromLocal() async {
    await callingDataFromLocalDataBase();
  }

  Future<void> callingDataFromLocalDataBase() async{
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      LogInModel model = LogInModel.fromJson(jsonData);
      name.value= "${model.result!.firstName!} ${model.result!.lastName!}";
      email.value= model.result!.email!;
      phone.value=model.result!.mobile!;
      employer.value=model.result!.category!;
      profileImage.value=model.result!.image!;
    }

  }
}