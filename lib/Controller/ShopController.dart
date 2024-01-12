import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_productList_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Activity/CartActivity.dart';
import '../Activity/ProductDetailActivity.dart';
import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_logIn_model.dart';
import '../Common/ShowToast.dart';
import '../Constant/string_constants.dart';

class ShopController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List nameList = ['Grain-Friendly Kibble Sampler Pack','Pedigree Puppy Chicken and Milk Dog Food 2.8 Kg',
    'Grain-Friendly Kibble Sampler Pack','Pedigree Puppy Chicken and Milk Dog Food 2.8 Kg','Pedigree Puppy Chicken and Milk Dog Food 2.8 Kg'];
  List filterProductList=[].obs;


  RxBool showProgressbar=true.obs;
  Map<String, dynamic> bodyParamsForGetProductListForm = {};
  GetProductListModel? getProductListModel;
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

  showAllProducts(){
    filterProductList=getProductListModel!.result!;
  }


  getFilterProductList(String query){
    filterProductList = getProductListModel!.result!
        .where((name) => name.toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();

  }
  openCartPage(){
    Get.to(()=>const CartActivity());
  }
  openProductDetailPages(String productId){
    Map<String,String>data={
      "productId":productId,
      "userId":userModel.result!.id!,
      "token":userModel.result!.token!,
    };
    //Get.to(()=>const ProductDetailActivity(),pa);
    Get.toNamed('/productDetailActivity',parameters:data );
  }

  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
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
    bodyParamsForGetProductListForm = {
      ApiKeyConstants.userId: userModel.result!.id,
      ApiKeyConstants.token: userModel.result!.token,
    };

    print("bodyParamsForGetProductListForm:::::$bodyParamsForGetProductListForm");
    getProductListModel = await ApiMethods.getProductsListApi(
        bodyParams: bodyParamsForGetProductListForm);
    if (getProductListModel!.status!="0"??false ) {
      showAllProducts();
      changeProgressbarStatus(false);
      print("Get Product List Successfully complete...");
    }else{
      print("Send Otp Failed....");
      changeProgressbarStatus(true);
      showToastMessage(getProductListModel!.message!);
    }
  }
}