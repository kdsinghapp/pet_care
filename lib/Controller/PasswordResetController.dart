import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_resetPassword_model.dart';
import 'package:pet_care/Apis/api_models/get_response_model.dart';
import 'package:pet_care/Apis/api_models/get_send_otp_model.dart';
import 'package:pet_care/Apis/api_models/get_verify_otp_model.dart';
import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Common/ShowToast.dart';


class PasswordResetController extends GetxController {
  RxInt tabIndex=0.obs;
  RxBool showSendOtpProgressbar=false.obs;
  RxBool showVerifyOtpProgressbar=false.obs;
  RxBool showPasswordProgressbar=false.obs;
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController cnfPasswordController=TextEditingController();
  Map<String, dynamic> bodyParamsForSendOtpForm = {};
  Map<String, dynamic> bodyParamsForVerifyOtpForm = {};
  Map<String, dynamic> bodyParamsFoResetPasswordForm = {};
  SendOtpModel? sendOtpModel;
  VerifyOtpModel? verifyOtpModel;
  ResetPasswordModel? resetPasswordModel;



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

  clickOnBackTabButton(){
    if(tabIndex.value>0){
      tabIndex.value=tabIndex.value-1;
    }else{
      Get.back();
    }
  }
  openNextTab(int index){
    tabIndex.value=index;
  }

  changeSendOtpProgressbarStatus(bool value){
    showSendOtpProgressbar.value=value;
  }
  changeVerifyOtpProgressbarStatus(bool value){
    showVerifyOtpProgressbar.value=value;
  }
  changePasswordProgressbarStatus(bool value){
    showPasswordProgressbar.value=value;
  }

  Future<void> callingSendOtpForm() async {
    bodyParamsForSendOtpForm = {
      ApiKeyConstants.email: emailController.text.toString(),
    };

    print("bodyParamsForSendOtpForm:::::$bodyParamsForSendOtpForm");
    sendOtpModel = await ApiMethods.sendOtpForForgetPasswordApi(
        bodyParams: bodyParamsForSendOtpForm);
    if (sendOtpModel!.status!="0"??false ) {
      changeSendOtpProgressbarStatus(false);
      openNextTab(1);
      print("Send Otp Successfully complete...");
      showToastMessage("Send Otp Successfully complete...");
    }else{
      print("Send Otp Failed....");
      changeSendOtpProgressbarStatus(false);
      showToastMessage(sendOtpModel!.message!);
    }
  }

  Future<void> callingVerifyOtpForm(String otp) async {
    bodyParamsForVerifyOtpForm = {
      ApiKeyConstants.userId: sendOtpModel!.result!.id,
      ApiKeyConstants.otp:otp,
      ApiKeyConstants.token:sendOtpModel!.result!.token,
    };
    print("bodyParamsForSendOtpForm:::::$bodyParamsForVerifyOtpForm");
    verifyOtpModel = await ApiMethods.verifyOtpForForgetPasswordApi(
        bodyParams: bodyParamsForVerifyOtpForm);
    if (verifyOtpModel!.status!="0"??false ) {
      changeVerifyOtpProgressbarStatus(false);
      openNextTab(2);
      print("Send Otp Successfully complete...");
      showToastMessage(verifyOtpModel!.message!);
    }else{
      print("Send Otp Failed....");
      changeVerifyOtpProgressbarStatus(false);
      showToastMessage(verifyOtpModel!.message!);
    }
  }

  Future<void> callingResetPasswordForm() async {
    bodyParamsFoResetPasswordForm = {
      ApiKeyConstants.userId: sendOtpModel!.result!.id,
      ApiKeyConstants.password:passwordController.text.toString(),
      ApiKeyConstants.token:sendOtpModel!.result!.token,
    };
    print("bodyParamsForResetPasswordForm:::::$bodyParamsFoResetPasswordForm");
    resetPasswordModel = await ApiMethods.resetPasswordForForgetPasswordApi(
        bodyParams: bodyParamsFoResetPasswordForm);
    if (resetPasswordModel!.status!="0"??false ) {
      changePasswordProgressbarStatus(false);
      Get.back();
      print("Reset Password Successfully complete...");
      showToastMessage(resetPasswordModel!.message!);
    }else{
      print("Reset Password Failed....");
      changePasswordProgressbarStatus(false);
      showToastMessage(resetPasswordModel!.message!);
    }
  }

}