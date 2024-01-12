
import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constant/string_constants.dart';

class SplashController extends GetxController{

  late SharedPreferences sharedPreferences;
  @override
  void onInit() {
    super.onInit();
    splashDuration();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  splashDuration() async{
    sharedPreferences = await SharedPreferences.getInstance();
    Timer(const Duration(seconds: 2),
            () {
             // Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!)??"";
              if(sharedPreferences.getString(StringConstants.userData)!=null){
                Get.offAndToNamed('/mainActivity');
              }else{
                Get.offAndToNamed('/getStartActivity');
              }
            }
        );
  }

}