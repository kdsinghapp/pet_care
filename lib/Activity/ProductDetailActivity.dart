import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Constant/icons_constants.dart';
import 'package:pet_care/Constant/image_constants.dart';
import 'package:pet_care/Controller/ProductDetailController.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';
import 'package:shimmer/shimmer.dart';

import '../Apis/api_models/get_productDetail_model.dart';
import '../Constant/string_constants.dart';
import '../Tool/Color.dart';

class ProductDetailActivity extends StatefulWidget {
  const ProductDetailActivity({super.key});

  @override
  State<ProductDetailActivity> createState() => _ProductDetailState();
}
class _ProductDetailState extends State<ProductDetailActivity> {
  ProductDetailController controller=Get.put(ProductDetailController());
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
              child: Text(StringConstants.details ,style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,),
            ),

          ),
          Obx(() => controller.showProgressbar.value?showSimmerList():Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20,bottom: 5,top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 300,width: 300,
                      child: Obx(() => Image.network(controller.productDetailsModel!.result!.productImages![controller.selectImageIndex.value].image!,fit:BoxFit.fill,
                        errorBuilder:
                            (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return  Image.asset(IconConstants.icCat,fit: BoxFit.fill,height: 60,);
                        },
                      ),),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 60,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: showAllImagesList(),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Text(controller.productDetailsModel!.result!.name! ,style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.start,),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                           controller.changeQuantity(++controller.selectQuantity.value);
                          },
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(3)),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Container(
                              height: 40,width: 40,
                              decoration: const BoxDecoration(
                                  color: hintColor
                              ),
                              padding: const EdgeInsets.only(bottom: 5,left: 5,right: 5),
                              child: Text('+',style: MyTextStyle.titleStyle30bb,textAlign: TextAlign.center,),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child:Obx(() =>  Text(controller.selectQuantity.value.toString(),style: MyTextStyle.titleStyle20bb,),)
                        ),
                        GestureDetector(
                          onTap: (){
                            if(controller.selectQuantity.value>1){
                              controller.changeQuantity(--controller.selectQuantity.value);
                            }
                          },
                          child: Card(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(3)),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Container(
                              height: 40,width: 40,
                              padding: const EdgeInsets.only(bottom: 15),
                              decoration: const BoxDecoration(
                                color: hintColor
                              ),
                              child: const Icon(Icons.minimize_outlined,size:25,color: Colors.black,),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text("100+ viewed in past month" ,style: MyTextStyle.titleStyle12b,textAlign: TextAlign.start,),
                    const SizedBox(height: 10,),
                    Text(controller.productDetailsModel!.result!.description! , style: MyTextStyle.titleStyle14b,textAlign: TextAlign.justify,),
                    const SizedBox(height: 10,),
                    Text("Size: ${controller.productDetailsModel!.result!.weight!} ${controller.productDetailsModel!.result!.weightIn! }" ,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.start,),
                    const SizedBox(height: 10,),
                   /* SizedBox(
                      height: 40,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: showAllSizeList(),
                      ),
                    ),*/
                    Container(
                      width: double.infinity,
                      height: 45,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      clipBehavior: Clip.hardEdge,
                      margin: const EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 20),
                      child: TextButton(
                        onPressed: (){
                          controller.changeAddToCartProgressbarStatus(true);
                          controller.callingAddToCallForm(controller.productDetailsModel!.result!.id!);

                        },
                        style: TextButton.styleFrom(backgroundColor: primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() => Visibility(
                                visible: controller.showAddToCartProgressbar.value,
                                child: const SizedBox(
                                    height:30,width:30,
                                    child:CircularProgressIndicator(color:primary3Color,)
                                )
                            )),
                            const SizedBox(width: 10,),
                            Obx(() => controller.showAddToCartProgressbar.value?Text("Loading...",style: MyTextStyle.titleStyle16bw,):
                            Text(StringConstants.addToCart,style: MyTextStyle.titleStyle16bw,),),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              ),
            ),
          )),
        ],
      ),
    );
  }
  ///Show  All Images List....
  Widget showAllImagesList(){
    return
      ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: controller.productDetailsModel!.result!.productImages!.length,
      itemBuilder: (context, int index) {
        ProductImages imgList=controller.productDetailsModel!.result!.productImages![index];
        return GestureDetector(
            onTap: () {
              controller.changeSelectedImage(index);
            },
            child:Obx(() =>  Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: controller.selectImageIndex.value==index?primaryColor:text2Color,width: 2)
              ),
              semanticContainer: true,
              clipBehavior: Clip.hardEdge,
              margin: const EdgeInsets.only(left: 3, right: 3, top: 2, bottom: 2),
              elevation: 0,
              color: primary3Color,
              child: Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.only(left: 5, right: 5),
                decoration:const BoxDecoration(
                  color: primary3Color,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child:  Image.network(imgList.image!,fit:BoxFit.fill,
                  errorBuilder:
                      (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return  Image.asset(IconConstants.icCat,fit: BoxFit.fill,height: 50,);
                  },
                ),
              )
            ),)
        );
      },
    );
  }

  ///Show All Size List....
  Widget showAllSizeList(){
    return  GetBuilder<ProductDetailController>(builder: (context){
      return ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, int index) {
          // CategoryResult item=controller.getCategoryModel!.result![index];
          return GestureDetector(
              onTap: () {
              },
              child:Obx(() => Container(
                height: 35,
                margin: const EdgeInsets.only(left: 5, right: 5),
                padding: const EdgeInsets.only(left: 5,right: 5,top: 10,bottom: 10),
                decoration: BoxDecoration(
                  color: primary3Color,
                  border: Border.all(color:controller.selectSizeIndex.value==index?primaryColor:Colors.black87,width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("400gm",style:controller.selectSizeIndex.value==index? MyTextStyle.titleStyle14by:MyTextStyle.titleStyle14bb,textAlign: TextAlign.center),
              ))
          );
        },
      );
    }
    );
  }


  /// Shimmer page..
  Widget showSimmerList(){
    return  Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      enabled: controller.showProgressbar.value,
      child:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 300,width: 300,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ),
            const SizedBox(height: 5,),
            SizedBox(
              height: 60,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, int index) {
                    // CategoryResult item=controller.getCategoryModel!.result![index];
                    return GestureDetector(
                        onTap: () {
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black12, width: 1),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          semanticContainer: true,
                          clipBehavior: Clip.hardEdge,
                          margin: const EdgeInsets.only(left: 3, right: 3, top: 2, bottom: 2),
                          elevation: 0,
                          color: primary3Color,
                          child: Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            decoration:const BoxDecoration(
                              color: primary3Color,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child:  Image.asset(ImageConstants.dogFood,fit: BoxFit.fill,),
                          ),
                        ));
                  },
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 20,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              height: 20,
              width: double.infinity,
              margin: const EdgeInsets.only(right: 50),
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
            ),
            const SizedBox(height: 3,),
          ],
        ),
      ),
    );
  }
}