class AddToCartModel {
  Result? result;
  String? message;
  String? status;

  AddToCartModel({this.result, this.message, this.status});

  AddToCartModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
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
  String? id;
  String? userId;
  String? productId;
  String? quantity;
  String? productPrice;
  String? productTotalPrice;
  String? status;
  String? dateTime;

  Result(
      {this.id,
        this.userId,
        this.productId,
        this.quantity,
        this.productPrice,
        this.productTotalPrice,
        this.status,
        this.dateTime});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    productPrice = json['product_price'];
    productTotalPrice = json['product_total_price'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['quantity'] = quantity;
    data['product_price'] = productPrice;
    data['product_total_price'] = productTotalPrice;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
