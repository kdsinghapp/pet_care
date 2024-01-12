class SubmitCommentResponseModel {
  SubmitCommentResponseResult? result;
  String? message;
  String? status;

  SubmitCommentResponseModel({this.result, this.message, this.status});

  SubmitCommentResponseModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? SubmitCommentResponseResult.fromJson(json['result']) : null;
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

class SubmitCommentResponseResult {
  String? id;
  String? userId;
  String? postId;
  String? comment;
  String? status;
  String? dateTime;

  SubmitCommentResponseResult(
      {this.id,
        this.userId,
        this.postId,
        this.comment,
        this.status,
        this.dateTime});

  SubmitCommentResponseResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    postId = json['post_id'];
    comment = json['comment'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['post_id'] = postId;
    data['comment'] = comment;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
