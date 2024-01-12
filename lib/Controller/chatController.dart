import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Activity/TypingActivity.dart';
import 'package:pet_care/Apis/api_constants/api_url_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_followers_model.dart';
import '../Apis/api_models/get_response_logIn_model.dart';
import '../Common/ShowToast.dart';
import '../Constant/string_constants.dart';


class ChatController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List nameList = ['Saudi Arabia','Kuwait','Qatar','Ashraf Ahmad','Rizwan'];
  List filterFollowersList=[].obs;
  RxBool showProgressBar=true.obs;
  GetFollowersModel? getFollowersModel;
  late SharedPreferences sharedPreferences;
  late LogInModel model;

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

  showAllUsers(){
    filterFollowersList=getFollowersModel!.result!;
  }

  Future<void> getDataFromLocal() async {
    await callingDataFromLocalDataBase();
  }
  Future<void> callingDataFromLocalDataBase() async{
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      model = LogInModel.fromJson(jsonData);
      getFollowersList(model.result!.id!);
    }

  }


  filterUsersList(String query){
    filterFollowersList = getFollowersModel!.result!
        .where((result) => result.followerDetails!.fullName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();

  }
  changeProgressBar(bool value){
    showProgressBar.value=value;
  }

  openChatPages(){
    Get.to(()=>const TypingActivity());
  }

  Future<void> getFollowersList(String id) async {
    String urlGetFollowers='${ApiUrlConstants.endPointOfGetFollowers}?user_id=$id';
    getFollowersModel = await ApiMethods.getFollowersApi(uri: urlGetFollowers);
    if (getFollowersModel!.status!="0"??false ) {
      changeProgressBar(false);
      showAllUsers();
      print("Get Followers Successfully complete...");
    }else{
      print("Get Followers Failed....");
      changeProgressBar(true);
      showToastMessage(getFollowersModel!.message!);
    }
  }
}