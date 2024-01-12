
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/Activity/NewPostActivity.dart';
import 'package:photo_manager/photo_manager.dart';


class PostController extends GetxController{
  RxInt selectedImgIndex=0.obs;
  RxBool progressBar=true.obs;
  @override
  void onInit() {
    super.onInit();
    loadRecentImages();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  changeSelected(int index){
    selectedImgIndex.value=index;
  }
  changeProgressBar(bool value){
    progressBar.value=value;
  }
  Future<void> loadRecentImages() async {

    List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
      onlyAll: true,
      type: RequestType.image,
    );

    if (albums.isNotEmpty) {
      List<AssetEntity> recentImages = await albums.first.getAssetListRange(
        start: 0,
        end: 10, // Fetch the first 10 images
      );
      recentImages = recentImages;
      print("Length"+recentImages.length.toString());
    }
  }

  openNewPostPage(File file){
   // Map<String,String> data={"img_file":file.path,};
    // Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context)=>const NewPostActivity()));
    Get.toNamed('/newPostActivity',arguments: [file]);
   // Get.toNamed('/newPostActivity',parameters: data);
  }

}