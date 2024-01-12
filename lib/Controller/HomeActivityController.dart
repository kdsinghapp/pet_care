import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_allUsersPost_model.dart';
import 'package:pet_care/Apis/api_models/get_banner_model.dart';
import 'package:pet_care/Apis/api_models/get_category_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_constants/api_url_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_followers_model.dart';
import '../Apis/api_models/get_response_logIn_model.dart';
import '../Common/ShowToast.dart';
import '../Constant/string_constants.dart';


class HomeActivityController extends GetxController {
  RxInt count=0.obs;
  TextEditingController searchController = TextEditingController();
  late SharedPreferences sharedPreferences;
  late LogInModel model;
  GetBannerModel? getBannerModel;
  GetCategoryModel? getCategoryModel;
  GetFollowersModel? getFollowersModel;
  GetAllUsersPostModel? getAllUsersPostModel;
  RxBool bannerProgressBar=true.obs;
  RxBool categoryProgressBar=true.obs;
  RxBool showAllPostProgressBar=true.obs;


  @override
  void onInit() {
    super.onInit();
    getDataFromLocal();
    getBanner();
    getChooseCategory();
    changeCount(1);
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
  openSearchPage(){
   Map<String,String>data={
     "user_id":model.result!.id!,
     "token":model.result!.token!,
   };
    Get.toNamed('/searchActivity',parameters: data);
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
      getFollowersList(model.result!.id!);

    }
  }

  openPostDetailsPages(String usersId,String postId) async{
    Map<String,String>data={
      "token":model.result!.token!,
      "myId":model.result!.id!,
      "userId":usersId,
      "postId":postId
    };
    changeCount(0);
   await  Get.toNamed('/usersPostDetailsActivity',parameters:data );
   onInit();
  }

  changeBannerProgressBar(bool value){
    bannerProgressBar.value=value;
  }
  changeCategoryProgressBar(bool value){
    categoryProgressBar.value=value;
  }

  changeAllPostProgressBar(bool value){
    showAllPostProgressBar.value=value;
  }

  getBanner() async{
    getBannerModel = await ApiMethods.getBannerApi();
    if (getBannerModel!.status!="0"??false ) {
      print("Get Banner Successfully complete...");
      changeBannerProgressBar(false);
    }else{
      print("Get Privacy Policy Failed....");
      changeBannerProgressBar(true);
      showToastMessage(getBannerModel!.message!);
    }
  }

  getChooseCategory() async{
    getCategoryModel = await ApiMethods.getCategoryApi();
    if (getCategoryModel!.status!="0"??false ) {
      print("Get Banner Successfully complete...");
      changeCategoryProgressBar(false);
    }else{
      print("Get Privacy Policy Failed....");
      changeCategoryProgressBar(true);
      showToastMessage(getCategoryModel!.message!);
    }
  }

  getFollowersList(String id) async {
    String urlGetFollowers='${ApiUrlConstants.endPointOfGetFollowers}?user_id=$id';
    getFollowersModel = await ApiMethods.getFollowersApi(uri: urlGetFollowers);
    if (getFollowersModel!.status!="0"??false ) {
      getAllUserPost();
      print("Get Followers Successfully complete...");
    }else{
      getAllUserPost();
      print("Get Followers Failed....");
     // showToastMessage(getFollowersModel!.message!);
    }
  }

  getAllUserPost() async{
    String getUrl="https://server-php-7-3.technorizen.com/PetCare/webservice/get_all_post?user_id=${model.result!.id}";
    getAllUsersPostModel = await ApiMethods.getAllUserPostApi(uri: getUrl);
    if (getAllUsersPostModel!.status!="0"??false ) {
      print("Get All users post Successfully complete...");
      changeAllPostProgressBar(false);
    }else{
      print("Get All users post Failed....");
      changeAllPostProgressBar(true);
      showToastMessage(getAllUsersPostModel!.message!);
    }
  }
}