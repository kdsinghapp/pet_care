import 'package:get/get.dart';

import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_termsCondition_model.dart';
import '../Common/ShowToast.dart';

class TermsConditionController extends GetxController{

  RxBool progressBar=true.obs;
  TermsConditionModel? termsConditionModel;
  @override
  void onInit() {
    super.onInit();
    getTermsConditions();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changeProgressBar(bool value){
    progressBar.value=value;
  }


  getTermsConditions() async{
    termsConditionModel = await ApiMethods.getTermsConditionApi();
    if (termsConditionModel!.status!="0"??false ) {
      print("Get Terms And Condition Successfully complete...");
      changeProgressBar(false);
    }else{
      print("Get Privacy Policy Failed....");
      changeProgressBar(true);
      showToastMessage(termsConditionModel!.message!);
    }
  }


}