import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_privacyPolicy_model.dart';

import '../Apis/api_methods/api_methods.dart';
import '../Common/ShowToast.dart';

class AddressController extends GetxController{
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController addressTitleController = TextEditingController();
  RxBool showProgressBar=false.obs;
  dynamic argumentData = Get.arguments;
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

  changeProgressBar(bool value){
    showProgressBar.value=value;
  }


  openToPaymentPage(){
    Get.toNamed('/paymentActivity',arguments: argumentData);
  }



}