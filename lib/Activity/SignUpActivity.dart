import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:pet_care/Controller/SingUpController.dart';
import 'package:pet_care/Tool/Color.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';
class SignUpActivity extends StatefulWidget {
  const SignUpActivity({super.key, required this.title});
  final String title;

  @override
  State<SignUpActivity> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpActivity> {
  SingUpController controller=Get.put(SingUpController());
  final formKey = GlobalKey<FormState>();

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
          padding: const EdgeInsets.only(top: 40,left: 10,right: 10,bottom: 10),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Card(
                color: transparentColor,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50,),
                        Text("Hello,",style: MyTextStyle.titleStyle30bw,),
                        const SizedBox(height: 10,),
                        Text("Welcome Back",style: MyTextStyle.titleStyle20bw,),

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
                                RequiredValidator(errorText: 'Enter First Name'),
                              ]),
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
                                  hintText: "First Name",
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
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Enter Last Name'),
                              ]),
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
                                  hintText: "Last Name",
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
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Enter Address'),
                              ]),
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
                                hintText: "Address",
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
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Enter Email'),
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
                                RequiredValidator(errorText: 'Enter Age'),
                              ]),
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
                                hintText: "Age",
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
                                RequiredValidator(errorText: 'Enter Gender'),
                              ]),
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
                                hintText: "Gender",
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
                                RequiredValidator(errorText: 'Enter Category'),
                              ]),
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
                                hintText: "Category",
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
                                RequiredValidator(errorText: 'Enter Password'),
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
                                hintText: "Password",
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
                              controller.changeProgressbarStatus(true);
                              controller.callingSubmitRegistrationForm();
                            }
                            },
                            style: TextButton.styleFrom(backgroundColor: primaryColor),
                            child:
                            Row(
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
                                Text("SIGN UP",style: MyTextStyle.titleStyle16bw,),),

                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                            onPressed: () {
                            Get.back();
                            },
                            child: RichText(
                                text: const TextSpan(
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                    //apply style to all
                                    children: [
                                      TextSpan(
                                          text: 'Already have an account yet? ',
                                          style: TextStyle(color: Colors.white)),
                                      TextSpan(
                                          text: ' Login',
                                          style: TextStyle(
                                              fontSize: 16, color: primaryColor)),
                                    ])),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            ),


        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}