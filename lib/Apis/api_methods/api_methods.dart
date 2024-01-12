import 'dart:io';

import 'package:pet_care/Apis/api_models/get_addToCart_model.dart';
import 'package:pet_care/Apis/api_models/get_allUsersPost_model.dart';
import 'package:pet_care/Apis/api_models/get_banner_model.dart';
import 'package:pet_care/Apis/api_models/get_cartItem_model.dart';
import 'package:pet_care/Apis/api_models/get_category_model.dart';
import 'package:pet_care/Apis/api_models/get_faq_model.dart';
import 'package:pet_care/Apis/api_models/get_followers_model.dart';
import 'package:pet_care/Apis/api_models/get_message_status_model.dart';
import 'package:pet_care/Apis/api_models/get_notification_model.dart';
import 'package:pet_care/Apis/api_models/get_postDetails_model.dart';
import 'package:pet_care/Apis/api_models/get_privacyPolicy_model.dart';
import 'package:pet_care/Apis/api_models/get_productDetail_model.dart';
import 'package:pet_care/Apis/api_models/get_productList_model.dart';
import 'package:pet_care/Apis/api_models/get_resetPassword_model.dart';
import 'package:pet_care/Apis/api_models/get_response_logIn_model.dart';
import 'package:pet_care/Apis/api_models/get_support_model.dart';
import 'package:pet_care/Apis/api_models/get_termsCondition_model.dart';
import 'package:pet_care/Apis/api_models/get_userPostList_model.dart';

import '../../Common/http_methods.dart';
import '../api_constants/api_url_constants.dart';
import '../api_models/get_common_model.dart';
import '../api_models/get_rateus_model.dart';
import '../api_models/get_response_model.dart';
import '../api_models/get_response_signUp_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../api_models/get_searchHistory_model.dart';
import '../api_models/get_searchUserName_model.dart';
import '../api_models/get_send_otp_model.dart';
import '../api_models/get_submitComment_model.dart';
import '../api_models/get_uploadPostResponse_model.dart';
import '../api_models/get_verify_otp_model.dart';

class ApiMethods {
  /// Registration Api Calling .....
  static Future<SignUpModel?> submitRegistrationForm({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SignUpModel? signUpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSignUp,
      checkResponse: checkResponse,
    );
    if (response != null) {
      signUpModel = SignUpModel.fromJson(jsonDecode(response.body));
      return signUpModel;
    }
    return null;
  }

  /// Send Otp For Forget Password Api Calling .....
  static Future<SendOtpModel?> sendOtpForForgetPasswordApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SendOtpModel? sendOtpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfForgot,
      checkResponse: checkResponse,
    );
    if (response != null) {
      sendOtpModel = SendOtpModel.fromJson(jsonDecode(response.body));
      return sendOtpModel;
    }
    return null;
  }

  /// Verify Otp For Forget Password Api Calling .....
  static Future<VerifyOtpModel?> verifyOtpForForgetPasswordApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    VerifyOtpModel? verifyOtpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfCheckOtp,
      checkResponse: checkResponse,
    );
    if (response != null) {
      verifyOtpModel = VerifyOtpModel.fromJson(jsonDecode(response.body));
      return verifyOtpModel;
    }
    return null;
  }

  /// Reset Password For Forget Password Api Calling .....
  static Future<ResetPasswordModel?> resetPasswordForForgetPasswordApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    ResetPasswordModel? resetPasswordModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfResetPassword,
      checkResponse: checkResponse,
    );
    if (response != null) {
      resetPasswordModel =
          ResetPasswordModel.fromJson(jsonDecode(response.body));
      return resetPasswordModel;
    }
    return null;
  }

  ///Login Api Calling.....
  static Future<LogInModel?> logInApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    LogInModel? logInModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfLogin,
      checkResponse: checkResponse,
    );

    if (response != null) {
      logInModel = LogInModel.fromJson(jsonDecode(response.body));
      return logInModel;
    }
    return null;
  }

  ///Logout Api Calling.....
  static Future<MessageStatusModel?> logoutApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    MessageStatusModel? messageStatusModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfLogout,
      checkResponse: checkResponse,
    );

    if (response != null) {
      messageStatusModel =
          MessageStatusModel.fromJson(jsonDecode(response.body));
      return messageStatusModel;
    }
    return null;
  }

  ///Delete Account Api Calling.....
  static Future<MessageStatusModel?> deleteAccountApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    MessageStatusModel? messageStatusModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfDeleteAccount,
      checkResponse: checkResponse,
    );

    if (response != null) {
      messageStatusModel =
          MessageStatusModel.fromJson(jsonDecode(response.body));
      return messageStatusModel;
    }
    return null;
  }

  ///Change Password Api Calling.....
  static Future<GetResponseModel?> changePasswordApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetResponseModel? getResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfChangePassword,
      checkResponse: checkResponse,
    );

    if (response != null) {
      getResponseModel = GetResponseModel.fromJson(jsonDecode(response.body));
      return getResponseModel;
    }
    return null;
  }

  /// Update Profile Api Calling .....
   static Future<LogInModel?> submitUpdateProfileApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    LogInModel? logInModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUpdateProfile,
      checkResponse: checkResponse,
    );
    if (response != null) {
      logInModel = LogInModel.fromJson(jsonDecode(response.body));
      return logInModel;
    }
    return null;
  }
 /* static Future<LogInModel?> submitUpdateProfileApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    LogInModel? logInModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUpdateProfile,
      checkResponse: checkResponse,
    );
    if (response != null) {
      logInModel = LogInModel.fromJson(jsonDecode(response.body));
      return logInModel;
    }
    return null;
  }*/

  /// Support Us Api Calling .....
  static Future<SupportUsModel?> submitSupportUsApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SupportUsModel? supportUsModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSupportUs,
      checkResponse: checkResponse,
    );
    if (response != null) {
      supportUsModel = SupportUsModel.fromJson(jsonDecode(response.body));
      return supportUsModel;
    }
    return null;
  }

  /// Get Privacy Policy Api Calling .....
  static Future<PrivacyPolicyModel?> getPrivacyPolicyApi(
      {void Function(int)? checkResponse}) async {
    PrivacyPolicyModel? privacyPolicyModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfPrivacyPolicy,
      checkResponse: checkResponse,
    );
    if (response != null) {
      privacyPolicyModel =
          PrivacyPolicyModel.fromJson(jsonDecode(response.body));
      return privacyPolicyModel;
    }
    return null;
  }

  /// Get Notification Api Calling .....
  static Future<GetNotificationModel?> getNotificationApi(
      {void Function(int)? checkResponse,required String getUrl}) async {
    GetNotificationModel? notificationModel;
    http.Response? response = await MyHttp.getMethod(
      url: getUrl,
      checkResponse: checkResponse,
    );
    if (response != null) {
      notificationModel =
          GetNotificationModel.fromJson(jsonDecode(response.body));
      return notificationModel;
    }
    return null;
  }




  /// Get Terms And Conditions Api Calling .....
  static Future<TermsConditionModel?> getTermsConditionApi(
      {void Function(int)? checkResponse}) async {
    TermsConditionModel? termsConditionModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfTermsCondition,
      checkResponse: checkResponse,
    );
    if (response != null) {
      termsConditionModel =
          TermsConditionModel.fromJson(jsonDecode(response.body));
      return termsConditionModel;
    }
    return null;
  }

  /// Get Banner Api Calling .....
  static Future<GetBannerModel?> getBannerApi(
      {void Function(int)? checkResponse}) async {
    GetBannerModel? getBannerModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetBanner,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getBannerModel = GetBannerModel.fromJson(jsonDecode(response.body));
      return getBannerModel;
    }
    return null;
  }

  /// Get Category Api Calling .....
  static Future<GetCategoryModel?> getCategoryApi(
      {void Function(int)? checkResponse}) async {
    GetCategoryModel? getCategoryModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfChooseCategory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getCategoryModel = GetCategoryModel.fromJson(jsonDecode(response.body));
      return getCategoryModel;
    }
    return null;
  }

  /// Get Products List Api Calling .....
  static Future<GetProductListModel?> getProductsListApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetProductListModel? getProductListModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfProductList,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getProductListModel =
          GetProductListModel.fromJson(jsonDecode(response.body));
      return getProductListModel;
    }
    return null;
  }

  /// Get Products List Api Calling .....
  static Future<ProductDetailsModel?> getProductsDetailApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    ProductDetailsModel? productDetailsModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfProductDetail,
      checkResponse: checkResponse,
    );
    if (response != null) {
      productDetailsModel =
          ProductDetailsModel.fromJson(jsonDecode(response.body));
      return productDetailsModel;
    }
    return null;
  }

  /// Submit Add To Cart Api Calling .....
  static Future<AddToCartModel?> addToCartApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AddToCartModel? addToCartModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddToCart,
      checkResponse: checkResponse,
    );
    if (response != null) {
      addToCartModel = AddToCartModel.fromJson(jsonDecode(response.body));
      return addToCartModel;
    }
    return null;
  }

  /// Get Add Cart List  Api Calling .....
  static Future<GetCartModel?> getCartListApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetCartModel? getCartModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetCartList,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getCartModel = GetCartModel.fromJson(jsonDecode(response.body));
      return getCartModel;
    }
    return null;
  }

  /// Delete Cart Item  Api Calling .....
  static Future<MessageStatusModel?> deleteCartItemApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    MessageStatusModel? messageStatusModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfDeleteCartItem,
      checkResponse: checkResponse,
    );
    if (response != null) {
      messageStatusModel =
          MessageStatusModel.fromJson(jsonDecode(response.body));
      return messageStatusModel;
    }
    return null;
  }

  /// Add Post Api Calling .....
  static Future<GetUploadPostResponseModel?> addPostApi(
   {  String? imageKey,
     List<File>? images,
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetUploadPostResponseModel? getUploadPostResponseModel;
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddPost,
      imageKey: imageKey,
      images: images,
    );
    if (response != null) {
      getUploadPostResponseModel =
          GetUploadPostResponseModel.fromJson(jsonDecode(response.body));
      return getUploadPostResponseModel;
    }
    return null;
  }

  ///Get My Post  Api Calling .....
  static Future<GetUserPostListModel?> getMyPostApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetUserPostListModel? getUserPostListModel;
    http.Response? response = await MyHttp.getMethodParams(
      queryParameters: bodyParams!,
      baseUri: ApiUrlConstants.baseUrl,
      endPointUri: "get_my_post",
    );
    if (response != null) {
      getUserPostListModel =
          GetUserPostListModel.fromJson(jsonDecode(response.body));
      return getUserPostListModel;
    }
    return null;
  }

  ///Get All Users Post  Api Calling .....
  static Future<GetAllUsersPostModel?> getAllUserPostApi({
    void Function(int)? checkResponse,
    required String uri,
  }) async {
    GetAllUsersPostModel? getAllUsersPostModel;
    http.Response? response = await MyHttp.getMethod(
      url: uri,
    );
    if (response != null) {
      getAllUsersPostModel =
          GetAllUsersPostModel.fromJson(jsonDecode(response.body));
      return getAllUsersPostModel;
    }
    return null;
  }

  ///Get All Users Post  Api Calling .....
  static Future<GetPostDetailsModel?> getPostDetailsApi({
    void Function(int)? checkResponse,
    required String uri,
  }) async {
    GetPostDetailsModel? getPostDetailsModel;
    http.Response? response = await MyHttp.getMethod(
      url: uri,
    );
    if (response != null) {
      getPostDetailsModel =
          GetPostDetailsModel.fromJson(jsonDecode(response.body));
      return getPostDetailsModel;
    }
    return null;
  }

  /// Like and Unlike Api Calling .....
  static Future<GetResponseModel?> likeUnlikeApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetResponseModel? getResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfLikeUnLike,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getResponseModel = GetResponseModel.fromJson(jsonDecode(response.body));
      return getResponseModel;
    }
    return null;
  }
  /// Submit Comment Api Calling .....
  static Future<SubmitCommentResponseModel?> submitCommentApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SubmitCommentResponseModel? submitCommentResponseModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSubmitComment,
      checkResponse: checkResponse,
    );
    if (response != null) {
      submitCommentResponseModel = SubmitCommentResponseModel.fromJson(jsonDecode(response.body));
      return submitCommentResponseModel;
    }
    return null;
  }

  /// FollowUnFollow Api Calling .....
  static Future<GetCommonModel?> followUnfollowApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetCommonModel? getCommonModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfFollowUnFollow,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getCommonModel = GetCommonModel.fromJson(jsonDecode(response.body));
      return getCommonModel;
    }
    return null;
  }

  ///Get Users Search History  Api Calling .....
  static Future<GetSearchHistoryModel?> getSearchHistoryApi({
    void Function(int)? checkResponse,
    required String uri,
  }) async {
    GetSearchHistoryModel? getSearchHistoryModel;
    http.Response? response = await MyHttp.getMethod(
      url: uri,
    );
    if (response != null) {
      getSearchHistoryModel =
          GetSearchHistoryModel.fromJson(jsonDecode(response.body));
      return getSearchHistoryModel;
    }
    return null;
  }
  ///Get FAQ  Api Calling .....
  static Future<GetFAQModel?> getFAQApi({
    void Function(int)? checkResponse,
  }) async {
    GetFAQModel? getFAQModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfFAQ,
    );
    if (response != null) {
      getFAQModel =
          GetFAQModel.fromJson(jsonDecode(response.body));
      return getFAQModel;
    }
    return null;
  }

  ///Get Users Search History  Api Calling .....
  static Future<GetFollowersModel?> getFollowersApi({
    void Function(int)? checkResponse,
    required String uri,
  }) async {
    GetFollowersModel? getFollowersModel;
    http.Response? response = await MyHttp.getMethod(
      url: uri,
    );
    if (response != null) {
      getFollowersModel =
          GetFollowersModel.fromJson(jsonDecode(response.body));
      return getFollowersModel;
    }
    return null;
  }


  /// Submit Delete Search History Calling .....
  static Future<GetCommonModel?> submitDeleteSearchHistoryApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetCommonModel? getCommonModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfDeleteSearchHistory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getCommonModel = GetCommonModel.fromJson(jsonDecode(response.body));
      return getCommonModel;
    }
    return null;
  }

  ///Search Users list by user Name Api Calling .....
  static Future<SearchUserByNameModel?> searchUsersByNameApi({
    void Function(int)? checkResponse,
    required url
  }) async {
    SearchUserByNameModel? searchUserByNameModel;
    http.Response? response = await MyHttp.getMethod(
      url: url,
    );
    if (response != null) {
      searchUserByNameModel =
          SearchUserByNameModel.fromJson(jsonDecode(response.body));
      return searchUserByNameModel;
    }
    return null;
  }

  /// Submit Rate Us Api Calling .....
  static Future<RateUsModel?> submitRateUsApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    RateUsModel? rateUsModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSubmitRateUs,
      checkResponse: checkResponse,
    );
    if (response != null) {
      rateUsModel = RateUsModel.fromJson(jsonDecode(response.body));
      return rateUsModel;
    }
    return null;
  }

}


