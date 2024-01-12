import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Controller/chatController.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';

import '../Tool/Color.dart';

class ChatActivity extends StatefulWidget {
  const ChatActivity({super.key});

  @override
  State<ChatActivity> createState() => _ChatState();
}
class _ChatState extends State<ChatActivity> {
  ChatController controller=Get.put(ChatController());
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
                  GestureDetector(
                    onTap: (){
                    },

                    child:
                    TextFormField(
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
                          padding: const EdgeInsets.all(12),
                          child: InkWell(
                              onTap: (){
                               // _showBottomSheetFilter(context);
                              },
                              child: Image.asset('assets/icons/filter.png',)),
                        ),

                      ),
                      onChanged: (text) {
                        controller.filterUsersList(text);
                      },
                    ),
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
                child: Obx(() => controller.showProgressBar.value?const Text("There are not users present with contact you.Before follow users ..."):
                chatUser()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget chatUser(){
    return GetBuilder<ChatController>(builder: (context){
      return  ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.filterFollowersList.length,
        itemBuilder: (context, index){
          return
            Container(
              margin: const EdgeInsets.only(top: 5,bottom: 5),
              child: Column(
                children: [
                  ListTile(
                    onTap: ()=>controller. openChatPages(),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: /*Image.asset(
                        'assets/icons/dog.png',
                        fit: BoxFit.cover,height: 50,width: 50,
                      ),*/
                      CachedNetworkImage(
                        imageUrl:controller.filterFollowersList[index].followerDetails!.image!,
                        fit:BoxFit.fill,
                        placeholder: (BuildContext context, String url) => Image.asset('assets/icons/dog.png',fit: BoxFit.cover,height: 50,width: 50,),
                        errorWidget: (BuildContext context, String url, dynamic error) => Image.asset('assets/icons/dog.png',fit: BoxFit.cover,height: 50,width: 50,),
                      )
                    ),
                    title:  Text(controller.filterFollowersList[index].followerDetails!.fullName!,style: MyTextStyle.titleStyle16bb,),
                    subtitle:  Text('Have you spoken to the delivery...',style:MyTextStyle.titleStyle14b ,),
                    trailing: Column(
                      children: [
                        Text('08:00 PM',style:MyTextStyle.titleStyle14b,),
                        Container(
                          alignment: Alignment.center,
                          height: 20,width: 20,
                          decoration: const  BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: primaryColor
                          ),
                          child: Text('3',style:MyTextStyle.titleStyle14bw,),
                        )
                      ],
                    ),

                  ),
                ],
              ),
            );
        },);
    }
    );
  }
}