import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_privacyPolicy_model.dart';
import 'package:pet_care/Apis/api_models/get_uploadPostResponse_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_message_status_model.dart';
import '../Apis/api_models/get_response_logIn_model.dart';
import '../Common/ShowToast.dart';
import '../Constant/string_constants.dart';

class NewPostController extends GetxController {
  TextEditingController captionController = TextEditingController();
  RxBool progressBar = true.obs;
  List<File> fileList = [];
  Map<String, String?> parameter = Get.parameters;
  dynamic argumentData = Get.arguments;
  final RxString profileImage = "".obs;
  late SharedPreferences sharedPreferences;
  late LogInModel model;
  RxBool showUploadProgressBar = false.obs;
  Map<String, dynamic> bodyParamsForAddPostForm = {};
  GetUploadPostResponseModel? getUploadPostResponseModel;

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

  changeProgressBar(bool value) {
    progressBar.value = value;
  }

  changeUploadProgressbarStatus(bool value) {
    showUploadProgressBar.value = value;
  }

  Future<void> getDataFromLocal() async {
    await callingDataFromLocalDataBase();
  }

  Future<void> callingDataFromLocalDataBase() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData =
        jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData != null) {
      model = LogInModel.fromJson(jsonData);
      profileImage.value = model.result!.image!;
    }
  }

  Future<void> callingAddPostForm() async {
    fileList.add(argumentData[0]);
    bodyParamsForAddPostForm = {
      ApiKeyConstants.userId: model.result!.id,
      ApiKeyConstants.token: model.result!.token,
      ApiKeyConstants.type: "Image",
      ApiKeyConstants.description: captionController.text.toString(),
      //ApiKeyConstants.imageList: fileList,
      ApiKeyConstants.location: "indore",
      ApiKeyConstants.lat: "8899.99",
      ApiKeyConstants.lon: "8899.99",
    };

    print("bodyParamsForDelete:::::$bodyParamsForAddPostForm");
    getUploadPostResponseModel = await ApiMethods.addPostApi(
        imageKey: 'image[]',
        images: fileList,
        bodyParams: bodyParamsForAddPostForm);
    if (getUploadPostResponseModel!.status != "0" ?? false) {
      print("Upload Images  Successfully complete...");
      changeUploadProgressbarStatus(false);
      showToastMessage(getUploadPostResponseModel!.message!);
    } else {
      print("Upload Images Failed....");
      showToastMessage(getUploadPostResponseModel!.message!);
      changeUploadProgressbarStatus(false);
    }
  }
}
