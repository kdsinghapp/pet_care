class GetPostDetailsModel {
  GetPostDetailsResult? result;
  String? message;
  String? status;

  GetPostDetailsModel({this.result, this.message, this.status});

  GetPostDetailsModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? GetPostDetailsResult.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetPostDetailsResult {
  String? id;
  String? userId;
  String? description;
  String? location;
  String? lat;
  String? lon;
  String? type;
  String? status;
  String? dateTime;
  String? fullName;
  String? userImage;
  String? timeAgo;
  String? likeUnlikeStatus;
  int? totalLikes;
  int? totalComment;
  String? follow;
  List<UserPost>? userPost;

  GetPostDetailsResult(
      {this.id,
        this.userId,
        this.description,
        this.location,
        this.lat,
        this.lon,
        this.type,
        this.status,
        this.dateTime,
        this.fullName,
        this.userImage,
        this.timeAgo,
        this.likeUnlikeStatus,
        this.totalLikes,
        this.totalComment,
        this.follow,
        this.userPost});

  GetPostDetailsResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    description = json['description'];
    location = json['location'];
    lat = json['lat'];
    lon = json['lon'];
    type = json['type'];
    status = json['status'];
    dateTime = json['date_time'];
    fullName = json['full_name'];
    userImage = json['user_image'];
    timeAgo = json['time_ago'];
    likeUnlikeStatus = json['likeUnlike_status'];
    totalLikes = json['total_likes'];
    totalComment = json['total_comment'];
    follow = json['follow'];
    if (json['user_post'] != null) {
      userPost = <UserPost>[];
      json['user_post'].forEach((v) {
        userPost!.add(UserPost.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['description'] = description;
    data['location'] = location;
    data['lat'] = lat;
    data['lon'] = lon;
    data['type'] = type;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['full_name'] = fullName;
    data['user_image'] = userImage;
    data['time_ago'] = timeAgo;
    data['likeUnlike_status'] = likeUnlikeStatus;
    data['total_likes'] = totalLikes;
    data['total_comment'] = totalComment;
    data['follow'] = follow;
    if (userPost != null) {
      data['user_post'] = userPost!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserPost {
  String? id;
  String? postId;
  String? postData;
  String? status;
  String? dateTime;

  UserPost({this.id, this.postId, this.postData, this.status, this.dateTime});

  UserPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    postData = json['post_data'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['post_id'] = postId;
    data['post_data'] = postData;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
