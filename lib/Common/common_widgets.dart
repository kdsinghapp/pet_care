import 'dart:async';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

class CommonWidgets {
  static final isConnect = false.obs;
  final Connectivity connectivity = Connectivity();

  static Future<bool> internetConnectionCheckerMethod() async {
    bool result = await InternetConnectionChecker().hasConnection;
    return result;
  }

  Future<void> getNetworkConnectionType() async {
    try {
      ConnectivityResult connectivityResult;
      connectivityResult = await connectivity.checkConnectivity();
      return updateConnectionState(
          result: connectivityResult, context: Get.context!);
    } on PlatformException catch (e) {
      showSnackBar(message: e.message.toString(), context: Get.context!);
    }
  }

  StreamSubscription checkNetworkConnection() {
    bool networkConnection = false;
    return connectivity.onConnectivityChanged.listen((event) async {
      networkConnection = await internetConnectionCheckerMethod();
      if (networkConnection) {
        isConnect.value = true;
      } else {
        isConnect.value = false;
        /*showSnackBar(
            message: "Check your internet connection!", context: Get.context!);*/
      }
      return updateConnectionState(result: event, context: Get.context!);
    });
  }


  void updateConnectionState(
      {required BuildContext context, required ConnectivityResult result}) {
    switch (result) {
      case ConnectivityResult.wifi:
        break;
      case ConnectivityResult.mobile:
        break;
      case ConnectivityResult.none:
        break;
      default:
        showSnackBar(message: 'Network Error', context: Get.context!);
        break;
    }
  }

  static void networkConnectionShowSnackBar() {
    showSnackBar(
        message: "Check Your Internet Connection", context: Get.context!);
  }
  static void showSnackBar(
      {required String message, BuildContext? context, Duration? duration}) {
    /*var snackBar = SnackBar(
      elevation: 4,
      backgroundColor: Theme.of(Get.context!).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.px),
        side: BorderSide(color: Theme.of(Get.context!).primaryColor),
      ),
      content: Text(
        message,
        style: Theme.of(Get.context!).textTheme.titleMedium?.copyWith(
            fontSize: 12.px,
            color: Theme.of(Get.context!).scaffoldBackgroundColor),
      ),
       margin: EdgeInsets.only(left: 8.px, right: 6.px, bottom: 40.px),
      behavior: SnackBarBehavior.floating,
      duration: duration ?? const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);*/
  }

  ///For Check Post Api Response
  static Future<bool> responseCheckForPostMethod(
      {http.Response? response}) async {
    Map<String, dynamic> responseMap = jsonDecode(response?.body ?? "");
    if (response != null && response.statusCode == 200) {
      return true;
    } else if (response != null && response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }

  ///For Check Get Api Response
  static Future<bool> responseCheckForGetMethod(
      {http.Response? response,
        bool wantSuccessToast = false,
        bool wantErrorToast = true,}) async {
    Map<String, dynamic> responseMap = jsonDecode(response?.body ?? "");
    if (response != null && response.statusCode == 200) {
      return true;
    } else if (response != null &&
        response.statusCode == 401) {
      return false;
    } else {
      return false;
    }
  }
}

enum ErrorAnimationType { shake, clear }