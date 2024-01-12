import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_cartItem_model.dart';
import 'package:pet_care/Apis/api_models/get_message_status_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Activity/AddressActivity.dart';
import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_logIn_model.dart';
import '../Common/ShowToast.dart';
import '../Constant/string_constants.dart';


class CartController extends GetxController {
  TextEditingController promoCodeController = TextEditingController();
  RxInt totalPrice=0.obs;
  RxBool showProgressbar=true.obs;
  Map<String, dynamic> bodyParamsForGetAddToCartListForm = {};
  Map<String, dynamic> bodyParamsForDeleteCartItemForm = {};
  GetCartModel? getCartModel;
  MessageStatusModel? messageStatusModel;
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


  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }

  openAddressPage(){
    //Get.to(()=>const AddressActivity());
    Get.toNamed('/addressActivity',arguments:getCartModel);
  }

  Future<void> getDataFromLocal() async {
    await callingDataFromLocalDataBase();
  }

  Future<void> callingDataFromLocalDataBase() async{
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      userModel= LogInModel.fromJson(jsonData);
      callingGetProductListForm();
    }
  }

  Future<void> callingGetProductListForm() async {
    bodyParamsForGetAddToCartListForm = {
      ApiKeyConstants.userId: userModel.result!.id,
      ApiKeyConstants.token: userModel.result!.token,
    };

    print("bodyParamsForGetProductListForm:::::$bodyParamsForGetAddToCartListForm");
    getCartModel = await ApiMethods.getCartListApi(
        bodyParams: bodyParamsForGetAddToCartListForm);
    if (getCartModel!.status!="0"??false ) {

     changeProgressbarStatus(false);
      print("Get Cart List Successfully complete...");
    }else{
      print("Get Cart List Failed....");
      changeProgressbarStatus(true);
      showToastMessage(getCartModel!.message!);
    }
  }

  Future<void> callingDeleteCartItemForm(String cartId) async {
    bodyParamsForDeleteCartItemForm = {
      ApiKeyConstants.userId: userModel.result!.id,
      ApiKeyConstants.cartId: cartId,
      ApiKeyConstants.token: userModel.result!.token,
    };

    print("bodyParamsForDeleteCartItemForm:::::$bodyParamsForDeleteCartItemForm");
    messageStatusModel = await ApiMethods.deleteCartItemApi(
        bodyParams: bodyParamsForDeleteCartItemForm);
    if (messageStatusModel!.status!="0"??false ) {
      callingGetProductListForm();
      print("Delete Cart Item Successfully complete...");
      showToastMessage(messageStatusModel!.message!);
    }else{
      print("Delete Cart Item Failed....");
      changeProgressbarStatus(true);
      showToastMessage(messageStatusModel!.message!);
    }
  }
}