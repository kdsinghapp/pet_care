import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Activity/ProfileActivity.dart';
import 'package:pet_care/Apis/api_models/get_allUsersPost_model.dart';
import 'package:pet_care/Apis/api_models/get_followers_model.dart';
import 'package:pet_care/Constant/icons_constants.dart';
import 'package:pet_care/Constant/image_constants.dart';
import 'package:pet_care/Controller/BottomBarController.dart';
import 'package:pet_care/Tool/Color.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';
import 'package:shimmer/shimmer.dart';
import '../Apis/api_models/get_category_model.dart';
import '../Controller/HomeActivityController.dart';
import 'ChatActivity.dart';
import 'PostActivity.dart';
import 'ShopActivity.dart';
class MainActivity extends StatefulWidget{
   const MainActivity({super.key,required this.title});
   final String title;
   
   @override
  State<StatefulWidget> createState() =>_MainState();
}

class _MainState extends State<MainActivity>{
  BottomBarController bottomBarController=Get.put(BottomBarController());
  var pageList=[
    const HomeActivity(),
   // const SearchActivity(),
    //const GridGallery(),
    const ShopActivity(),
    const PostActivity(),
    const ChatActivity(),
    const ProfileActivity()
  ];
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: bottomNavigationWidgets(),
      backgroundColor: primary3Color,
      body:Obx(()=>pageList[int.parse(bottomBarController.bottomNavIndex.string)])
    );
  }
  
  Widget bottomNavigationWidgets(){
    return Container(
      height: 60,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        color: primary3Color
      ),
      child: Obx(()=>
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    bottomBarController.changeBottomBarIndex(0);
                  },
                  child:bottomBarController.bottomNavIndex.value==0?Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/fillHome.png',height: 30,width: 30,fit: BoxFit.fill,),
                      const Text("Home",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: primaryColor),)
                    ],
                  ):
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/home.png',height: 25,width: 25,fit: BoxFit.fill,),
                      const Text("Home",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color:Colors.black87),)
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    bottomBarController.changeBottomBarIndex(1);
                  },
                  child:bottomBarController.bottomNavIndex.value==1?Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/fillShop.jpg',height: 30,width: 30,fit: BoxFit.fill,),
                      const Text("Market",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: primaryColor),)
                    ],
                  ):
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/shop.jpg',height: 25,width: 25,fit: BoxFit.fill,),
                      const Text("Market",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color:Colors.black87),)
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: GestureDetector(
                    onTap: (){
                      bottomBarController.changeBottomBarIndex(2);
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                            shape:  RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(25))
                            ),
                            color: primaryColor,
                            clipBehavior: Clip.hardEdge,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(Icons.add,size: 30,color: primary3Color,)
                            )),
                      ],
                    )
                )),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      bottomBarController.changeBottomBarIndex(3);
                    });
                  },
                  child:bottomBarController.bottomNavIndex==3? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/fillChat.png',height: 30,width: 30,fit: BoxFit.fill,),
                      const Text("Chats",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: primaryColor),)
                    ],
                  ):
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/chat.png',height: 25,width: 25,fit: BoxFit.fill,),
                      const Text("Chats",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color:Colors.black87),)
                    ],
                  ),
                )),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: (){
                    bottomBarController.changeBottomBarIndex(4);
                  },
                  child:bottomBarController.bottomNavIndex==4? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/fillPerson.png',height: 30,width: 30,fit: BoxFit.fill,),
                      const Text("Profile",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: primaryColor),)
                    ],
                  ):
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/icons/person.png',height: 25,width: 25,fit: BoxFit.fill,),
                      const Text("Profile",style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color:Colors.black87),)
                    ],
                  ),
                )),
          ],
        ),
      ),

    );
  }

}

class HomeActivity extends StatefulWidget{
     const HomeActivity({super.key});

     @override
   State<StatefulWidget> createState() =>_HomeState();
}
class _HomeState extends State<HomeActivity>{
  HomeActivityController controller=Get.put(HomeActivityController());
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: primary3Color,
      body:Obx(() => controller.count.value!=0?
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20,bottom: 5),
            margin: const EdgeInsets.only( top: 30),
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              semanticContainer: true,
              clipBehavior: Clip.none,
              elevation: 2,
              color: primary3Color,
              child: GestureDetector(
                onTap: () {
                  controller.openSearchPage();
                },
                child:  ListTile(
                    leading:const Icon(Icons.search_rounded,color: primaryColor,size: 25,),
                    horizontalTitleGap: 0.0,
                    title: Text("Search", style:MyTextStyle.titleStyle16by,),
                    trailing:Image.asset('assets/icons/filter.png',height: 25,width: 25,)
                ),
              ),
            ),
          ),
          sliderView(),
          Container(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 15,),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Choose Category",style: MyTextStyle.titleStyle18bb,),
                   /* TextButton(onPressed: (){},
                        child: Text("See more",style: MyTextStyle.titleStyle12by,))*/
                  ],
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 100,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: showCategoryList(),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:showPetCards() ,
            ),
          ),

        ],
      ):const SizedBox()
      )

    );
  }
  ///Slider Images ....
  Widget sliderView(){
    return Obx(() => controller.bannerProgressBar.value?
    Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.bannerProgressBar.value,
        child: Container(
          height: 180,
          width: double.infinity,
          margin: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
        )):
    CarouselSlider.builder(
        itemCount: controller.getBannerModel!.result!.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Card(
              color:  primaryColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              clipBehavior: Clip.hardEdge,
              child:
               /* Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Take me home",style:MyTextStyle.titleStyle16by,),
                            const SizedBox(height: 10,),
                            Text("Take care of stray dogs, please take them home.",style:MyTextStyle.titleStyle12w,),
                            const SizedBox(height: 20,),
                            Container(
                              height: 45,
                              padding: const EdgeInsets.only(top: 5,right: 15,bottom: 5,left: 15),
                              decoration: const BoxDecoration(
                                borderRadius:BorderRadius.all(Radius.circular(15)),
                                color: primaryColor,
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: TextButton(onPressed: (){},
                                  child: Text("Let me",style: MyTextStyle.titleStyle16bw,)),
                            )
                          ],
                        )),
                    Expanded(
                        flex: 2,
                        child: Image.asset('assets/icons/cat.png',))
                  ],
                ),*/
              CachedNetworkImage(
                imageUrl:"${controller.getBannerModel!.result![itemIndex].image}",
                fit:BoxFit.fill,
                placeholder: (BuildContext context, String url) => Image.asset(ImageConstants.banner,fit: BoxFit.fill,),
                errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.banner,fit: BoxFit.fill,),
              )
            ),
        options: CarouselOptions(
          height: 190,
          aspectRatio: 16/9,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          //onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        )
    ));

  }

  ///Show Category List....
  Widget showCategoryList(){
    return Obx(() => controller.categoryProgressBar.value?
    Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.categoryProgressBar.value,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 80,
              margin: const EdgeInsets.only(right: 10,top: 10,bottom: 0),
              decoration:  BoxDecoration(
                  border:  Border.all(color: Colors.black12, width: 1),
                    borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                   Container(
                    height: 70,
                     decoration: const BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                       color: Colors.black
                     ),
                  ),
                  Container(
                    height: 10,
                    margin: const EdgeInsets.only(top: 3,bottom: 3),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 80,
              margin: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black
                    ),
                  ),
                  Container(
                    height: 10,
                    margin: const EdgeInsets.only(top: 3,bottom: 3),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 80,
              margin: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black
                    ),
                  ),
                  Container(
                    height: 10,
                    margin: const EdgeInsets.only(top: 3,bottom: 3),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    ):ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: controller.getCategoryModel!.result!.length,
      itemBuilder: (context, int index) {
        CategoryResult item=controller.getCategoryModel!.result![index];
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
                width: 80,
                height: 100,
                margin: const EdgeInsets.only(left: 5, right: 5),
                padding: const EdgeInsets.all(10),
                decoration:const BoxDecoration(
                  color: primary3Color,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl:item.image!,
                      fit:BoxFit.fill,
                      placeholder: (BuildContext context, String url) => Image.asset(IconConstants.icCat,fit: BoxFit.fill,height: 60,),
                      errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(IconConstants.icCat,fit: BoxFit.fill,height: 60,),
                    ),
                    Text(item.categoryName!,style: MyTextStyle.titleStyle14b,textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ));
      },
    )
    );
  }

  /// Show Pet Animals cards according category...
  Widget showPetCards(){
    return Obx(() =>controller.showAllPostProgressBar.value?
    Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.showAllPostProgressBar.value,
        child:ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context,int index){
              return  Container(
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
              );
            }
        )
    ):
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: controller.getAllUsersPostModel!.result!.length,
          itemBuilder: (context, int index) {
               GetAllUsersPostResult item=controller.getAllUsersPostModel!.result![index];
               bool checkFollow=checkFollowing(item.userId!);
            return GestureDetector(
                onTap: () {
                  controller.openPostDetailsPages(item.userId!,item.userPost![item.userPost!.length-1].postId!);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black12, width: 1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  semanticContainer: true,
                  clipBehavior: Clip.none,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 3, bottom: 3),
                  elevation: 2,
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
                          //leading: Image.asset('assets/icons/cat.png',height: 30,width: 30,),
                          leading: CachedNetworkImage(
                            imageUrl:item.userImage!,
                            fit:BoxFit.fill,
                            placeholder: (BuildContext context, String url) => const SizedBox(),
                            errorWidget: (BuildContext context, String url, dynamic error) =>Image.asset('assets/icons/cat.png',height: 30,width: 30,),
                          ),
                          title: Text(item.fullName!,style: MyTextStyle.titleStyle16bb,maxLines: 1,),
                          horizontalTitleGap: 0.0,
                          trailing: Container(
                            height: 35,
                            width: 70,
                            alignment: Alignment.center,
                            decoration:  BoxDecoration(
                                borderRadius:const  BorderRadius.all(Radius.circular(8)),
                                color:checkFollow?transparentColor: primaryColor
                            ),
                            padding: const EdgeInsets.only(left: 5,right: 5),
                            child: checkFollow?Text("UnFollow",style: MyTextStyle.titleStyle14bb,):
                            Text("Follow",style: MyTextStyle.titleStyle14bw,),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(item.description!,style: MyTextStyle.titleStyle14b,
                            overflow: TextOverflow.ellipsis,maxLines: 1,),
                        ),
                        Container(
                          height: 200,
                          margin: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                          child:
                          CachedNetworkImage(
                            imageUrl:item.userPost![item.userPost!.length-1].postData!,
                            fit:BoxFit.fill,
                            placeholder: (BuildContext context, String url) => const SizedBox(),
                            errorWidget: (BuildContext context, String url, dynamic error) =>Image.asset(IconConstants.icCat,fit: BoxFit.fill,),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/icons/like.png',height: 15,width: 15,),
                                  const SizedBox(width: 5,),
                                  Text(item.totalLikes!.toString(),style: MyTextStyle.titleStyle16b,)
                                ],
                              ),
                              const SizedBox(width: 20,),
                              Row(
                                children: [
                                  Image.asset('assets/icons/comment.png',height: 15,width: 15,),
                                  const SizedBox(width: 5,),
                                  Text(item.totalComment!.toString(),style: MyTextStyle.titleStyle16b,)
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
                        )
                      ],
                    ),
                  ),
                ));
          },
        )
    );
  }

  bool checkFollowing(String usersId) {
    for(GetFollowersResult model in controller.getFollowersModel!.result!){
      if(model.otherUserId==usersId){
        return true;
      }
    }
    return false;
  }
}