class SupportUsModel {
  SupportResult? result;
  String? message;
  String? status;

  SupportUsModel({this.result, this.message, this.status});

  SupportUsModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? SupportResult.fromJson(json['result']) : null;
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

class SupportResult {
  String? id;
  String? userId;
  String? name;
  String? email;
  String? mobile;
  String? message;
  String? status;
  String? dateTime;

  SupportResult(
      {this.id,
        this.userId,
        this.name,
        this.email,
        this.mobile,
        this.message,
        this.status,
        this.dateTime});

  SupportResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    message = json['message'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['message'] = message;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
