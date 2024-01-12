import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Controller/LanguageController.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';

import '../Constant/string_constants.dart';
import '../Tool/Color.dart';

class LanguageActivity extends StatefulWidget {
  const LanguageActivity({super.key});

  @override
  State<LanguageActivity> createState() => _LanguageState();
}
class _LanguageState extends State<LanguageActivity> {
  LanguageController controller=Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  margin: const EdgeInsets.only(top: 10,),
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
                  child: Text('language'.tr ,style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center,),
                ),

              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20,bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        side:const  BorderSide(color:Colors.black12, width: 1),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      semanticContainer: true,
                      clipBehavior: Clip.none,
                      margin: const EdgeInsets.only(left: 3, right: 3, top: 5),
                      elevation: 2,
                      //color:MLightColors().caption,
                      child:
                      GestureDetector(
                        onTap: (){
                        },

                        child: TextFormField(
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'FontBold',
                          ),
                          controller: controller.languageController,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                            hintText:'Search',
                            hintStyle:MyTextStyle.titleStyle16b,
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.search_rounded,color: primaryColor,size: 25,),
                              onPressed: () {
                              },
                            ),

                          ),
                          onChanged: (text) {
                            controller.filterLanguageList(text);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),

              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: showLanguageList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget showLanguageList(){
    return GetBuilder<LanguageController>(builder: (context){
      return  ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.filterList.length,
        itemBuilder: (context, index){
          return
            Column(
              children: [
                ListTile(
                    onTap: ()=>controller. changeLanguage(index),
                    title:  Text(controller.filterList[index],style: MyTextStyle.titleStyle16bb,),
                    trailing:Obx(() =>  Container(
                      alignment: Alignment.center,
                      height: 20,width: 20,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black87,width: 1),
                          color: controller.selectedLanguage.value==index?primaryColor:primary3Color
                      ),
                    )
                    )


                ),
              ],
            );
        },);
    }
    );
  }
}