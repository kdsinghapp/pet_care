class GetSearchHistoryModel {
  List<GetSearchHistoryResult>? result;
  String? message;
  String? status;

  GetSearchHistoryModel({this.result, this.message, this.status});

  GetSearchHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] != "0") {
      result = <GetSearchHistoryResult>[];
      json['result'].forEach((v) {
        result!.add(GetSearchHistoryResult.fromJson(v));
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

class GetSearchHistoryResult {
  String? id;
  String? userId;
  String? search;
  String? dateTime;

  GetSearchHistoryResult({this.id, this.userId, this.search, this.dateTime});

  GetSearchHistoryResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    search = json['search'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['search'] = search;
    data['date_time'] = dateTime;
    return data;
  }
}
