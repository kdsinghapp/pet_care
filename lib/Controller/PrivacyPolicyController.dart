
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_privacyPolicy_model.dart';

import '../Apis/api_methods/api_methods.dart';
import '../Common/ShowToast.dart';

class PrivacyPolicyController extends GetxController{

  RxBool progressBar=true.obs;
   PrivacyPolicyModel? privacyPolicyModel;
  @override
  void onInit() {
    super.onInit();
    getPrivacyPolicy();
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


  getPrivacyPolicy() async{
    privacyPolicyModel = await ApiMethods.getPrivacyPolicyApi();
    if (privacyPolicyModel!.status!="0"??false ) {
      print("Get Privacy Policy Successfully complete...");
      changeProgressBar(false);
    }else{
      print("Get Privacy Policy Failed....");
      changeProgressBar(true);
      showToastMessage(privacyPolicyModel!.message!);
    }
  }


}