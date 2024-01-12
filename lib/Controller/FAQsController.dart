import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_privacyPolicy_model.dart';

import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_faq_model.dart';
import '../Common/ShowToast.dart';

class FQAsController extends GetxController{

  RxBool progressBar=true.obs;
  late List<bool> checkFAQList;
  GetFAQModel? getFAQModel;
  @override
  void onInit() {
    super.onInit();
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

  changeProgressBar(bool value){
    progressBar.value=value;
  }

  changeCheckedFaq(int index,bool value){
    checkFAQList[index]=value;
  }


  Future<void> getFAQ() async {
    getFAQModel = await ApiMethods.getFAQApi();
    if (getFAQModel!.status!="0"??false ) {
      checkFAQList=List.generate(getFAQModel!.result!.length, (index) => false);
      changeProgressBar(false);
      print("Get FAQ Successfully complete...");
    }else{
      print("Get FAQ Failed....");
      changeProgressBar(true);
      showToastMessage(getFAQModel!.message!);
    }
  }


}