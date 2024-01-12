import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_care/Activity/MainActivity.dart';
import 'package:pet_care/Activity/NotificationActivity.dart';
import 'package:pet_care/Activity/PasswordResetActivity.dart';
import 'package:pet_care/Activity/ProductDetailActivity.dart';
import 'package:pet_care/Activity/SearchActivity.dart';
import 'package:pet_care/Tool/Styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Activity/AddressActivity.dart';
import 'Activity/GetStartActivity.dart';
import 'Activity/LogInActivity.dart';
import 'Activity/NewPostActivity.dart';
import 'Activity/PaymentActivity.dart';
import 'Activity/RateUsActivity.dart';
import 'Activity/SignUpActivity.dart';
import 'Activity/SplashActivity.dart';
import 'Activity/UsersPostDetailsActivity.dart';
import 'language/AppTranslations.dart';

void main() async{
  await GetStorage.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final String savedLanguageCode = prefs.getString('languageCode') ?? 'en';
  final String savedCountryCode = prefs.getString('countryCode') ?? 'US';
  final savedLocale = Locale(savedLanguageCode, savedCountryCode);

  runApp(MyApp(savedLocale: savedLocale));
}

class MyApp extends StatelessWidget {
  final Locale savedLocale;
  const MyApp({super.key, required this.savedLocale});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pet Care',
      getPages: [
        GetPage(name: '/getStartActivity', page: ()=>const GetStartActivity(title:"Get Start Activity")),
        GetPage(name: '/logInActivity', page: ()=>const LogInActivity(title:"LogIn Activity")),
        GetPage(name: '/signUpActivity', page: ()=>const SignUpActivity(title:"SignUp Activity")),
        GetPage(name: '/passwordResetActivity', page: ()=>const PasswordResetActivity(title:"Password Reset Activity")),
        GetPage(name: '/mainActivity', page: ()=>const MainActivity(title:"Main Activity")),
        GetPage(name: '/productDetailActivity', page: ()=>const ProductDetailActivity()),
        GetPage(name: '/newPostActivity', page: ()=>const NewPostActivity()),
        GetPage(name: '/addressActivity', page: ()=>const AddressActivity()),
        GetPage(name: '/paymentActivity', page: ()=>const PaymentActivity()),
        GetPage(name: '/usersPostDetailsActivity', page: ()=>const UsersPostDetailsActivity()),
        GetPage(name: '/searchActivity', page: ()=>const SearchActivity()),
        GetPage(name: '/rateUsActivity', page: ()=>const RateUsActivity()),
        GetPage(name: '/notificationActivity', page: ()=>const NotificationActivity()),
        
      ],
    /*  routes: {
        '/getStartActivity':(context)=> const GetStartActivity(title:"Get Start Activity"),
        '/logInActivity':(context)=>const LogInActivity(title:"LogIn Activity"),
      },*/
      translations: AppTranslations(),
      locale: savedLocale,      //const  Locale('ms','MY'),
      fallbackLocale: const Locale('en', 'US'),
      theme: Styles.themeData(false, context),
      debugShowCheckedModeBanner: false,
      home: const SplashActivity(title: 'Splash Activity'),
    );
  }
}


