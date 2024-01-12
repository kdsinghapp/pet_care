import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';

import '../Constant/string_constants.dart';
import '../Controller/EditProfileController.dart';
import '../Tool/Color.dart';

class EditProfileActivity extends StatefulWidget {
  const EditProfileActivity({super.key});

  @override
  State<EditProfileActivity> createState() => _EditProfileState();


}


class _EditProfileState extends State<EditProfileActivity> {

  EditProfileController controller=Get.put(EditProfileController());
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
                      child: Text(StringConstants.editProfile ,style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center,),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
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
                        controller: controller.firstNameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border:OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          isDense: true,
                          contentPadding:EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          labelText: StringConstants.firstName,
                          hintText: StringConstants.firstName,
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'FontBold',
                              color: hintColor),
                        ),

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
                        controller: controller.lastNameController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border:OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          isDense: true,
                          contentPadding:EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          labelText: StringConstants.lastName,
                          hintText: StringConstants.lastName,
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'FontBold',
                              color: hintColor),),

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
                        autofillHints: const [AutofillHints.addressCity,
                          AutofillHints.location],
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontFamily: 'FontBold',
                        ),
                        controller: controller.addressController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border:OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          isDense: true,
                          contentPadding:EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          labelText: StringConstants.address,
                          hintText: StringConstants.address,
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'FontBold',
                              color: hintColor),),
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
                        autofillHints: const [
                          AutofillHints.email,
                        ],
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontFamily: 'FontBold',
                        ),
                        readOnly: true,
                        controller: controller.emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border:OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          isDense: true,
                          contentPadding:EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          labelText: StringConstants.email,
                          hintText: StringConstants.email,
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'FontBold',
                              color: hintColor),),

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
                        autofillHints: const [
                          AutofillHints.telephoneNumber,
                        ],
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontFamily: 'FontBold',
                        ),
                        controller: controller.phoneNumberController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border:OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          isDense: true,
                          contentPadding:EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          labelText: StringConstants.phone,
                          hintText: StringConstants.phone,
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'FontBold',
                              color: hintColor),),

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
                        controller: controller.ageController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          labelText: StringConstants.age,
                          hintText: StringConstants.age,
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'FontBold',
                              color: hintColor),),
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
                        controller: controller.genderController,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          labelText: StringConstants.gender,
                          hintText: StringConstants.gender,
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'FontBold',
                              color: hintColor),),
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
                        controller: controller.categoryController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          labelText: StringConstants.category,
                          hintText: StringConstants.category,
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'FontBold',
                              color: hintColor),),
                      ),

                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20,bottom: 10,top: 20),
                    child: Column(
                      children: [

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
                              controller.callingSubmitUpdateProfileForm();
                            },
                            style: TextButton.styleFrom(backgroundColor: primaryColor),
                            child: Text(StringConstants.save,style: MyTextStyle.titleStyle16bw,),
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