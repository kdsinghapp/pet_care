import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Activity/TypingActivity.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LanguageController extends GetxController {
  TextEditingController languageController = TextEditingController();
  RxInt selectedLanguage=0.obs;
  List languageName = ['English (US)','Malay'];
  List filterList=[].obs;


  @override
  void onInit() {
    super.onInit();
    showAllLanguage();
    getSavedLanguage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getSavedLanguage()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedLanguageCode = prefs.getString('languageCode') ?? 'en';
    if(savedLanguageCode=="en"){
      selectedLanguage.value=0;
    }else{
      selectedLanguage.value=1;
    }
  }


  showAllLanguage(){
    filterList=languageName;
  }


  filterLanguageList(String query){
    filterList = languageName
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();

  }

  changeLanguage(int index) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    switch(index){
      case 0:{
        selectedLanguage.value=0;
        sharedPreferences.setString("countryCode",'US' );
        sharedPreferences.setString("languageCode",'en' );
        Get.updateLocale(const Locale('en','US'));

      }break;
      case 1:{
        selectedLanguage.value=1;
        sharedPreferences.setString("countryCode",'MY' );
        sharedPreferences.setString("languageCode",'ms' );
        Get.updateLocale(const Locale('ms','MY'));
      }break;
    }

  }
}