import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Activity/TypingActivity.dart';
import 'package:pet_care/Apis/api_models/get_addToCart_model.dart';
import 'package:pet_care/Apis/api_models/get_productDetail_model.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Common/ShowToast.dart';


class ProductDetailController extends GetxController {
  RxBool showProgressbar=true.obs;
  RxBool showAddToCartProgressbar=false.obs;
  TextEditingController searchController = TextEditingController();
  List nameList = ['Saudi Arabia','Kuwait','Qatar','Ashraf Ahmad','Rizwan'];
  List filterList=[].obs;
  RxInt selectSizeIndex=0.obs;
  RxInt selectImageIndex=0.obs;
  RxInt selectQuantity=1.obs;
  Map<String,String?>parameter=Get.parameters;
  Map<String, dynamic> bodyParamsForGetProductDetailForm = {};
  Map<String, dynamic> bodyParamsForAddToCartForm = {};
  ProductDetailsModel? productDetailsModel;
  AddToCartModel? addToCartModel;

  @override
  void onInit() {
    super.onInit();
    callingGetProductDetailForm();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changeSelectedImage(int index){
    selectImageIndex.value=index;
  }
  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }
  changeAddToCartProgressbarStatus(bool value){
    showAddToCartProgressbar.value=value;
  }

  changeQuantity(int value){
   selectQuantity.value=value;
  }

  Future<void> callingGetProductDetailForm() async {
    bodyParamsForGetProductDetailForm = {
      ApiKeyConstants.userId: parameter['userId'],
      ApiKeyConstants.productId:parameter['productId'],
      ApiKeyConstants.token: parameter['token'],
    };

    print("bodyParamsForGetProductDetailsForm:::::$bodyParamsForGetProductDetailForm");
    productDetailsModel = await ApiMethods.getProductsDetailApi(
        bodyParams: bodyParamsForGetProductDetailForm);
    if (productDetailsModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      print("Get Product Details Successfully complete...");
    }else{
      print("Get Product Details  Failed....");
      changeProgressbarStatus(true);
      showToastMessage(productDetailsModel!.message!);
    }
  }



  Future<void> callingAddToCallForm(String productId) async {
    bodyParamsForAddToCartForm = {
      ApiKeyConstants.userId: parameter['userId'],
      ApiKeyConstants.token: parameter['token'],
      ApiKeyConstants.quantity:selectQuantity.value.toString(),
      ApiKeyConstants.productId:productId

    };
    print("bodyParamsForAddToCart:::::$bodyParamsForAddToCartForm");
    addToCartModel = await ApiMethods.addToCartApi(
        bodyParams: bodyParamsForAddToCartForm);
    if (addToCartModel!.status!="0"??false ) {
      print("Add To Cart Successfully Complete ....");
      changeAddToCartProgressbarStatus(false);
      showToastMessage(addToCartModel!.message!);
    }else{
      print("Add To Cart Failed....");
      showToastMessage(addToCartModel!.message!);
      changeAddToCartProgressbarStatus(false);
    }
  }
}