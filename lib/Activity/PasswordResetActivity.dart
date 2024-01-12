import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:pet_care/Common/ShowToast.dart';
import 'package:pet_care/Constant/string_constants.dart';
import 'package:pet_care/Tool/Color.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';
import '../Controller/PasswordResetController.dart';
class PasswordResetActivity extends StatefulWidget {
  const PasswordResetActivity({super.key, required this.title});
  final String title;

  @override
  State<PasswordResetActivity> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordResetActivity> {
  final formKey = GlobalKey<FormState>();
  PasswordResetController controller=Get.put(PasswordResetController());
  TextEditingController fieldOne = TextEditingController();
  TextEditingController fieldTwo = TextEditingController();
  TextEditingController fieldThree = TextEditingController();
  TextEditingController fieldFour = TextEditingController();


  //int tabIndex=0;

  Widget callingTab(int index){
    switch(index){
      case 0: {
       return enterEmailMobile();
      }
      case 1: {
        return enterOtp();
      }
      case 2: {
        return enterNewPassword();
      }
    }
    return const SizedBox(height: 5,);
  }

  @override
  Widget build(BuildContext context) {
    final heights =MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
          height: heights*1,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image:AssetImage("assets/icons/loginbgimg.png",),
                fit: BoxFit.cover
            ),
          ),
          padding: const EdgeInsets.only(top: 50,left: 10,right: 10,bottom: 10),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Card(
                color: transparentColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: heights*0.9,
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.center,
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
                            child: IconButton(onPressed: (){
                              controller.clickOnBackTabButton();
                              /*   if(controller.tabIndex.value>0){
                                   setState(() {
                                     tabIndex--;
                                   });
                                 }else{
                                   Get.back();
                                 }*/

                            }, icon: const Icon(Icons.arrow_back_ios,color: primary3Color,)),
                          ),
                      ),
                      ),
                     Obx(() =>callingTab(controller.tabIndex.value)),
                    ],
                  ),
                ),
              ),
            ),
          ),

        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  ///Enter Email and Mobile Widget ....
  Widget enterEmailMobile(){
    return Column(
          children: [
            Padding(padding: const EdgeInsets.only(top: 10,left: 30,right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Password Reset,",style: MyTextStyle.titleStyle24bw,),
                  const SizedBox(height: 7,),
                  Text("Please put your email or mobile number to reset your password",style: MyTextStyle.titleStyle14bw,
                    textAlign: TextAlign.center,),
                ],
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
                  autofillHints: const [
                    AutofillHints.email,
                  ],
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 14,
                    fontFamily: 'FontBold',
                  ),
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
                      hintText: "Username or email address",
                      hintStyle: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'FontBold',
                          color: hintColor),
                      prefixIcon: Icon(Icons.email)),

                ),
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 10,left: 40,right: 40),
            child: Row(
              children: [
                const Expanded(
                   flex:5,
                    child:Divider(color: primary3Color,endIndent: 10,thickness: 1,)),
                 Expanded(
                    flex:1,
                    child:Text(" Or ",style: MyTextStyle.titleStyle14bb,)),
                const Expanded(
                    flex:5,
                    child:Divider(color: primary3Color,indent: 10,thickness: 1,)),
              ],
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
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
                  controller: controller.phoneController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(Radius.circular(10)),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      hintText: "Please enter Mobile Number",
                      hintStyle: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'FontBold',
                          color: hintColor),
                      prefixIcon: Icon(Icons.phone_android)),
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
              margin: const EdgeInsets.only(left: 20,right: 20,top: 60),
              child: TextButton(
                onPressed: (){
                  if(controller.emailController.text.isNotEmpty ||controller.phoneController.text.isNotEmpty){
                    controller.showSendOtpProgressbar(true);
                    controller.callingSendOtpForm();
                  }else{
                    showToastMessage("Please Enter Email id...");
                  }
                },
                style: TextButton.styleFrom(backgroundColor: primaryColor),
                child:    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Visibility(
                        visible: controller.showSendOtpProgressbar.value,
                        child: const SizedBox(
                            height:30,width:30,
                            child:CircularProgressIndicator(color:primary3Color,)
                        )
                    )),
                    const SizedBox(width: 10,),
                    Obx(() => controller.showSendOtpProgressbar.value?Text("Loading...",style: MyTextStyle.titleStyle16bw,):
                    Text(StringConstants.next,style: MyTextStyle.titleStyle16bw,),),

                  ],
                ),
              ),
            ),
          ],
        );
  }

  ///Enter Otp Widget ....
  Widget enterOtp(){
    return Column(
      crossAxisAlignment:CrossAxisAlignment.center,
      children: [
        Padding(padding: const EdgeInsets.only(top: 10,left: 30,right: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Check your mail",style: MyTextStyle.titleStyle24bw,),
              const SizedBox(height: 7,),
              Text("Please put the 4 digits sent to you",style: MyTextStyle.titleStyle14bw,
                textAlign: TextAlign.center,),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 60),
          child: SizedBox(
            width: double.infinity,
            height: 50 ,
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpInput(fieldOne, true), // auto focus
                OtpInput(fieldTwo, false),
                OtpInput(fieldThree, false),
                OtpInput(fieldFour, false)
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.35,
        ),
        Container(
          width: double.infinity,
          height: 45,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.only(left: 20,right: 20,bottom: 60),
          child: TextButton(
            onPressed: (){
             String otp = fieldOne.text + fieldTwo.text + fieldThree.text + fieldFour.text;
              controller.showVerifyOtpProgressbar(true);
              controller.callingVerifyOtpForm(otp);
            },
            style: TextButton.styleFrom(backgroundColor: primaryColor),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Visibility(
                    visible: controller.showVerifyOtpProgressbar.value,
                    child: const SizedBox(
                        height:30,width:30,
                        child:CircularProgressIndicator(color:primary3Color,)
                    )
                )),
                const SizedBox(width: 10,),
                Obx(() => controller.showVerifyOtpProgressbar.value?Text("Loading...",style: MyTextStyle.titleStyle16bw,):
                Text(StringConstants.next,style: MyTextStyle.titleStyle16bw,),),

              ],
            ),
          ),
        ),
      ],
    );
  }

  ///Enter New Password Widget ....
  Widget enterNewPassword(){
    return Column(
      crossAxisAlignment:CrossAxisAlignment.center,
      children: [
        Padding(padding: const EdgeInsets.only(top: 10,left: 30,right: 30),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Reset Password",style: MyTextStyle.titleStyle24bw,),
                const SizedBox(height: 7,),
                Text("Please enter strong password with spacial characters and numbers ",style: MyTextStyle.titleStyle14bw,
                  textAlign: TextAlign.center,),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
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
                RequiredValidator(errorText: 'Enter New Password'),
                MinLengthValidator(6,
                    errorText: 'Minimum 6 character filled password'),
              ]),
              controller: controller.passwordController,
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
                  hintText: "New Password",
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
                RequiredValidator(errorText: 'Enter Conform Password'),
                MinLengthValidator(6,
                    errorText: 'Minimum 6 character filled password'),
              ]),
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
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'FontBold',
                      color: hintColor),),

            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*0.25,
        ),
        Container(
          width: double.infinity,
          height: 45,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.only(left: 20,right: 20,bottom: 60),
          child: TextButton(
            onPressed: (){
              if(formKey.currentState!.validate()){
                if(controller.passwordController.text.toString()==controller.cnfPasswordController.text.toString()){
                  controller.showPasswordProgressbar(true);
                  controller.callingResetPasswordForm();
                }else{
                  showToastMessage("New password and conform password are not matched ...");
                }
              }

            },
            style: TextButton.styleFrom(backgroundColor: primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Visibility(
                    visible: controller.showPasswordProgressbar.value,
                    child: const SizedBox(
                        height:30,width:30,
                        child:CircularProgressIndicator(color:primary3Color,)
                    )
                )),
                const SizedBox(width: 10,),
                Obx(() => controller.showPasswordProgressbar.value?Text("Loading...",style: MyTextStyle.titleStyle16bw,):
                Text(StringConstants.next,style: MyTextStyle.titleStyle16bw,),),

              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 50,
      decoration: const BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.all(Radius.circular(5),),

      ),
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration:  const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}