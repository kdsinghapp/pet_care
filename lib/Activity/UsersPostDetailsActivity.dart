import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_cartItem_model.dart';
import 'package:pet_care/Common/ShowToast.dart';
import 'package:pet_care/Controller/UserPostDetailsController.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';
import 'package:shimmer/shimmer.dart';
import '../Constant/icons_constants.dart';
import '../Constant/string_constants.dart';
import '../Tool/Color.dart';

class UsersPostDetailsActivity extends StatefulWidget {
  const UsersPostDetailsActivity({super.key});

  @override
  State<UsersPostDetailsActivity> createState() => _PostDetailsState();
}
class _PostDetailsState extends State<UsersPostDetailsActivity> {
  UserPostDetailsController controller=Get.put(UserPostDetailsController());
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
                  flex: 5,
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'FontBold',
                    ),
                    controller: controller.commentController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration:const  InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      hintText: StringConstants.giveOurOpinion,
                      hintStyle: TextStyle(fontSize: 14.0, fontFamily: 'FontBold', color: Colors.black87),

                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: ClipRRect(
                      child: Image.asset("assets/icons/emojy.png")
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
                  child: GestureDetector(
                    onTap: (){
                      if(controller.commentController.text.isNotEmpty){
                        controller.callingSubmitCommentApi();
                      }else{
                        showToastMessage("Enter text ....");
                      }

                    },
                    child: ClipRRect(
                        child: Image.asset("assets/icons/send_message.png")
                    ),
                  )
              )
            ],
          ),
        ),
      ),
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
                  child: Text(StringConstants.postDetails ,style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,),
                ),

              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  showPostDetails(),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 10,top: 10),
                    child: Text(StringConstants.message ,style: MyTextStyle.titleStyle20bb,),
                  ),
                  showCommentList(),
                  const SizedBox(height: 50,),
                ],
              ) ,
            ),
          ),
          const SizedBox(height: 30,),

        ],
      ),
    );
  }
  Widget showPostDetails(){
    return Obx(() =>controller.showProgressbar.value?
    Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.showProgressbar.value,
        child:Container(
          height: 270,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
          decoration: const BoxDecoration(
            // color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  height: 40,width: 40,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: textColor
                  ),
                ),
                //horizontalTitleGap: 5.0,
                title: Container(
                  height: 15,width: 80,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: textColor
                  ),
                ),
                trailing: Container(
                  height: 40,width: 80,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: textColor
                  ),
                ) ,
              ),
              Container(
                height: 15,width: double.infinity,
                margin: const EdgeInsets.only(left: 10,right: 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: textColor
                ),
              ),
              Container(
                height: 150,width: double.infinity,
                margin: const EdgeInsets.only(left: 10,right: 10,top: 5),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: textColor
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 20,width:50,
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: textColor
                    ),
                  ),
                  Container(
                    height: 20,width:50,
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: textColor
                    ),
                  ),
                  Container(
                    height: 20,width:50,
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: textColor
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    ):
    Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      semanticContainer: true,
      clipBehavior: Clip.none,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 3, bottom: 3),
      elevation: 1,
      color: primary3Color,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Image.asset('assets/icons/cat.png',height: 30,width: 30,),
              title: Text(controller.getPostDetailsModel!.result!.fullName!,style: MyTextStyle.titleStyle16bb,maxLines: 1,),
              horizontalTitleGap: 0.0,
              trailing: Container(
                height: 35,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: primaryColor
                ),
                padding: const EdgeInsets.only(left: 5,right: 5),
                child: TextButton(
                  onPressed: (){
                    controller.callingFollowUnFollowApi();
                  },
                  child: Text("Follow",style: MyTextStyle.titleStyle16bw,),
                ),
              ),
            ),

            Container(
              height: 200,
              margin: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
              child:Image.network(controller.getPostDetailsModel!.result!.userPost![0].postData!,fit:BoxFit.fill,
                errorBuilder:
                    (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return  Image.asset(IconConstants.icCat,fit: BoxFit.fill,);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.callingGetLikeUnlikedApi();
                    },
                    child: Row(
                      children: [
                        Obx(() => controller.liked.value? Image.asset(IconConstants.icFilledLike,height: 15,width: 15,)
                        :Image.asset('assets/icons/like.png',height: 15,width: 15,),),
                        const SizedBox(width: 5,),
                        Text(controller.getPostDetailsModel!.result!.totalLikes!.toString(),style: MyTextStyle.titleStyle16b,)
                      ],
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Row(
                    children: [
                      Image.asset('assets/icons/comment.png',height: 15,width: 15,),
                      const SizedBox(width: 5,),
                      Text(controller.getPostDetailsModel!.result!.totalComment!.toString(),style: MyTextStyle.titleStyle16b,)
                    ],
                  ),
                  const SizedBox(width: 20,),
                  Row(
                    children: [
                      Image.asset('assets/icons/share.png',height: 15,width: 15,),
                      const SizedBox(width: 5,),
                      Text("50",style: MyTextStyle.titleStyle16b,)
                    ],
                  ),
                ],
              ),
            ),
            Text(controller.getPostDetailsModel!.result!.description!,style: MyTextStyle.titleStyle14b,
              overflow: TextOverflow.ellipsis,textAlign: TextAlign.justify,),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    )
    );
  }

  Widget showCommentList(){
    return Obx(() =>controller.showCommentProgressbar.value?
    Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.showCommentProgressbar.value,
        child:Container(
          height: 270,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
          decoration: const BoxDecoration(
            // color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  height: 40,width: 40,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: textColor
                  ),
                ),
                //horizontalTitleGap: 5.0,
                title: Container(
                  height: 15,width: 80,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: textColor
                  ),
                ),
                trailing: Container(
                  height: 40,width: 80,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: textColor
                  ),
                ) ,
              ),
              Container(
                height: 15,width: double.infinity,
                margin: const EdgeInsets.only(left: 10,right: 10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: textColor
                ),
              ),
              Container(
                height: 150,width: double.infinity,
                margin: const EdgeInsets.only(left: 10,right: 10,top: 5),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: textColor
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 20,width:50,
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: textColor
                    ),
                  ),
                  Container(
                    height: 20,width:50,
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: textColor
                    ),
                  ),
                  Container(
                    height: 20,width:50,
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: textColor
                    ),
                  ),
                ],
              )
            ],
          ),
        )
    ):
    ListView.builder(
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context,int index){
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Image.asset('assets/icons/cat.png',height: 40,width: 40,),
                title: Text("Vicky",style: MyTextStyle.titleStyle16bb,maxLines: 1,),
                horizontalTitleGap: 0.0,
                subtitle:Text("Speak to me often. Even if I don't understand your words, I feel your voice speaking to me. 👉",style: MyTextStyle.titleStyle14b,) ,
              ),
              const SizedBox(height: 10,)
            ],
          ),
        );

      },
    )
    );
  }
}