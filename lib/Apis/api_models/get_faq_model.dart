class GetFAQModel {
  List<GetFAQResult>? result;
  String? message;
  String? status;

  GetFAQModel({this.result, this.message, this.status});

  GetFAQModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetFAQResult>[];
      json['result'].forEach((v) {
        result!.add(GetFAQResult.fromJson(v));
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

class GetFAQResult {
  String? id;
  String? question;
  String? description;
  String? status;
  String? sortOrder;
  String? dateTime;

  GetFAQResult(
      {this.id,
        this.question,
        this.description,
        this.status,
        this.sortOrder,
        this.dateTime});

  GetFAQResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    description = json['description'];
    status = json['status'];
    sortOrder = json['sort_order'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['description'] = description;
    data['status'] = status;
    data['sort_order'] = sortOrder;
    data['date_time'] = dateTime;
    return data;
  }
}
