import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Constant/image_constants.dart';
import 'package:pet_care/Constant/string_constants.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';

import '../Controller/ProfileController.dart';
import '../Tool/Color.dart';

class ProfileActivity extends StatefulWidget {
  const ProfileActivity({super.key});

  @override
  State<ProfileActivity> createState() => _ProfileState();
}
class _ProfileState extends State<ProfileActivity> {

  ProfileController controller=Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx(() =>controller.count.value!=0?
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20,bottom: 5),
                  margin: const EdgeInsets.only( top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80,width: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child:Obx(() =>
                          controller.profileImage.isEmpty?Image.asset(ImageConstants.icUser,height: 80,width: 80,fit: BoxFit.cover,):
                          Center(
                            child: CachedNetworkImage(
                              imageUrl: controller.profileImage.value,
                              placeholder: (BuildContext context, String url) => Image.asset(ImageConstants.icUser,height: 80,width: 80,fit: BoxFit.cover,),
                              errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.icUser,height: 80,width: 80,fit: BoxFit.cover,),
                            ),
                          ),
                            /*Image.network(controller.profileImage.value,fit:BoxFit.fill,
                          errorBuilder:
                              (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return const Icon(Icons.person,size: 80,);
                          },
                        ),*/
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Obx(() => Text(controller.name.value,style: MyTextStyle.titleStyle16bb,)),
                      const SizedBox(height: 10,),
                      Obx(() => Text(controller.email.value,style: MyTextStyle.titleStyle12b,)),
                      const SizedBox(height: 20,),
                      mainProfileList(),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20,bottom: 10,top: 20),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("More",style: MyTextStyle.titleStyle16b,),
                            ),

                          ],
                        ),
                      ),
                      moreProfileList(),
                      Container(
                        width: double.infinity,
                        height: 45,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        clipBehavior: Clip.hardEdge,
                        margin: const EdgeInsets.only(top: 20,left: 10,right: 10),
                        child: TextButton(
                          onPressed: (){
                            openLogoutAlertBox();
                          },
                          style: TextButton.styleFrom(backgroundColor: primaryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() => Visibility(
                                  visible: controller.showProgressbar.value,
                                  child: const SizedBox(
                                      height:30,width:30,
                                      child:CircularProgressIndicator(color:primary3Color,)
                                  )
                              )),
                              const SizedBox(width: 10,),
                              Obx(() => controller.showProgressbar.value?Text("Loading...",style: MyTextStyle.titleStyle16bw,):
                              Text(StringConstants.logout,style: MyTextStyle.titleStyle16bw,),),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 45,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //color: Colors.redAccent
                        ),
                        clipBehavior: Clip.hardEdge,
                        margin: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 40),
                        child: TextButton(
                          onPressed: (){
                            controller.changeDeleteProgressbarStatus(true);
                            controller.callingDeleteAccountForm();
                          },
                          style: TextButton.styleFrom(backgroundColor: primary3Color),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Obx(() => Visibility(
                                  visible: controller.showDeleteProgressbar.value,
                                  child: const SizedBox(
                                      height:30,width:30,
                                      child:CircularProgressIndicator(color:primaryColor,)
                                  )
                              )),
                              const SizedBox(width: 10,),
                              Obx(() => controller.showDeleteProgressbar.value?Text("Loading...",style: MyTextStyle.titleStyle16by,):
                              const Text(StringConstants.deleteAccount,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.redAccent),),),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ),


              ],
            ),
          ):const SizedBox(),
      )
    );
  }

  Widget mainProfileList(){
    return  ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.list1.length,
      itemBuilder: (context, index){
        return
          Column(
            children: [
              ListTile(
                onTap: ()=>controller. openMainProfilePages(index),
                leading: SizedBox(
                  height: 40,width: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      controller.mainIconList[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title:  Text(controller.list1[index],style: MyTextStyle.titleStyle16bb,),
                trailing: const Icon(Icons.arrow_forward_ios,size: 20,color: Colors.black26,),

              ),
            ],
          );
      },);
  }
  Widget moreProfileList(){
    return  ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.list2.length,
      itemBuilder: (context, index){
        return
          Column(
            children: [
              ListTile(
                onTap: ()=>controller. openMoreProfilePages(index),
                leading: SizedBox(
                height: 40,width: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      controller.moreIconList[index],
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                title:  Text(controller.list2[index],style: MyTextStyle.titleStyle16bb,),
                trailing: const Icon(Icons.arrow_forward_ios,size: 20,color: Colors.black26,),


              ),
            ],
          );
      },);
  }



  /// Show Diolog Box...
  void openLogoutAlertBox(){
    showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        title: const Text("Alert Dialog Box"),
        content: const Text("Do you want to logout ? ..."),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              controller.changeProgressbarStatus(false);
             controller.callingLogoutForm();
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              child: const Text("Ok"),
            ),
          )
        ],
      ),
    );
  }
}