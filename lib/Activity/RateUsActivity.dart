import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Common/ShowToast.dart';
import 'package:pet_care/Controller/RateUsController.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';

import '../Constant/string_constants.dart';
import '../Tool/Color.dart';

class RateUsActivity extends StatefulWidget {
  const RateUsActivity({super.key});

  @override
  State<RateUsActivity> createState() => _RateUsState();
}
class _RateUsState extends State<RateUsActivity> {
  RateUsController controller=Get.put(RateUsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
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
                    child: Text(StringConstants.rateUs ,style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center,),
                  ),

                ),
                Card(
                  shape:const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  color: primary3Color,
                  elevation: 2,
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.only(left: 20, right: 20,bottom: 5,top: 100),
                  child:Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(StringConstants.shareYourOpinion ,style: MyTextStyle.titleStyle18bb,textAlign: TextAlign.center,),
                        Text(StringConstants.yourRatingForThisProductGood ,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.center,),

                        const SizedBox(height: 20),
                         Obx(() => RatingBar(
                           isHalfAllowed: false,
                           alignment: Alignment.center,
                           filledIcon: Icons.star,
                           // halfFilledIcon: Icons.wb_cloudy,
                           emptyIcon: Icons.star_border_outlined,
                           emptyColor: Colors.grey,
                           filledColor: primaryColor,
                           //halfFilledColor: Colors.grey,
                           initialRating: controller.rateValue.value,
                           onRatingChanged: (double value ) {
                             controller.changeRatingValue(value);
                           },
                         ),),

                        const SizedBox(height: 20,),
                        Card(
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
                            controller: controller.feedBackController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            maxLines: 5,
                            decoration: const InputDecoration(
                                border:OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                                ),
                                isDense: true,
                                contentPadding:EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10.0),
                                hintText: StringConstants.typeHere,
                                hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: 'FontBold',
                                    color: hintColor),),

                          ),

                        ),

                        Container(
                          width: double.infinity,
                          height: 45,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          clipBehavior: Clip.hardEdge,
                          margin: const EdgeInsets.only(top: 30,left: 10,right: 10,bottom: 20),
                          child: TextButton(
                            onPressed: (){
                              if(controller.feedBackController.text.isNotEmpty){
                                controller.changeShowProgressbar(true);
                                controller.submitRateUs();
                              }else{
                                showToastMessage("Enter your opinion ...");
                              }
                            },
                            style: TextButton.styleFrom(backgroundColor: primaryColor),
                            child:  Row(
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
                      ],
                    ),
                  ),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}