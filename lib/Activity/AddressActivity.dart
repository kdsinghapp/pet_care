import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:pet_care/Constant/image_constants.dart';
import 'package:pet_care/Constant/string_constants.dart';
import 'package:pet_care/Controller/AddressController.dart';
import 'package:pet_care/Controller/SingUpController.dart';
import 'package:pet_care/Tool/Color.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';
class AddressActivity extends StatefulWidget {
  const AddressActivity({super.key});

  @override
  State<AddressActivity> createState() => _AddressState();
}

class _AddressState extends State<AddressActivity> {
  AddressController controller=Get.put(AddressController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
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
                child: Text(StringConstants.address ,style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,),
              ),

            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10,bottom: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 20,right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(StringConstants.shippingAddress ,style: MyTextStyle.titleStyle16by,textAlign: TextAlign.start,),
                            const SizedBox(height: 5,),
                            Row(
                              children: [
                                Expanded(
                                  flex:3,
                                    child:Text("Mario Dos Reis Alfredo 928776254 benfica via express luanda luanda Angola 0000",style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.start,), ),
                                Expanded(
                                  flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: IconButton(onPressed: (){},
                                          icon: const Icon(Icons.arrow_forward_ios,size: 25,color: primaryColor,)),
                                    ))
                              ],
                            )
                          ],
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10,top: 30),
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
                                    RequiredValidator(errorText: 'Enter First Name'),
                                  ]),
                                  controller: controller.fullNameController,
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
                                    hintText: "First Name",
                                    hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'FontBold',
                                        color: hintColor),
                                  ),

                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10,top: 17),
                                    padding: const EdgeInsets.only(left: 5,top: 4,bottom: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(color: text2Color,width: 1)
                                    ),
                                    child: Row(
                                      children: [
                                      SizedBox(
                                        height:35 ,width: 30,
                                          child: Image.asset(ImageConstants.flag,)),
                                        Text("+91",style: MyTextStyle.titleStyle14bb)
                                    ],),
                                  ),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10,top: 20),
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
                                          RequiredValidator(errorText: 'Enter Phone'),
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
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
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
                                    RequiredValidator(errorText: 'Enter Area'),
                                  ]),
                                  controller: controller.areaController,
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration:  InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                    ),
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 15.0, horizontal: 10.0),
                                    hintText: "Area",
                                    hintStyle: const TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'FontBold',
                                        color: hintColor),
                                    suffixIcon: IconButton(
                                        icon: const Icon(Icons.location_on,color: greenColor,size: 20,),
                                        onPressed:(){})
                                  ),
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
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
                                    RequiredValidator(errorText: 'Enter Address'),
                                  ]),
                                  controller: controller.addressController,
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
                                    hintText: "Address",
                                    hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'FontBold',
                                        color: hintColor),),
                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
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
                                    RequiredValidator(errorText: 'Enter Address Title'),
                                  ]),
                                  controller: controller.addressTitleController,
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
                                    hintText: "Address Title",
                                    hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'FontBold',
                                        color: hintColor),),
                                ),

                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 65,
                              padding: const EdgeInsets.only(left: 25,right: 25,top: 20),
                              child: TextButton(
                                onPressed: (){
                                  if(formKey.currentState!.validate()){
                                    //  controller.changeProgressbarStatus(true);
                                    controller.openToPaymentPage();
                                  }
                                },
                                style: TextButton.styleFrom(backgroundColor: primaryColor),
                                child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Obx(() => Visibility(
                                        visible: controller.showProgressBar.value,
                                        child: const SizedBox(
                                            height:30,width:30,
                                            child:CircularProgressIndicator(color:primary3Color,)
                                        )
                                    )),
                                    const SizedBox(width: 10,),
                                    Obx(() => controller.showProgressBar.value?Text("Loading...",style: MyTextStyle.titleStyle16bw,):
                                    Text(StringConstants.submit,style: MyTextStyle.titleStyle16bw,),),

                                  ],
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}