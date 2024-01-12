import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pet_care/Apis/api_models/get_notification_model.dart';
import 'package:pet_care/Controller/NotificationController.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';

import '../Constant/string_constants.dart';
import '../Tool/Color.dart';

class NotificationActivity extends StatefulWidget {
  const NotificationActivity({super.key});

  @override
  State<NotificationActivity> createState() => _NotificationState();
}
class _NotificationState extends State<NotificationActivity> {
  NotificationController controller=Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          Column(
            children: [
              const SizedBox(height: 30,),
              ListTile(
                leading: Card(
                  shape:const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  color: primaryColor,
                  elevation: 2,
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.only(left: 5),
                    child: IconButton(onPressed: (){
                      Get.back();
                    }, icon: const Icon(Icons.arrow_back_ios,color: primary3Color,)),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text(StringConstants.notification ,style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center,),
                ),

              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20,bottom: 5,top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex:1,
                            child: Text(StringConstants.newMatches,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.start,)),
                        Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: GFToggle(
                                onChanged: (val){

                                },
                                value: true,
                                enabledTrackColor: primaryColor,
                                enabledThumbColor:primary3Color,
                                type: GFToggleType.ios,
                              ),
                            )
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                            flex:1,
                            child: Text(StringConstants.newMessage,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.start,)),
                        Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.topRight,
                              child: GFToggle(
                                onChanged: (val){

                                },
                                value: false,
                                enabledTrackColor: primaryColor,
                                enabledThumbColor:primary3Color,
                                type: GFToggleType.ios,
                              ),
                            )
                        ),
                      ],
                    ),
                  ],
                ),

              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(() => controller.showProgressbar.value?Text("There are not present notification",style: MyTextStyle.titleStyle14b,):
                    showNotification()),
                  ),
                ),
              ),
            ],
          ),
       
    );
  }


  /// Show Popular Question and Answer...
  Widget showNotification(){
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: controller.getNotificationModel!.result!.length,
      itemBuilder: (context, int index) {
        GetNotificationResult item=controller.getNotificationModel!.result![index];
        return GestureDetector(
            onTap: () {
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              semanticContainer: true,
              clipBehavior: Clip.none,
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              elevation: 0,
              color: primary3Color,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Icon(Icons.notification_important,size: 15,)),
                    Expanded(
                        flex: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.notification!,style: MyTextStyle.titleStyle13b,),
                            const SizedBox(height: 5,),
                            Text(calculateTimeDifference(item.dateTime!),style: MyTextStyle.titleStyle10b,)
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }


  String calculateTimeDifference(String time) {
    DateTime dateTime = DateTime.parse(time);
    Duration difference = DateTime.now().difference(dateTime);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }

}