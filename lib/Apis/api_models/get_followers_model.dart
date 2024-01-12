class GetFollowersModel {
  List<GetFollowersResult>? result;
  String? message;
  String? status;

  GetFollowersModel({this.result, this.message, this.status});

  GetFollowersModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetFollowersResult>[];
      json['result'].forEach((v) {
        result!.add(GetFollowersResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetFollowersResult {
  String? id;
  String? userId;
  String? otherUserId;
  String? status;
  String? dateTime;
  String? following;
  FollowerDetails? followerDetails;

  GetFollowersResult(
      {this.id,
        this.userId,
        this.otherUserId,
        this.status,
        this.dateTime,
        this.following,
        this.followerDetails});

  GetFollowersResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    otherUserId = json['other_user_id'];
    status = json['status'];
    dateTime = json['date_time'];
    following = json['following'];
    followerDetails = json['follower_details'] != null
        ? FollowerDetails.fromJson(json['follower_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['other_user_id'] = otherUserId;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['following'] = following;
    if (followerDetails != null) {
      data['follower_details'] = followerDetails!.toJson();
    }
    return data;
  }
}

class FollowerDetails {
  String? fullName;
  String? email;
  String? mobile;
  String? image;

  FollowerDetails({this.fullName, this.email, this.mobile, this.image});

  FollowerDetails.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    mobile = json['mobile'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['image'] = image;
    return data;
  }
}
