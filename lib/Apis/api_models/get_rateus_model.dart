class RateUsModel {
  RateUsResult? result;
  String? message;
  String? status;

  RateUsModel({this.result, this.message, this.status});

  RateUsModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? RateUsResult.fromJson(json['result']) : null;
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

class RateUsResult {
  String? id;
  String? userId;
  String? rating;
  String? feedback;
  String? dateTime;

  RateUsResult({this.id, this.userId, this.rating, this.feedback, this.dateTime});

  RateUsResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    rating = json['rating'];
    feedback = json['feedback'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['rating'] = rating;
    data['feedback'] = feedback;
    data['date_time'] = dateTime;
    return data;
  }
}
