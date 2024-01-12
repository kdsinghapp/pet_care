import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:pet_care/Constant/image_constants.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';

import '../Constant/string_constants.dart';
import '../Controller/SupportController.dart';
import '../Tool/Color.dart';

class SupportActivity extends StatefulWidget {
  const SupportActivity({super.key});

  @override
  State<SupportActivity> createState() => _SupportState();
}
class _SupportState extends State<SupportActivity> {
  final _formKey = GlobalKey<FormState>();
  SupportController controller=Get.put(SupportController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  child: Text(StringConstants.support ,style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center,),
                ),

              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20,bottom: 5,top: 10),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 250,width: 350,
                            child: Image.asset(ImageConstants.imageSupport,fit: BoxFit.fill,),
                          ),
                          const SizedBox(height: 5,),
                          Text(StringConstants.howCanWeHelpYou ,style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,),
                          const SizedBox(height: 10,),
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
                                validator: MultiValidator([
                                  RequiredValidator(errorText: 'Enter Name'),
                                ]),
                                controller: controller.nameController,
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
                                  hintText: "Name",
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
                                autofillHints: const [
                                  AutofillHints.email,
                                ],
                                style: const TextStyle(
                                  color: textColor,
                                  fontSize: 14,
                                  fontFamily: 'FontBold',
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(errorText: 'Enter Email id'),
                                ]),
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
                                  hintText: "Email",
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
                                validator: MultiValidator([
                                  RequiredValidator(errorText: 'Enter Phone Number'),
                                ]),
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
                                  hintText: "Phone",
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
                                validator: MultiValidator([
                                  RequiredValidator(errorText: 'Enter Message'),
                                ]),
                                maxLines: 4,
                                controller: controller.messageController,
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
                                  hintText: "Message ....",
                                  hintStyle: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'FontBold',
                                      color: hintColor),),
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 45,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            clipBehavior: Clip.hardEdge,
                            margin: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 30),
                            child: TextButton(
                              onPressed: (){
                                if(_formKey.currentState!.validate()){
                                  controller.changeProgressbarStatus(true);
                                  controller.callingSubmitSupportForm();
                                }
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
                                  Text(StringConstants.send,style: MyTextStyle.titleStyle16bw,),),

                                ],
                              ),
                            ),
                          ),
                        /*  Text(StringConstants.testText ,style: MyTextStyle.titleStyle14b,textAlign: TextAlign.center,),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                flex:1,
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    margin: const EdgeInsets.only(right: 20),
                                    child: SizedBox(
                                      height: 100,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 60,height: 60,
                                            child: Image.asset(ImageConstants.imageChatUs,fit: BoxFit.fill,),

                                          ),
                                          Text(StringConstants.chatUs ,style: MyTextStyle.titleStyle18bb,textAlign: TextAlign.center,),
                                        ],
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex:1,
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    margin: const EdgeInsets.only(left: 20),
                                    child: SizedBox(
                                      height: 100,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 60,height: 60,
                                            child: Image.asset(ImageConstants.imageEmailUs,fit: BoxFit.fill,),

                                          ),
                                          Text(StringConstants.emailUs ,style: MyTextStyle.titleStyle18bb,textAlign: TextAlign.center,),
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          )*/
                        ],
                      ),
                    ),

                  ),
                ),
              ),
            ],
          ),

    );
  }

}