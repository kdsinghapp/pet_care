import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Common/ShowToast.dart';
import 'package:pet_care/Constant/image_constants.dart';
import 'package:pet_care/Controller/NewPostController.dart';
import 'package:pet_care/Controller/PrivacyPolicyController.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';
import '../Constant/string_constants.dart';
import '../Tool/Color.dart';

class NewPostActivity extends StatefulWidget {
  const NewPostActivity({super.key});

  @override
  State<NewPostActivity> createState() => _NewPostState();
}
class _NewPostState extends State<NewPostActivity> {
  NewPostController controller=Get.put(NewPostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: 
      Container(
        width: double.infinity,
        height: 45,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 20),
        child: TextButton(
          onPressed: (){
            if(controller.captionController.text.isNotEmpty){
              controller.changeUploadProgressbarStatus(true);
              controller.callingAddPostForm();
            }else{
              showToastMessage("Enter Caption ...");
            }

          },
          style: TextButton.styleFrom(backgroundColor: primaryColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Visibility(
                  visible: controller.showUploadProgressBar.value,
                  child: const SizedBox(
                      height:30,width:30,
                      child:CircularProgressIndicator(color:primary3Color,)
                  )
              )),
              const SizedBox(width: 10,),
              Obx(() => controller.showUploadProgressBar.value?Text("Loading...",style: MyTextStyle.titleStyle16bw,):
              Text(StringConstants.upload,style: MyTextStyle.titleStyle16bw,),),

            ],
          ),
        ),
      ),
      body:  Column(
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
              child: Text(StringConstants.newPost ,style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,),
            ),

          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    clipBehavior: Clip.hardEdge,
                    margin:const  EdgeInsets.only(left: 15,right: 15),
                    elevation: 2,
                    child: SizedBox(
                        height: 250,
                        width: double.infinity,
                       child: Image.file(controller.argumentData[0]),
                       // child: Image.file(File(controller.parameter['img_file']!),fit: BoxFit.fill,)
                    )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 60,width: 60,
                          child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(30)),
                              child:Obx(() =>  controller.profileImage.isEmpty?const Icon(Icons.person,size: 60,):
                              Image.network(controller.profileImage.value,fit:BoxFit.fill,
                                errorBuilder:
                                    (BuildContext context, Object exception, StackTrace? stackTrace) {
                                  return const Icon(Icons.person,size: 60,);
                                },
                              ),)
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child:Padding(
                          padding: const EdgeInsets.only(left: 10,right: 15,top: 20),
                          child:
                          TextFormField(
                            style: const TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontFamily: 'FontBold',
                            ),
                            maxLines: 4,
                            controller: controller.captionController,
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
                              hintText: StringConstants.writeACation,
                              labelText: StringConstants.writeACation,
                              hintStyle: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'FontBold',
                                  color: hintColor),),
                          ),

                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.location_on_outlined,color:primaryColor,size: 20,),
                        const SizedBox(width:5,),
                        Text(StringConstants.addLocation,style: MyTextStyle.titleStyle16by,)

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


}