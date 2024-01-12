import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_cartItem_model.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';
import 'package:shimmer/shimmer.dart';
import '../Constant/icons_constants.dart';
import '../Constant/string_constants.dart';
import '../Controller/CartController.dart';
import '../Tool/Color.dart';

class CartActivity extends StatefulWidget {
  const CartActivity({super.key});

  @override
  State<CartActivity> createState() => _CartState();
}
class _CartState extends State<CartActivity> {
  CartController controller=Get.put(CartController());
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
                  child: Text(StringConstants.cart ,style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,),
                ),
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Obx(() => controller.showProgressbar.value? showSimmerList():showAddCartList()),
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
                controller: controller.promoCodeController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.all(Radius.circular(10)),
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 10.0),
                  hintText: StringConstants.enterYourPromoCode,
                  hintStyle: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'FontBold',
                      color: hintColor),),
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(StringConstants.total,style: MyTextStyle.titleStyle20bb,),
                Obx(() => controller.showProgressbar.value?const SizedBox(width: 5,) :Text("\$ ${controller.getCartModel!.totalAmount!}",style: MyTextStyle.titleStyle20bb,))
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 65,
            padding: const EdgeInsets.only(left: 25,right: 25,top: 20,),
            child: TextButton(
              onPressed: (){
                 controller.openAddressPage();
              },
              style: TextButton.styleFrom(backgroundColor: primaryColor),
              child: Text(StringConstants.checkOut,style: MyTextStyle.titleStyle16bw,)
            ),
          ),
          const SizedBox(height: 30,)
        ],
      ),
    );
  }
  Widget showSimmerList(){
    return  Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.white,
      enabled: controller.showProgressbar.value,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index){
          return Container(
           // width: 180,
            margin: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 15,
                        margin: const EdgeInsets.only(left: 10,right: 10),
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Container(
                        height: 15,
                        margin: const EdgeInsets.only(left: 10,right: 50),
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        height: 10,
                        width: 80,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                      ),
                      const SizedBox(height: 3,),
                      Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Row(
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
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },),
    );
  }
  Widget showAddCartList(){
    return GetBuilder<CartController>(builder: (context){
      return  ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.getCartModel!.result!.length,
        itemBuilder: (context, index){
          GetCartResult item=controller.getCartModel!.result![index];
          return
            Row(
              children: [
                Expanded(
                  flex: 2,
                    child: SizedBox(
                      height: 120,
                      child: Image.network(item.productImage!,fit:BoxFit.fill,
                        errorBuilder:
                            (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return  Image.asset(IconConstants.icCat,fit: BoxFit.fill,height: 60,);
                        },
                      ),
                    ),),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex:6,
                                child: Text(item.productName!,style: MyTextStyle.titleStyle14b,maxLines: 1,)
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                  onTap: (){
                                    controller.changeProgressbarStatus(true);
                                    controller.callingDeleteCartItemForm(item.cartId!);
                                  },
                                  child: const Icon(Icons.delete_outline,size: 20,color: Colors.black,)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Text('\$ ${item.productPrice}',style: MyTextStyle.titleStyle14by,),
                        const SizedBox(height: 5,),
                        Text('\$ ${item.productTotalPrice}',style: MyTextStyle.titleStyle16by,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){

                              },
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Container(
                                  height: 25,width: 25,
                                  padding: const EdgeInsets.only(bottom: 5,left: 5,right: 5),
                                  child: Text('+',style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(item.quantity!,style: MyTextStyle.titleStyle14bb,),
                            ),
                            GestureDetector(
                              onTap: (){

                              },
                              child: Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Container(
                                  height: 25,width: 25,
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: const Icon(Icons.minimize,size:20,color: Colors.black,),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
        },);
    }
    );
  }
}