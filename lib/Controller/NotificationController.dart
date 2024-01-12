
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_constants/api_url_constants.dart';
import 'package:pet_care/Apis/api_models/get_notification_model.dart';

import '../Apis/api_methods/api_methods.dart';
import '../Common/ShowToast.dart';


class NotificationController extends GetxController {
  RxBool showProgressbar=true.obs;
 GetNotificationModel? getNotificationModel;
 Map<String,String?> parameters=Get.parameters;
  @override
  void onInit() {
    super.onInit();
    getNotification();
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
    showProgressbar.value=value;
  }

  getNotification() async{
    String getUrl='${ApiUrlConstants.endPointOfNotification}?user_id=${parameters['user_id']}';
    getNotificationModel = await ApiMethods.getNotificationApi(getUrl: getUrl);
    if (getNotificationModel!.status!="0"??false ) {
      print("Get Notification Successfully complete...");
      changeProgressBar(false);
    }else{
      print("Get Notification Failed....");
      changeProgressBar(true);
      showToastMessage(getNotificationModel!.message!);
    }
  }
}