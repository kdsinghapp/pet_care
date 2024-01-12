import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_common_model.dart';
import 'package:pet_care/Apis/api_models/get_faq_model.dart';
import 'package:pet_care/Apis/api_models/get_searchHistory_model.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_constants/api_url_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_searchUserName_model.dart';
import '../Common/ShowToast.dart';

class MySearchController extends GetxController{
  TextEditingController searchController=TextEditingController();
  RxInt genderIndex=0.obs;
  double distanceValue=50;
  double ageValue=20;
  RxBool filterProgressBar=false.obs;
  RxBool showSearchHistoryProgressBar=true.obs;
  RxBool showFaqProgressBar=true.obs;
  RxBool showSearchUsersProgressBar=true.obs;
  Map<String,String?> parameters=Get.parameters;
  late Map<String,dynamic> bodyParamsForSubmitDeleteSearchHistoryForm;
  List<String>pawSize=['Miniature','Small','Medium','Large','Very large','Any'];
  GetSearchHistoryModel? getSearchHistoryModel;
  GetFAQModel? getFAQModel;
  SearchUserByNameModel? searchUserByNameModel;
  GetCommonModel? getCommonModel;
  late List<bool> checkFAQList;
  @override
  void onInit() {
    super.onInit();
    getSearchHistory();
    getFAQ();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
 changeDistance(double value){
    distanceValue=value;
 }
  changeAge(double value){
    ageValue=value;
  }

  changeGenderIndex(int index){
    genderIndex.value=index;
  }

  changeFilterProgressBar(bool value){
    filterProgressBar.value=value;
  }

   changeSearchHistoryProgressbar(bool value){
     showSearchHistoryProgressBar.value=value;
   }
  changeFaqProgressbar(bool value){
    showFaqProgressBar.value=value;
  }

  changeSearchUsersProgressbar(bool value){
    showSearchUsersProgressBar.value=value;
  }

  Future<void> getSearchHistory() async {
    String getSearchHistoryUrl='${ApiUrlConstants.endPointOfSearchHistory}?user_id=${parameters['user_id']}';
    print("uri:-"+getSearchHistoryUrl);
    getSearchHistoryModel = await ApiMethods.getSearchHistoryApi( uri: getSearchHistoryUrl);
    if (getSearchHistoryModel!.status!="0"??false ) {
      changeSearchHistoryProgressbar(false);
      searchUserByName(getSearchHistoryModel!.result![0].search!);
      print("Get Search History Successfully complete...");
    }else{
      print("Get Search History Failed....");
      changeSearchHistoryProgressbar(true);
      showToastMessage(getSearchHistoryModel!.message!);
    }
  }

  changeCheckedFaq(int index,bool value){
    checkFAQList[index]=value;
  }

  Future<void> getFAQ() async {
    getFAQModel = await ApiMethods.getFAQApi();
    if (getFAQModel!.status!="0"??false ) {
      checkFAQList=List.generate(getFAQModel!.result!.length, (index) => false);
      changeFaqProgressbar(false);
      print("Get FAQ Successfully complete...");
    }else{
      print("Get FAQ Failed....");
      changeFaqProgressbar(true);
      showToastMessage(getFAQModel!.message!);
    }
  }

  Future<void> submitDeleteSearchHistory() async {
    bodyParamsForSubmitDeleteSearchHistoryForm = {
      ApiKeyConstants.userId:parameters['user_id'],
      ApiKeyConstants.token: parameters['token'],
    };
    print("bodyParamsForDeleteSearchHistory:::::$bodyParamsForSubmitDeleteSearchHistoryForm");
    getCommonModel = await ApiMethods.submitDeleteSearchHistoryApi(bodyParams: bodyParamsForSubmitDeleteSearchHistoryForm);
    if (getCommonModel!.status!="0"??false ) {
      print("Delete Search History Successfully complete...");
    }else{
      print("Delete Search History Failed....");
      showToastMessage(getCommonModel!.message!);
    }
  }


  Future<void> searchUserByName(String name) async {
    String getSearchUserUrl='${ApiUrlConstants.endPointOfSearchUserByName}?user_id=${parameters['user_id']}&search=$name';
    searchUserByNameModel = await ApiMethods.searchUsersByNameApi( url: getSearchUserUrl);
    if (searchUserByNameModel!.status!="0"??false ) {
      changeSearchUsersProgressbar(false);
      print("Get Search Users Successfully complete...");
    }else{
      print("Get Search Users Failed....");
      changeSearchUsersProgressbar(true);
      showToastMessage(searchUserByNameModel!.message!);
    }
  }
}