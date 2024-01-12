
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Controller/TypingController.dart';
import 'package:pet_care/Tool/Color.dart';

import '../Tool/MyTextStyle.dart';

class TypingActivity extends StatefulWidget{
  const TypingActivity({super.key});

  @override
  State<TypingActivity> createState() => _TypingState();
}
class _TypingState extends State<TypingActivity> {
  TypingController controller=Get.put(TypingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child:Container(
          height: 60,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              color: primary3Color,
              border: Border.all(color: Colors.black45,width: 1)

          ),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: ClipRRect(
                      child: Image.asset("assets/icons/emojy.png")
                  )
              ),
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
                    decoration:const  InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      hintText: "Type...",
                      hintStyle: TextStyle(fontSize: 14.0, fontFamily: 'FontBold', color: Colors.black87),

                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: ClipRRect(
                      child: Image.asset("assets/icons/choose_file.png")
                  )
              ),
              Expanded(
                  flex: 1,
                  child: ClipRRect(
                      child: Image.asset("assets/icons/send_message.png")
                  )
              )
            ],
          ),
        ),
      ),
      body:  Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color:primary3Color
            ),
            padding:  const EdgeInsets.only(top: 40,bottom: 10),
            child: Column(
              children: [
                //  CommonWidgets.appBarView(title: StringConstants.profile),
                ListTile(
                  leading: Card(
                    shape:const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    color: primaryColor,
                    elevation: 2,
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.only(top: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      child: IconButton(onPressed: (){
                        Get.back();
                      }, icon: const Icon(Icons.arrow_back_ios,color: primary3Color,)),
                    ),
                  ),
                  title:
                  Row(
                    children: [
                      SizedBox(
                        height: 60,width: 60,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset("assets/icons/dog.png",fit: BoxFit.fill,)),
                      ),
                      const SizedBox(width: 10,),
                      Text("Jenny Wilson",style: MyTextStyle.titleStyle14by,),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: chating(),
              ),
            ),
          ),
          const SizedBox(height: 100,)
        ],
      ),
    );
  }

  Widget chating(){
    return
      ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 7,
        itemBuilder: (context, index){
          return index%2==0?
          Align(
            alignment:Alignment.topLeft,
            child: receivingMessage(),
          ):Container(
            alignment:Alignment.topRight,
            child: senderMessage(),
          );
        },);
  }
  Widget senderMessage(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Expanded(
            flex: 2,
            child: SizedBox()
        ),
        Expanded(
          flex: 3,
          child:  Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10,bottom: 10),
            decoration: const BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Text("Lorem ipsum dolor sit amet consectetur. Quam molestie at.",style: MyTextStyle.titleStyle14bb,
              textAlign: TextAlign.start,),
          ),

        ),
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 40,width: 40,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset("assets/images/user_icon.jpg"),
            ),
          ),
        ),
      ],
    );
  }
  Widget receivingMessage(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 40,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Image.asset("assets/icons/dog.png"),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child:  Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10,bottom: 10),
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Text("Hii Arvind how are you ? what are doing this time...",style: MyTextStyle.titleStyle14bw,
              textAlign: TextAlign.start,),
          ),

        ),
        const Expanded(
            flex: 2,
            child: SizedBox()
        ),


      ],
    );
  }
}