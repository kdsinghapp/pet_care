import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_logIn_model.dart';
import '../Common/ShowToast.dart';
import '../Constant/string_constants.dart';



class EditProfileController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  final RxString profileImage = "".obs;
  Map<String, dynamic> bodyParamsForSubmitUpdateProfileForm = {};
  late SharedPreferences sharedPreferences;
  LogInModel? logInModel;
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


  openEditPages(){
    //Get.to(()=>const TypingActivity());
  }

  Future<void> getDataFromLocal() async {
    await callingDataFromLocalDataBase();
  }

  Future<void> callingDataFromLocalDataBase() async{
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      userModel= LogInModel.fromJson(jsonData);
      firstNameController.value=TextEditingValue(text: userModel.result!.firstName!);
      lastNameController.value=TextEditingValue(text: userModel.result!.lastName!);
      emailController.value=TextEditingValue(text: userModel.result!.email!);
      phoneNumberController.value=TextEditingValue(text: userModel.result!.mobile!);
      genderController.value=TextEditingValue(text: userModel.result!.gender!);
      ageController.value=TextEditingValue(text: userModel.result!.age!);
      categoryController.value=TextEditingValue(text: userModel.result!.category!);
      addressController.value=TextEditingValue(text: userModel.result!.address!);
      profileImage.value=userModel.result!.image!;
    }

  }


  Future<void> callingSubmitUpdateProfileForm() async {
    bodyParamsForSubmitUpdateProfileForm = {
      ApiKeyConstants.firstName: firstNameController.text.toString(),
      ApiKeyConstants.lastName: lastNameController.text.toString(),
      ApiKeyConstants.email: emailController.text.toString(),
      ApiKeyConstants.mobile: phoneNumberController.text.toString(),
      ApiKeyConstants.gender: genderController.text.toString(),
      ApiKeyConstants.age: ageController.text.toString(),
      ApiKeyConstants.category: categoryController.text.toString(),
      ApiKeyConstants.address: addressController.text.toString(),
      ApiKeyConstants.lat: "22.7196",
      ApiKeyConstants.lon: "75.8577",
      ApiKeyConstants.token: userModel.result!.token,
      ApiKeyConstants.image: "",
    };

    print("bodyParamsForGetEducationLevel:::::$bodyParamsForSubmitUpdateProfileForm");
    logInModel = await ApiMethods.submitUpdateProfileApi(
        bodyParams: bodyParamsForSubmitUpdateProfileForm);
    if (logInModel!.status!="0"??false ) {
      print("Update Profile Successfully complete...");
      saveDataSharedPreference(logInModel);
    }else{
      print("Update Profile  Failed....");
      showToastMessage(logInModel!.message!);
    }
  }

  saveDataSharedPreference(LogInModel? userdata) async{
    sharedPreferences=await SharedPreferences.getInstance();
    showToastMessage("Successfully Login Complete");
    String userDataString = jsonEncode(userdata);
    sharedPreferences.setString(StringConstants.userData, userDataString);

  }
}