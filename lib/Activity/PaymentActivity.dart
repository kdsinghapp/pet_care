import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';

import '../Apis/api_models/get_cartItem_model.dart';
import '../Constant/icons_constants.dart';
import '../Constant/string_constants.dart';
import '../Controller/PaymentController.dart';
import '../Tool/Color.dart';

class PaymentActivity extends StatefulWidget {
  const PaymentActivity({super.key});

  @override
  State<PaymentActivity> createState() => _CartState();
}
class _CartState extends State<PaymentActivity> {
  PaymentController controller=Get.put(PaymentController());
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
                  child: Text('payment'.tr ,style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,),
                ),

              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: showAddCartList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringConstants.paymentDetail,style: MyTextStyle.titleStyle16bb),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(StringConstants.subtotal,style: MyTextStyle.titleStyle14b),
                            Text('\$ ${controller.argumentData!.totalAmount!}',style: MyTextStyle.titleStyle14b,textAlign: TextAlign.end,),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(StringConstants.taxes,style: MyTextStyle.titleStyle14b),
                            Text('\$ ${double.parse(controller.argumentData!.totalAmount!)*0.10}',style: MyTextStyle.titleStyle14b,textAlign: TextAlign.end,),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(StringConstants.total,style: MyTextStyle.titleStyle16bb),
                            Text('\$ ${(double.parse(controller.argumentData!.totalAmount!)*0.10+double.parse(controller.argumentData!.totalAmount!))}',style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.end,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: Text(StringConstants.cardNumber,style: MyTextStyle.titleStyle16bb,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
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
                          RequiredValidator(errorText: 'Enter Card Number'),
                        ]),
                        controller: controller.cardNumberController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10)),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 10.0),
                          hintText: StringConstants.enter12DigitCartNumber,
                          hintStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'FontBold',
                              color: hintColor),),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding:const  EdgeInsets.symmetric(horizontal: 0),
                          leading: Text(StringConstants.validThru,style: MyTextStyle.titleStyle16bb,),
                          trailing: Text(StringConstants.cvv,style: MyTextStyle.titleStyle16bb,),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex:2,
                                child: showDropDownMonthYear()),
                            Expanded(
                              flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Card(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5  ))
                                    ),
                                    elevation: 2,
                                    color: primary3Color,
                                    child:Obx(() =>    TextFormField(
                                      style: const TextStyle(
                                        color: textColor,
                                        fontSize: 14,
                                        fontFamily: 'FontBold',
                                      ),
                                      validator: MultiValidator([
                                        RequiredValidator(errorText: 'Enter CVV'),
                                      ]),
                                      controller: controller.cvvController,
                                      obscureText: controller.passwordVisible.value,
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                      decoration:  InputDecoration(
                                        border: const OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                        ),
                                        isDense: true,
                                        contentPadding: const EdgeInsets.symmetric(
                                            vertical: 15.0, horizontal: 10.0),
                                        hintText: StringConstants.cvv,
                                        hintStyle: const TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'FontBold',
                                            color: hintColor),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            controller.passwordVisible.value
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                          ),
                                          onPressed: () {
                                            controller.changePasswordVisible(!controller.passwordVisible.value);
                                          },
                                        ),
                                      ),
                                    ),)
                                  ),
                                ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(StringConstants.cardHolderName,style: MyTextStyle.titleStyle16bb,),

                        Padding(
                          padding: const EdgeInsets.only(top: 10),
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
                                RequiredValidator(errorText: 'Enter Full Name'),
                              ]),
                              controller: controller.fullNameController,
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
                                hintText: "Full Name",
                                hintStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontFamily: 'FontBold',
                                    color: hintColor),),
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: double.infinity,
                    height: 65,
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
                    child: TextButton(
                      onPressed: (){
                        //  controller.changeProgressbarStatus(true);
                        // controller.openToPaymentPage();

                      },
                      style: TextButton.styleFrom(backgroundColor: primaryColor),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => Visibility(
                              visible: controller.showProgressBar.value,
                              child: const SizedBox(
                                  height:30,width:30,
                                  child:CircularProgressIndicator(color:primary3Color,)
                              )
                          )),
                          const SizedBox(width: 10,),
                          Obx(() => controller.showProgressBar.value?Text("Loading...",style: MyTextStyle.titleStyle16bw,):
                          Text(StringConstants.checkOut,style: MyTextStyle.titleStyle16bw,),),

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
    );
  }

  Widget showAddCartList(){
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.argumentData!.result!.length,
        itemBuilder: (context, index){
          GetCartResult item=controller.argumentData!.result![index];
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
                        Text(item.productName!,style: MyTextStyle.titleStyle14b,maxLines: 1,),
                        const SizedBox(height: 10,),
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
        },
    );

  }


  Widget showDropDownMonthYear(){
    return  DropdownDatePicker(
      inputDecoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10))), // optional
      isDropdownHideUnderline: true, // optional
      isFormValidator: true, // optional
      startYear: 2010, // optional
      endYear: 2040, // optional
      width: 10,
      showDay: false,// optional
      // selectedDay: 14, // optional
      selectedMonth: 11, // optional
      selectedYear: 2025, // optional
      onChangedMonth: (value) => print('onChangedMonth: $value'),
      onChangedYear: (value) => print('onChangedYear: $value'),
      //boxDecoration: BoxDecoration(
      // border: Border.all(color: Colors.grey, width: 1.0)), // optional
      // showDay: false,// optional
      // dayFlex: 2,// optional
      // locale: "zh_CN",// optional
      // hintDay: 'Day', // optional
      // hintMonth: 'Month', // optional
      // hintYear: 'Year', // optional
      // hintTextStyle: TextStyle(color: Colors.grey), // optional
    );
  }
}