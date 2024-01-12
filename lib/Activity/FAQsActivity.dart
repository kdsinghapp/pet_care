import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Constant/image_constants.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';
import '../Apis/api_models/get_faq_model.dart';
import '../Constant/string_constants.dart';
import '../Controller/FAQsController.dart';
import '../Tool/Color.dart';

class FAQsActivity extends StatefulWidget {
  const FAQsActivity({super.key});

  @override
  State<FAQsActivity> createState() => _FAQsState();
}
class _FAQsState extends State<FAQsActivity> {
  FQAsController controller=Get.put(FQAsController());
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
              child: Text(StringConstants.faqs ,style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,),
            ),

          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20,bottom: 5,),
                child: Obx(() => controller.progressBar.value?Text("There are not present FAQs .",style: MyTextStyle.titleStyle14b,):
                showQuestionAnswer()
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


  /// Show Popular Question and Answer...
  Widget showQuestionAnswer(){
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: controller.getFAQModel!.result!.length,
      itemBuilder: (context, int index) {
        GetFAQResult faqResult=controller.getFAQModel!.result![index];
        return
          Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            semanticContainer: true,
            clipBehavior: Clip.none,
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            elevation: 0,
            color: primary3Color,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(
                          flex: 1,
                          child: Icon(Icons.question_answer,size: 15,)),
                      Expanded(
                          flex: 6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(removeAllHtmlTags(faqResult.question!),style: MyTextStyle.titleStyle13b,),
                              const SizedBox(height: 5,),
                              Text("132 to answer",style: MyTextStyle.titleStyle10b,)
                            ],
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child:IconButton(
                              onPressed: (){
                                setState(() {
                                  controller.changeCheckedFaq(index, !controller.checkFAQList[index]);
                                });

                              },
                              icon:controller.checkFAQList[index]?const Icon(Icons.keyboard_arrow_up,size: 25,): const Icon(Icons.keyboard_arrow_down,size: 25,)
                          )
                      ),
                    ],
                  ),
                  controller.checkFAQList[index]?Text(removeAllHtmlTags(faqResult.description!),style: MyTextStyle.titleStyle13b,):
                  const SizedBox(height: 2,)

                ],
              ),
            ),
          );
      },
    );
  }
}