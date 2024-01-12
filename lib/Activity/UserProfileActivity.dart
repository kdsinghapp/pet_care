import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';

import '../Constant/icons_constants.dart';
import '../Constant/image_constants.dart';
import '../Constant/string_constants.dart';
import '../Controller/UserProfileController.dart';
import '../Tool/Color.dart';

class UserProfileActivity extends StatefulWidget {
  const UserProfileActivity({super.key});

  @override
  State<UserProfileActivity> createState() => _UserProfileState();


}


class _UserProfileState extends State<UserProfileActivity> {

  UserProfileController controller=Get.put(UserProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10,bottom: 5),
              margin: const EdgeInsets.only( top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    leading: Card(
                      shape:const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      color: primaryColor,
                      elevation: 2,
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.only(top: 10),
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
                      child: Text(StringConstants.profile ,style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center,),
                    ),

                  ),
                  SizedBox(
                    height: 80,width: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child:Obx(() =>
                      controller.profileImage.isEmpty?const Icon(Icons.person,size: 80,):
                      Image.network(controller.profileImage.value,fit:BoxFit.fill,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) return const Icon(Icons.person,size: 80,);
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                        errorBuilder:
                            (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return const Icon(Icons.person,size: 80,);
                        },
                      ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Obx(() => Text(controller.name.value,style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.end,)),
                  const SizedBox(height: 10,),
                  Obx(() => Text(controller.email.value,style: MyTextStyle.titleStyle12b,textAlign: TextAlign.end,)),
                  const SizedBox(height: 20,),


                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20,bottom: 10,top: 20),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(StringConstants.personalInfo,style: MyTextStyle.titleStyle16b,),
                            ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(
                              flex:1,
                                child: Text(StringConstants.yourName,style: MyTextStyle.titleStyle14b,textAlign: TextAlign.start,)),
                            Expanded(
                              flex: 1,
                              child: Obx(() => Text(controller.name.value,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.end,)),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                                flex:1,
                                child: Text(StringConstants.occupation,style: MyTextStyle.titleStyle14b,textAlign: TextAlign.start,)),
                            Expanded(
                                flex: 1,
                                child: Text("Manager",style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.end,)),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                                flex:1,
                                child: Text(StringConstants.employer,style: MyTextStyle.titleStyle14b,textAlign: TextAlign.start,)),
                            Expanded(
                                flex: 1,
                                child: Obx(() => Text(controller.employer.value,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.end,)),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                                flex:1,
                                child: Text(StringConstants.usCitizen,style: MyTextStyle.titleStyle14b,textAlign: TextAlign.start,)),
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
                        const SizedBox(height: 30,),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(StringConstants.contactInfo,style: MyTextStyle.titleStyle16b,),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            Expanded(
                                flex:1,
                                child: Text(StringConstants.phoneNumber,style: MyTextStyle.titleStyle14b,textAlign: TextAlign.start,)),
                            Expanded(
                                flex: 1,
                              child:Obx(() => Text(controller.phone.value,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.end,)),
                            )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                                flex:1,
                                child: Text(StringConstants.email,style: MyTextStyle.titleStyle14b,textAlign: TextAlign.start,)),
                            Expanded(
                                flex: 1,
                              child:Obx(() => Text(controller.email.value,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.end,)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          width: double.infinity,
                          height: 45,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          clipBehavior: Clip.hardEdge,
                          margin: const EdgeInsets.only(top: 10),
                          child: TextButton(
                            onPressed: (){
                              controller.openEditPages();
                            },
                            style: TextButton.styleFrom(backgroundColor: primaryColor),
                            child: Text(StringConstants.edit,style: MyTextStyle.titleStyle16bw,),
                          ),
                        ),

                      ],
                    ),
                  ),


                ],
              ),

            ),


          ],
        ),
      ),
    );
  }

}