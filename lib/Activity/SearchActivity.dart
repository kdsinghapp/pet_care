
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Apis/api_models/get_faq_model.dart';
import 'package:pet_care/Apis/api_models/get_searchHistory_model.dart';
import 'package:pet_care/Apis/api_models/get_searchUserName_model.dart';
import 'package:pet_care/Constant/string_constants.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';
import '../Constant/icons_constants.dart';
import '../Controller/SearchController.dart';
import '../Tool/Color.dart';

class SearchActivity extends StatefulWidget {
  const SearchActivity({super.key});

  @override
  State<SearchActivity> createState() => _SearchState();
}
class _SearchState extends State<SearchActivity> {
  MySearchController controller=Get.put(MySearchController());
  var searchHistory=['Spring outing','Teddy','Dog','Favourite food','Show Moe'];

  @override
  Widget build(BuildContext context) {
    final heights =MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primary3Color,
      body: Column(
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
                },
                child:   TextFormField(
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
                    hintText:'Search user name',
                    hintStyle:MyTextStyle.titleStyle16by,
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search_rounded,color: primaryColor,size: 25,),
                      onPressed: () {
                        controller.changeSearchUsersProgressbar(true);
                        controller.searchUserByName(controller.searchController.text);
                      },
                    ),
                    suffixIcon: Container(
                      height: 20,width: 20,
                      padding: const EdgeInsets.all(12),
                      child: InkWell(
                          onTap: (){
                            _showBottomSheetFilter(context);
                          },
                          child: Image.asset('assets/icons/filter.png',)),
                    ),

                  ),
                  onChanged: (text) {
                    controller.changeSearchUsersProgressbar(true);
                    controller.searchUserByName(controller.searchController.text);
                  },

                ),
                /* ListTile(
                    leading:const Icon(Icons.search_rounded,color: primaryColor,size: 25,),
                    horizontalTitleGap: 0.0,
                    title: Text("Search", style:MyTextStyle.titleStyle16by,),
                    trailing:InkWell(
                      onTap: (){
                        _showBottomSheetFilter(context);
                      },
                        child: Image.asset('assets/icons/filter.png',height: 25,width: 25,))
                ),*/
              ),
            ),
          ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Search history",style: MyTextStyle.titleStyle18bb,),
                          InkWell(onTap: (){
                            controller.submitDeleteSearchHistory();
                          },
                              child:const Icon(Icons.delete_outline,size: 25,color: Colors.black54))
                        ],
                      ),
                      SizedBox(
                        height: 100,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Obx(() => controller.showSearchHistoryProgressBar.value? Text("Your search history are empty. ",style: MyTextStyle.titleStyle14b,)
                              :showSearchHistoryList()),
                        ),
                      ),
                      Text("Top search",style: MyTextStyle.titleStyle18bb,),
                      SizedBox(
                        height: 100,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: showTopSearchList(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Hot circle",style: MyTextStyle.titleStyle18bb,),
                          TextButton(onPressed: (){},
                              child: Text("See more",style: MyTextStyle.titleStyle12by,))
                        ],
                      ),
                      SizedBox(
                        height: 100,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Obx(() => controller.showSearchUsersProgressBar.value?Text("There are not fond any Hot Circle. ",style: MyTextStyle.titleStyle14b,)
                              :showHotCircleList()),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Text("Popular Q&A",style: MyTextStyle.titleStyle18bb,),
                      SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child:Obx(() => controller.showFaqProgressBar.value?Text("There are not fond any popular Q&A . ",style: MyTextStyle.titleStyle14b,):
                          showQuestionAnswer() ),
                        ),

                    ],
                  ),
                ),
              ),
            ),


        ],
      ),
    );
  }
  ///Show Search History List....
  Widget showSearchHistoryList(){
    return GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
             // crossAxisCount: 2,
              childAspectRatio: 150/50,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
              maxCrossAxisExtent: 150
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.getSearchHistoryModel!.result!.length,
          itemBuilder: (BuildContext context,int index){
            GetSearchHistoryResult searchHistoryResult=controller.getSearchHistoryModel!.result![index];
            return Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color:Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              semanticContainer: true,
              clipBehavior: Clip.none,
              elevation: 0,
              color:primary3Color,
              child: Container(
                padding: const EdgeInsets.all(3),
                child:Center(child: Text(searchHistoryResult.search!,style: MyTextStyle.titleStyle16b, textAlign: TextAlign.center,),
                    ),
              ),
            );
          });
  }

  ///Show Top Search List....
  Widget showTopSearchList(){
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 150/50,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0,
            maxCrossAxisExtent: 150
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context,int index){
          return Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color:Colors.black12, width: 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            semanticContainer: true,
            clipBehavior: Clip.none,
            elevation: 0,
            color:primary3Color,
            child: Container(
              padding: const EdgeInsets.all(3),
              child: Center(child: Text(searchHistory[index],style: MyTextStyle.titleStyle16b, textAlign: TextAlign.center,),
              ),
            ),
          );
        });
  }

  ///Hot Circle List....
  Widget showHotCircleList(){
    return  ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: controller.searchUserByNameModel!.result!.length,
      itemBuilder: (context, int index) {
        SearchUserByNameResult item=controller.searchUserByNameModel!.result![index];
        return GestureDetector(
            onTap: () {
            },
            child: Container(
              width: 100,
              height: 100,
              color: primary3Color,
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    decoration:const BoxDecoration(
                      color: primary3Color,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Image.network(item.userImage!,fit:BoxFit.fill,
                      errorBuilder:
                          (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return  Image.asset(IconConstants.icCat,fit: BoxFit.fill,);
                      },
                    ),
                  ),
                  Center(child: Text(item.firstName!,style: MyTextStyle.titleStyle13b,textAlign: TextAlign.center,))
                ],
              ),
            ));
      },
    );
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


  ///Showing Bottom Sheet Dialog For Filter...
  void _showBottomSheetFilter(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState){
                return Container(
                  height:600,
                  margin: const EdgeInsets.only(top:20,left: 10,right: 10,bottom: 10),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Align(
                         alignment: Alignment.center,
                           child: Text(StringConstants.filter,style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center,)),
                        const SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                           Text(StringConstants.matchSetting,style: MyTextStyle.titleStyle18bb,),
                             const SizedBox(height: 20,),
                             Text(StringConstants.gender,style: MyTextStyle.titleStyle16bb,),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                    child: Text(StringConstants.male,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.center,),
                                  ),
                                ),
                                Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                    child: Text(StringConstants.female,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.center,),
                                  ),
                                ),
                                Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                    child: Text(StringConstants.any,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.center,),
                                  ),
                                )
                              ],
                            ),

                            const SizedBox(height: 20,),
                            Text(StringConstants.distanceUnit,style: MyTextStyle.titleStyle16bb,),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                    child: Text(StringConstants.km,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.center,),
                                  ),
                                ),
                                Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                    child: Text(StringConstants.miles,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.center,),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Text(StringConstants.distance,style: MyTextStyle.titleStyle16bb,),
                            const SizedBox(height: 10,),
                            Slider(
                              value: controller.distanceValue,
                              min: 0,
                              max: 200,
                            //  divisions: 30,
                              onChanged: (double value) {
                                setState(() {
                                  controller.changeDistance(value);
                                });
                              },
                              activeColor: primaryColor, // Sets the color of the active track
                              inactiveColor: Colors.grey, // Sets the color of the inactive track
                            ),
                            const SizedBox(height: 10,),
                            Text(StringConstants.age,style: MyTextStyle.titleStyle16bb,),
                            const SizedBox(height: 10,),
                            Slider(
                              value:controller.ageValue,
                              min: 0,
                              max: 200,
                              onChanged: (double value) {
                                setState(() {
                                  controller.changeAge(value);
                                });
                              },
                              activeColor: primaryColor, // Sets the color of the active track
                              inactiveColor: Colors.grey, // Sets the color of the inactive track
                            ),

                    GridView.builder(
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          // crossAxisCount: 2,
                            childAspectRatio: 150/60,
                            crossAxisSpacing: 2.0,
                            mainAxisSpacing: 2.0,
                            maxCrossAxisExtent: 150
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.pawSize.length,
                        itemBuilder: (BuildContext context,int index){
                          return Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color:Colors.black12, width: 1),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            semanticContainer: true,
                            clipBehavior: Clip.none,
                            elevation: 0,
                            color:primary3Color,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child:Center(child: Text(controller.pawSize[index],style: MyTextStyle.titleStyle14bb, textAlign: TextAlign.center,),
                              ),
                            ),
                          );
                        }),
                            const SizedBox(height: 20,),
                            Text(StringConstants.pawGender,style: MyTextStyle.titleStyle16bb,),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                    child: Text(StringConstants.male,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.center,),
                                  ),
                                ),
                                Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                    child: Text(StringConstants.female,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.center,),
                                  ),
                                ),
                                Card(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                    child: Text(StringConstants.any,style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.center,),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Text(StringConstants.age,style: MyTextStyle.titleStyle16bb,),
                            const SizedBox(height: 10,),
                            Slider(
                              value:controller.ageValue,
                              min: 0,
                              max: 200,
                              onChanged: (double value) {
                                setState(() {
                                  controller.changeAge(value);
                                });
                              },
                              activeColor: primaryColor, // Sets the color of the active track
                              inactiveColor: Colors.grey, // Sets the color of the inactive track
                            ),


                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 70,
                          padding: const EdgeInsets.only(left: 15,right: 15,top: 20,),
                          child: TextButton(
                            onPressed: (){
                            },
                            style: TextButton.styleFrom(backgroundColor: primaryColor),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(() => Visibility(
                                    visible: controller.filterProgressBar.value,
                                    child: const SizedBox(
                                        height:30,width:30,
                                        child:CircularProgressIndicator(color:primary3Color,)
                                    )
                                )),
                                const SizedBox(width: 10,),
                                Obx(() => controller.filterProgressBar.value?Text("Loading...",style: MyTextStyle.titleStyle16bw,):
                                Text(StringConstants.apply,style: MyTextStyle.titleStyle16bw,),),

                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              }
          );
        }
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

}