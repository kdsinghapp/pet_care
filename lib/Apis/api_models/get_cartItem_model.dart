class GetCartModel {
  List<GetCartResult>? result;
  String? message;
  String? status;
  String? totalAmount;

  GetCartModel({this.result, this.message, this.status, this.totalAmount});

  GetCartModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetCartResult>[];
      json['result'].forEach((v) {
        result!.add(GetCartResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
    totalAmount = json['total_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    data['total_amount'] = totalAmount;
    return data;
  }
}

class GetCartResult {
  String? id;
  String? userId;
  String? productId;
  String? quantity;
  String? productPrice;
  String? productTotalPrice;
  String? status;
  String? dateTime;
  String? totalAmount;
  String? productName;
  String? cartId;
  String? productImage;

  GetCartResult(
      {this.id,
        this.userId,
        this.productId,
        this.quantity,
        this.productPrice,
        this.productTotalPrice,
        this.status,
        this.dateTime,
        this.totalAmount,
        this.productName,
        this.cartId,
        this.productImage});

  GetCartResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    productPrice = json['product_price'];
    productTotalPrice = json['product_total_price'];
    status = json['status'];
    dateTime = json['date_time'];
    totalAmount = json['total_amount'];
    productName = json['product_name'];
    cartId = json['cart_id'];
    productImage = json['product_image'];
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
    data['total_amount'] = totalAmount;
    data['product_name'] = productName;
    data['cart_id'] = cartId;
    data['product_image'] = productImage;
    return data;
  }
}
