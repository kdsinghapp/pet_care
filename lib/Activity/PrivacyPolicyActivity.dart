import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Constant/image_constants.dart';
import 'package:pet_care/Controller/PrivacyPolicyController.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';
import '../Constant/string_constants.dart';
import '../Tool/Color.dart';

class PrivacyPolicyActivity extends StatefulWidget {
  const PrivacyPolicyActivity({super.key});

  @override
  State<PrivacyPolicyActivity> createState() => _PrivacyPolicyState();
}
class _PrivacyPolicyState extends State<PrivacyPolicyActivity> {
  PrivacyPolicyController controller=Get.put(PrivacyPolicyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Text(StringConstants.privacyPolicy ,style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center,),
            ),

          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20,bottom: 5,top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 300,width: 300,
                      child: Image.asset(ImageConstants.imagePrivacy,fit: BoxFit.fill,),
                    ),
                    const SizedBox(height: 20,),
                    Obx(() => controller.progressBar.value?const Center(
                      child: CircularProgressIndicator(color: primaryColor,),
                    ):
                    Text(removeAllHtmlTags(controller.privacyPolicyModel!.result![0].description!) ,style: MyTextStyle.titleStyle14b,textAlign: TextAlign.justify,),
                    ),
                  ],
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );
    return htmlText.replaceAll(exp, '');
  }

}