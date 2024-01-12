class GetResponseModel {
  Result? result;
  String? message;
  String? status;

  GetResponseModel({this.result, this.message, this.status});

  GetResponseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
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

class Result {


Result.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> data = <String, dynamic>{};
return data;
}
}

