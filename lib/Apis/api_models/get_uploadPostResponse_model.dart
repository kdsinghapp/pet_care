class GetUploadPostResponseModel {
  GetUploadPostResponseResult? result;
  String? message;
  String? status;

  GetUploadPostResponseModel({this.result, this.message, this.status});

  GetUploadPostResponseModel.fromJson(Map<String, dynamic> json) {
    result =
    json['status'] != "0" ? GetUploadPostResponseResult.fromJson(json['result']) : null;
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

class GetUploadPostResponseResult {
  String? id;
  String? userId;
  String? description;
  String? location;
  String? lat;
  String? lon;
  String? type;
  String? status;
  String? dateTime;

  GetUploadPostResponseResult(
      {this.id,
        this.userId,
        this.description,
        this.location,
        this.lat,
        this.lon,
        this.type,
        this.status,
        this.dateTime});

  GetUploadPostResponseResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    description = json['description'];
    location = json['location'];
    lat = json['lat'];
    lon = json['lon'];
    type = json['type'];
    status = json['status'];
    dateTime = json['date_time'];
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
    return data;
  }
}
