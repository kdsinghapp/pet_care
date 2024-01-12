import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_common_model.dart';
import 'package:pet_care/Apis/api_models/get_response_model.dart';
import 'package:pet_care/Apis/api_models/get_submitComment_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_postDetails_model.dart';
import '../Common/ShowToast.dart';


class UserPostDetailsController extends GetxController {
  TextEditingController commentController = TextEditingController();
  RxBool showProgressbar=true.obs;
  RxBool showCommentProgressbar=false.obs;
  RxBool liked=false.obs;
  Map<String, String?> parametersData = Get.parameters;
  Map<String, dynamic> bodyParamsForLikeUnlikeForm = {};
  Map<String, dynamic> bodyParamsForSubmitCommentForm = {};
  Map<String,dynamic> bodyParamsForFollowUnFollowForm={};
  GetPostDetailsModel? getPostDetailsModel;
  GetResponseModel? getResponseModel;
  SubmitCommentResponseModel? submitCommentResponseModel;
  GetCommonModel? getCommonModel;
  late SharedPreferences sharedPreferences;

  @override
  void onInit() {
    super.onInit();
    callingGetUserPostById();
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

  changeLikedStatus(bool value){
    liked.value=value;
  }

  Future<void> callingGetUserPostById() async {
    String getPostDetailUrl='https://server-php-7-3.technorizen.com/PetCare/webservice/get_post_details?user_id=${parametersData['userId']}&post_id=${parametersData['postId']}';
    getPostDetailsModel = await ApiMethods.getPostDetailsApi( uri: getPostDetailUrl);
    if (getPostDetailsModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      print("Get Post Details Successfully complete...");
    }else{
      print("Get Post Details Failed....");
      changeProgressbarStatus(true);
      showToastMessage(getPostDetailsModel!.message!);
    }
  }

  Future<void> callingGetLikeUnlikedApi() async {
    bodyParamsForLikeUnlikeForm = {
      ApiKeyConstants.userId: parametersData['userId'],
      ApiKeyConstants.postId:parametersData['postId'],
      ApiKeyConstants.token: parametersData['token'],
    };

    print("bodyParamsForLikeUnlikeForm:::::$bodyParamsForLikeUnlikeForm");
    getResponseModel = await ApiMethods.likeUnlikeApi(
        bodyParams: bodyParamsForLikeUnlikeForm);
    if (getResponseModel!.status!="0"??false ) {
      showToastMessage(getResponseModel!.message!);
       changeLikedStatus(true);
      print(" Like Unlike Successfully complete...");
    }else{
      print("Like Unlike Failed....");
      showToastMessage(getResponseModel!.message!);
    }
  }

  Future<void> callingSubmitCommentApi() async {
    bodyParamsForSubmitCommentForm = {
      ApiKeyConstants.userId: parametersData['userId'],
      ApiKeyConstants.postId:parametersData['postId'],
      ApiKeyConstants.token: parametersData['token'],
      ApiKeyConstants.comment:commentController.text.toString()
    };

    print("bodyParamsForLikeUnlikeForm:::::$bodyParamsForSubmitCommentForm");
    submitCommentResponseModel = await ApiMethods.submitCommentApi(
        bodyParams: bodyParamsForSubmitCommentForm);
    if (submitCommentResponseModel!.status!="0"??false ) {
      showToastMessage(submitCommentResponseModel!.message!);
      print("Submit Comment Successfully complete...");
    }else{
      print("Submit CommentFailed....");
      showToastMessage(submitCommentResponseModel!.message!);
    }
  }


  Future<void> callingFollowUnFollowApi() async {
    bodyParamsForFollowUnFollowForm = {
      ApiKeyConstants.userId: parametersData['myId'],
      ApiKeyConstants.token: parametersData['token'],
      ApiKeyConstants.otherUserId:parametersData['userId']
    };
    print("bodyParamsForFollowUnFollowForm:::::$bodyParamsForFollowUnFollowForm");
    getCommonModel = await ApiMethods.followUnfollowApi(
        bodyParams: bodyParamsForFollowUnFollowForm);
    if (getCommonModel!.status!="0"??false ) {
      showToastMessage(getCommonModel!.result!);
      print("Follow UnFollow Successfully complete...");
    }else{
      print("Follow UnFollow  Failed....");
      showToastMessage(getCommonModel!.message!);
    }
  }
}