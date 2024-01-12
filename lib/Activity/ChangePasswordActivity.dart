import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Common/ShowToast.dart';
import 'package:pet_care/Controller/ChangePasswordController.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';

import '../Constant/string_constants.dart';
import '../Tool/Color.dart';

class ChangePasswordActivity extends StatefulWidget {
  const ChangePasswordActivity({super.key});

  @override
  State<ChangePasswordActivity> createState() => _ChangePasswordState();
}
class _ChangePasswordState extends State<ChangePasswordActivity> {
  ChangePasswordController controller=Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child:Container(
          width: double.infinity,
          height: 45,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
          child: TextButton(
            onPressed: (){
              if(controller.newPasswordController.text.toString()==controller.cnfPasswordController.text.toString()){
                controller.callingSubmitChangePasswordForm();
              }else{
                showToastMessage("New password and conform password not matched..");
              }

            },
            style: TextButton.styleFrom(backgroundColor: primaryColor),
            child: Text(StringConstants.save,style: MyTextStyle.titleStyle16bw,),
          ),
        ),
      ),
      body:  Column(
        children: [
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
                  child: Text(StringConstants.changePassword ,style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center,),
                ),

              ),
              Container(
                padding: const EdgeInsets.only(bottom: 5,top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
                      child:
                      Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        elevation: 2,
                        color: primary3Color,
                        child:
                        TextFormField(
                          style: const TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontFamily: 'FontBold',
                          ),
                          controller: controller.currentPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                              border:OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              isDense: true,
                              contentPadding:EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              hintText: StringConstants.currentPassword,
                              hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'FontBold',
                                  color: hintColor),
                              prefixIcon: Icon(Icons.lock)),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        elevation: 2,
                        color: primary3Color,
                        child:
                        TextFormField(
                          style: const TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontFamily: 'FontBold',
                          ),
                          controller: controller.newPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              hintText: StringConstants.newPassword,
                              hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'FontBold',
                                  color: hintColor),
                              prefixIcon: Icon(Icons.lock)),


                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        elevation: 2,
                        color: primary3Color,
                        child:
                        TextFormField(
                          style: const TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontFamily: 'FontBold',
                          ),
                          controller: controller.cnfPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                              ),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 10.0),
                              hintText: StringConstants.conformPassword,
                              hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'FontBold',
                                  color: hintColor),
                              prefixIcon: Icon(Icons.lock)),


                        ),

                      ),
                    ),

                  ],
                ),

              ),
            ],
          ),
        ],
      ),
    );
  }

}