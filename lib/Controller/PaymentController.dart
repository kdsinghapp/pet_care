
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_cartItem_model.dart';


class PaymentController extends GetxController {
  TextEditingController fullNameController=TextEditingController();
  TextEditingController cardNumberController=TextEditingController();
  TextEditingController cvvController=TextEditingController();
  List nameList = ['Pedigree Puppy Chicken and Milk Dog Food 2.8 Kg','Grain-Friendly Kibble Sampler Pack','Indonesian'];
  List filterList=[].obs;
  dynamic argumentData = Get.arguments;
  RxBool showProgressBar=false.obs;
  RxBool passwordVisible=false.obs;

  @override
  void onInit() {
    super.onInit();
    showAllUsers();
    GetCartModel getCartModel=argumentData;
    print(getCartModel.result!.length.toString());
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
    filterList=nameList;
  }

  changePasswordVisible(bool value){
    passwordVisible.value=value;
  }

  openChatPages(){
    //Get.to(()=>const TypingActivity());
  }
}