import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Constant/image_constants.dart';
import 'package:pet_care/Tool/MyTextStyle.dart';
import 'package:photo_manager/photo_manager.dart';
import '../Constant/string_constants.dart';
import '../Controller/PostController.dart';
import '../Tool/Color.dart';
import 'dart:typed_data';

class PostActivity extends StatefulWidget {
  final ScrollController? scrollCtr;
  const PostActivity({
    Key? key,
    this.scrollCtr,
  }) : super(key: key);


  @override
  State<PostActivity> createState() => _PostState();
}
class _PostState extends State<PostActivity> {
  PostController controller=Get.put(PostController());
  List<Widget> _mediaList = [];
  final List<File> path=[];
  File? _file;
  int currentPage = 0;
  int? lastPage;

  @override
  void initState() {
    super.initState();
    _fetchNewMedia();
  }

  _handleScrollEvent(ScrollNotification scroll) {
    if (scroll.metrics.pixels / scroll.metrics.maxScrollExtent > 0.33) {
      if (currentPage != lastPage) {
        _fetchNewMedia();
      }
    }
  }

  _fetchNewMedia() async {
    lastPage = currentPage;
    final PermissionState _ps = await PhotoManager.requestPermissionExtend();
    if (_ps.isAuth) {
      // success
//load the album list
      List<AssetPathEntity> albums =
      await PhotoManager.getAssetPathList(
          onlyAll: true);
      print(albums);
      List<AssetEntity> media  = await albums[0].getAssetListPaged(size: 60, page: currentPage); //preloading files
      print(media);
      for(var asset in media){
        if(asset.type== AssetType.image){
          final file= await asset.file;
          if(file!=null){
            path.add(File(file.path));
            _file=path[0];
          }
        }
      }
      // print("image path:-"+media[0]!.thumbnailDataWithSize(const ThumbnailSize(200, 200)).asStream().toString());
      // Future<File?> filename=media[0].file;
      // print("image path:-"+filename.toString());
      List<Widget> temp = [];
      for (var asset in media) {
        temp.add(
          FutureBuilder(
            future: asset.thumbnailDataWithSize(const ThumbnailSize(200, 200)), //resolution of thumbnail
            builder:
                (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // File file=File.fromRawPath(snapshot.data!);
                // print("File path:-"+file.uri.path);
                return Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.memory(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (asset.type == AssetType.video)
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 5, bottom: 5),
                          child: Icon(
                            Icons.videocam,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                );
              }
              return Container();
            },
          ),
        );
      }
      setState(() {
        _mediaList.addAll(temp);
        currentPage++;
        controller.changeProgressBar(false);
      });

    } else {
      /// if result is fail, you can call `PhotoManager.openSetting();`  to open android/ios applicaton's setting to get permission
    }
  }
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
            title:Text(StringConstants.post ,style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,),
            trailing:  GestureDetector(
              onTap: (){
                controller.openNewPostPage(path[controller.selectedImgIndex.value]);
              },
                child: Text(StringConstants.next ,style: MyTextStyle.titleStyle16by,textAlign: TextAlign.center,)),

          ),
          const SizedBox(height: 10,),
          Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            clipBehavior: Clip.hardEdge,
            margin:const  EdgeInsets.only(left: 15,right: 15),
            elevation: 2,
            child: SizedBox(
              height: 250,
              child: Obx(() => controller.progressBar.value?const SizedBox():_mediaList[controller.selectedImgIndex.value]),
            ),
          ),
          Container(
            margin:const  EdgeInsets.only(left: 15,right: 15,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(StringConstants.gallery,style: MyTextStyle.titleStyle16bb),
                    const Icon(Icons.keyboard_arrow_down,size: 25,)
                    
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){},
                        icon:  const Icon(Icons.camera_alt,size: 25,)),
                    IconButton(onPressed: (){},
                        icon:  const Icon(Icons.dashboard,size: 25,))


                  ],
                )
              ],
            ),
          ),
          Expanded(
            child:Container(
                margin:const  EdgeInsets.only(left: 15,right: 15),
                child: showRecentImages()),

          ),
        ],
      ),
    );
  }

  Widget showRecentImages(){
    return
      GridView.builder(
          controller: widget.scrollCtr,
          itemCount: _mediaList.length,
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                controller.changeSelected(index);
              },
              child: Container(
                 decoration: const BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(10)),
                   color: primary3Color
                 ),
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.all(5),
                  child:Stack(
                    children: [
                      _mediaList[index],
                      Positioned(
                        top: 5,right: 5,
                          child:Obx(() =>  Container(width: 20,height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:controller.selectedImgIndex.value==index?greenColor: primary3Color
                            ),
                          ))
                      )
                    ],
                  )
                  //child: _mediaList[index]
              ),
            );
          });
  }

}