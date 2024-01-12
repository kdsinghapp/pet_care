import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:pet_care/Activity/MainActivity.dart';
import 'package:pet_care/Activity/PasswordResetActivity.dart';
import 'package:pet_care/Activity/SignUpActivity.dart';
import 'package:pet_care/Controller/LogInController.dart';
import 'package:pet_care/Tool/Color.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';
class LogInActivity extends StatefulWidget {
  const LogInActivity({super.key, required this.title});
  final String title;

  @override
  State<LogInActivity> createState() => _LogInState();
}

class _LogInState extends State<LogInActivity> {
  final _formKey = GlobalKey<FormState>();
  LogInController controller=Get.put(LogInController());

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
                height: heights*0.95,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50,),
                      Text("Hello,",style: MyTextStyle.titleStyle30bw,),
                      const SizedBox(height: 10,),
                      Text("Welcome Back",style: MyTextStyle.titleStyle20bw,),
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
                            autofillHints: const [
                              AutofillHints.email,
                            ],
                            validator: MultiValidator([
                            RequiredValidator(errorText: 'Enter email id'),]),
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
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'FontBold',
                                  color: hintColor),
                                prefixIcon: Icon(Icons.email),
                                errorStyle: TextStyle(fontSize: 14.0)),

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
                              controller: controller.passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 15.0, horizontal: 10.0),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'FontBold',
                                      color: hintColor),
                                  prefixIcon: Icon(Icons.lock),
                                  errorStyle: TextStyle(fontSize: 14.0)
                              ),
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Enter Password'),
                                MinLengthValidator(6,
                                    errorText: 'Minimum 6 character filled password'),
                              ]),
                            ),

                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 20,top: 0),
                        child: TextButton(
                          onPressed: (){
                          Get.to(()=>const PasswordResetActivity(title: "Password Reset Activity"));
                          },
                          child: Text("Forgot your password?",style: MyTextStyle.titleStyle12w,),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 45,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        clipBehavior: Clip.hardEdge,
                        margin: const EdgeInsets.only(left: 20,right: 20,top: 10),
                        child: TextButton(
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              controller.changeProgressbarStatus(true);
                              controller.callingSubmitLogInForm();
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
                              Text("LOGIN",style: MyTextStyle.titleStyle16bw,),),

                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        height: heights*0.9/3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20),
                              child: Card(
                                shape:const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                color: primary3Color,
                                child: Container(
                                    width: double.infinity,
                                    height:40 ,
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/icons/facebook.png',height: 25,width: 25,),
                                        Text("    Continue with Facebook",style: MyTextStyle.titleStyle13b,textAlign: TextAlign.center,),
                                      ],
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                              child: Card(
                                shape:const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                                color: primary3Color,
                                child: Container(
                                    width: double.infinity,
                                    height:40 ,
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/icons/google.png',height: 25,width: 25,),
                                        Text("     Continue with Google",style: MyTextStyle.titleStyle13b,textAlign: TextAlign.center,),
                                      ],
                                    )),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () {
                                  Get.to(()=>const SignUpActivity(title: "SignUp Activity"));
                                },
                                child: RichText(
                                    text: const TextSpan(
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                        //apply style to all
                                        children: [
                                          TextSpan(
                                              text: 'Don’t have an account yet? ',
                                              style: TextStyle(color: Colors.white)),
                                          TextSpan(
                                              text: ' Sign up',
                                              style: TextStyle(
                                                  fontSize: 16, color: primaryColor)),
                                        ])),
                              ),
                            ),
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}