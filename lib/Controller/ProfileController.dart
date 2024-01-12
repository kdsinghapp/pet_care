import 'dart:convert';

import 'package:get/get.dart';
import 'package:pet_care/Activity/FAQsActivity.dart';
import 'package:pet_care/Activity/UserProfileActivity.dart';
import 'package:pet_care/Apis/api_models/get_message_status_model.dart';
import 'package:pet_care/Apis/api_models/get_response_logIn_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Activity/ChangePasswordActivity.dart';
import '../Activity/LanguageActivity.dart';
import '../Activity/NotificationActivity.dart';
import '../Activity/PrivacyPolicyActivity.dart';
import '../Activity/RateUsActivity.dart';
import '../Activity/SupportActivity.dart';
import '../Activity/TermsCondtitionActivity.dart';
import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Common/ShowToast.dart';
import '../Constant/icons_constants.dart';
import '../Constant/string_constants.dart';


class ProfileController extends GetxController {
  RxBool showProgressbar=false.obs;
  RxBool showDeleteProgressbar=false.obs;
  RxInt count=0.obs;
  final RxString name = "".obs;
  final RxString email = "".obs;
  final RxString profileImage = "".obs;
  late SharedPreferences sharedPreferences;
  late List list1 ;//= ['profile'.tr,'language'.tr,'notification'.tr,'changePassword'.tr];
   late List list2;//= ['faqs'.tr,'rateUs'.tr,'support'.tr,'termsAndConditions'.tr,'privacyPolicy'.tr];
  List mainIconList=[IconConstants.icProfile,IconConstants.icLanguage,IconConstants.icNotification,IconConstants.icPassword];
  List moreIconList=[IconConstants.icFaqs,IconConstants.icRateUs,IconConstants.icSupport,IconConstants.icTermsCondition,IconConstants.icPrivacy];
  Map<String, dynamic> bodyParamsForLogoutForm = {};
  Map<String, dynamic> bodyParamsForDeleteForm = {};
  MessageStatusModel? messageStatusModel;
   late LogInModel model;
  @override
  void onInit() {
    super.onInit();
    list1 = ['profile'.tr,'language'.tr,'notification'.tr,'changePassword'.tr];
    list2= ['faqs'.tr,'rateUs'.tr,'support'.tr,'termsAndConditions'.tr,'privacyPolicy'.tr];
    changeCount(1);
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
  changeCount(int value){
    count.value=value;
  }


  openMainProfilePages(int index)  async {
    switch(index){
      case 0:{
        Get.to(()=>const UserProfileActivity());
      }
      break;
      case 1:{
        changeCount(0);
        await Get.to(()=>const LanguageActivity());
        onInit();
      }
      break;
      case 2:{
        Map<String,String>data={
          "user_id":model.result!.id!,
          "token":model.result!.token!,
        };
        Get.toNamed('/notificationActivity',parameters: data);
      // Get.to(()=>const NotificationActivity());
      }
      break;
      case 3:{
       Get.to(()=>const ChangePasswordActivity());
      }
      break;
    }
  }
  openMoreProfilePages(int index){
    switch(index){
      case 0:{
        Get.to(()=>const FAQsActivity());
      }
      break;
      case 1:{
        Map<String,String>data={
          "user_id":model.result!.id!,
          "token":model.result!.token!,
        };
       Get.toNamed('/rateUsActivity',parameters:data);
      }
      break;
      case 2:{
        Get.to(()=>const SupportActivity());
      }
      break;
      case 3:{
        Get.to(()=>const TermsConditionActivity());
      }
      break;
      case 4:{
        Get.to(()=>const PrivacyPolicyActivity());
      }
      break;
    }
  }

  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }
  changeDeleteProgressbarStatus(bool value){
    showDeleteProgressbar.value=value;
  }
  Future<void> getDataFromLocal() async {
    await callingDataFromLocalDataBase();
  }

  Future<void> callingDataFromLocalDataBase() async{
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      model = LogInModel.fromJson(jsonData);
      name.value= "${model.result!.firstName!} ${model.result!.lastName!}";
      email.value= model.result!.email!;
      profileImage.value=model.result!.image!;
      print(model.result!.id);
      print(model.result!.token);
    }

  }


  Future<void> callingLogoutForm() async {
    bodyParamsForLogoutForm = {
      ApiKeyConstants.userId: model.result!.id,
      ApiKeyConstants.token: model.result!.token,

    };
    print("bodyParamsForLogout:::::$bodyParamsForLogoutForm");
    messageStatusModel = await ApiMethods.logoutApi(
        bodyParams: bodyParamsForLogoutForm);
    if (messageStatusModel!.status!="0"??false ) {
      print("LogIn Successfully complete...");
      changeProgressbarStatus(false);
      sharedPreferences.clear();
      Get.offNamedUntil('/mainActivity', (route) => false);
      Get.toNamed('/logInActivity');
      showToastMessage("LogIn Successfully complete...");
    }else{
      print("LogIn Failed....");
      showToastMessage(messageStatusModel!.message!);
      changeProgressbarStatus(false);
    }
  }



  Future<void> callingDeleteAccountForm() async {
    bodyParamsForDeleteForm = {
      ApiKeyConstants.userId: model.result!.id,
      ApiKeyConstants.token: model.result!.token,

    };
    print("bodyParamsForDelete:::::$bodyParamsForDeleteForm");
    messageStatusModel = await ApiMethods.deleteAccountApi(
        bodyParams: bodyParamsForDeleteForm);
    if (messageStatusModel!.status!="0"??false ) {
      print("LogIn Successfully complete...");
      changeDeleteProgressbarStatus(false);
      sharedPreferences.clear();
      Get.offNamedUntil('/mainActivity', (route) => false);
      Get.toNamed('/logInActivity');
      showToastMessage("Delete Account Successfully complete...");
    }else{
      print("Delete Account Failed....");
      showToastMessage(messageStatusModel!.message!);
      changeDeleteProgressbarStatus(false);
    }
  }
}