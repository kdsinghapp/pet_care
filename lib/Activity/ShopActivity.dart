import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_productList_model.dart';
import 'package:pet_care/Constant/image_constants.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';
import 'package:shimmer/shimmer.dart';

import '../Constant/icons_constants.dart';
import '../Controller/ShopController.dart';
import '../Tool/Color.dart';

class ShopActivity extends StatefulWidget {
  const ShopActivity({super.key});

  @override
  State<ShopActivity> createState() => _ShopState();
}
class _ShopState extends State<ShopActivity> {

  ShopController controller=Get.put(ShopController());
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20,bottom: 5),
            margin: const EdgeInsets.only( top: 30),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextFormField(
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'FontBold',
                            ),
                            controller: controller.searchController,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                              hintText:'Search',
                              hintStyle:MyTextStyle.titleStyle16by,
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.search_rounded,color: primaryColor,size: 25,),
                                onPressed: () {
                                },
                              ),
                              suffixIcon: Container(
                                height: 20,width: 20,
                                padding: const EdgeInsets.all(10),
                                child: InkWell(
                                    onTap: (){
                                      // _showBottomSheetFilter(context);
                                    },
                                    child: Image.asset('assets/icons/filter.png',)),
                              ),

                            ),
                            onChanged: (text) {
                              controller.getFilterProductList(text);
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 35,
                            width: 30,
                            padding: const EdgeInsets.only(right: 10,left: 5,top: 5,bottom: 5),
                            child: InkWell(
                                onTap: (){
                                 controller.openCartPage();
                                },
                                child: Image.asset(IconConstants.icCart,fit: BoxFit.fill,)),
                          ),
                        ),
                      ],
                    ),

                ),
                const SizedBox(height: 10,),
              ],
            ),

          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(() => controller.showProgressbar.value?showSimmerList():showProducts()),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget showSimmerList(){
      return  Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.showProgressbar.value,
        child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 180/215
          ),
          itemBuilder: (context, index){
            return Container(
                  width: 180,
                  margin: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 110,
                        width: 170,
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Container(
                        height: 10,
                        width: 170,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                      ),
                      const SizedBox(height: 3,),
                      Container(
                        height: 10,
                        width: 120,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                      ),
                     // Text(controller.filterList[index],style: MyTextStyle.titleStyle12bb,textAlign: TextAlign.start,maxLines: 2,),
                      const SizedBox(height: 5,),
                      Container(
                        height: 10,
                        width: 60,
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 10,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                          ),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
          },),
      );
  }
  Widget showProducts(){
    return GetBuilder<ShopController>(builder: (context){
      return  GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.filterProductList.length,
        gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          childAspectRatio: 180/215
        ),
        itemBuilder: (context, index){
          GetProductListResult item=controller.filterProductList[index];
          return
            GestureDetector(
              onTap: (){
                controller.openProductDetailPages(item.id!);
              },
              child: Container(
                 width: 180,
                margin: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 110,
                      width: 170,
                      child:  Image.network(item!.productImages![0].image!,fit:BoxFit.fill,
                        errorBuilder:
                            (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return  Image.asset(IconConstants.icCat,fit: BoxFit.fill,height: 60,);
                        },
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Text(item.name!,style: MyTextStyle.titleStyle12bb,textAlign: TextAlign.start,maxLines: 2,),
                    const SizedBox(height: 5,),
                    Text("\$ ${item.price}",style: MyTextStyle.titleStyle14by,textAlign: TextAlign.start,),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                            child: Row(
                              children: [
                                const Icon(Icons.star,color: primaryColor,size: 15,),
                                Text('4+',style: MyTextStyle.titleStyle12bb,textAlign: TextAlign.start,),
                              ],
                            )
                        ),
                        const Expanded(
                          flex: 1,
                            child: Align(
                              alignment: Alignment.centerRight,
                                child:  Icon(Icons.favorite,color: Colors.red,size: 18,)),)
                      ],
                    )
                  ],
                ),
              ),
            );
        },);
    }
    );
  }
}