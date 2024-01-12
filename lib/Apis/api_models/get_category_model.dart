class GetCategoryModel {
  List<CategoryResult>? result;
  String? message;
  String? status;

  GetCategoryModel({this.result, this.message, this.status});

  GetCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <CategoryResult>[];
      json['result'].forEach((v) {
        result!.add(CategoryResult.fromJson(v));
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

class CategoryResult {
  String? id;
  String? categoryName;
  String? image;
  String? status;
  String? dateTime;

  CategoryResult({this.id, this.categoryName, this.image, this.status, this.dateTime});

  CategoryResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    image = json['image'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_name'] = categoryName;
    data['image'] = image;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
