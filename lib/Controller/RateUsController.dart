import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_rateus_model.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Common/ShowToast.dart';

class RateUsController extends GetxController{

  TextEditingController feedBackController=TextEditingController();
  RxDouble rateValue =4.0.obs;
  RxBool showProgressbar=false.obs;
  Map<String,String?> parameters=Get.parameters;
   RateUsModel? rateUsModel;
  late Map<String,dynamic> bodyParamsForSubmitRateUsForm;

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

  changeRatingValue(double value){
    rateValue.value=value;
  }

  changeShowProgressbar(bool value){
    showProgressbar.value=value;
  }

  Future<void> submitRateUs() async {
    bodyParamsForSubmitRateUsForm = {
      ApiKeyConstants.userId:parameters['user_id'],
      ApiKeyConstants.token: parameters['token'],
      ApiKeyConstants.rating:rateValue.value.toString(),
      ApiKeyConstants.feedback:feedBackController.text.toString() ,
    };
    print("bodyParamsForRateUs:::::$bodyParamsForSubmitRateUsForm");
    rateUsModel = await ApiMethods.submitRateUsApi(bodyParams: bodyParamsForSubmitRateUsForm);
    if (rateUsModel!.status!="0"??false ) {
      changeShowProgressbar(false);
      showToastMessage(rateUsModel!.message!);
      print("Submit Rate Us Successfully complete...");
    }else{
      print("Submit Rate Us Failed....");
      changeShowProgressbar(false);
      showToastMessage(rateUsModel!.message!);
    }
  }

}