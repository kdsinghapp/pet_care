class GetNotificationModel {
  List<GetNotificationResult>? result;
  String? message;
  String? status;

  GetNotificationModel({this.result, this.message, this.status});

  GetNotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] != '0') {
      result = <GetNotificationResult>[];
      json['result'].forEach((v) {
        result!.add(GetNotificationResult.fromJson(v));
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

class GetNotificationResult {
  String? id;
  String? userId;
  String? otherUserId;
  String? notification;
  String? dateTime;
  String? status;

  GetNotificationResult(
      {this.id,
        this.userId,
        this.otherUserId,
        this.notification,
        this.dateTime,
        this.status});

  GetNotificationResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    otherUserId = json['other_user_id'];
    notification = json['notification'];
    dateTime = json['date_time'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['other_user_id'] = otherUserId;
    data['notification'] = notification;
    data['date_time'] = dateTime;
    data['status'] = status;
    return data;
  }
}
