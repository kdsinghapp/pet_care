class ProductDetailsModel {
  ProductDetailsResult? result;
  String? message;
  String? status;

  ProductDetailsModel({this.result, this.message, this.status});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? ProductDetailsResult.fromJson(json['result']) : null;
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

class ProductDetailsResult {
  String? id;
  String? name;
  String? category;
  String? subCategory;
  String? description;
  String? price;
  String? weight;
  String? weightIn;
  String? status;
  String? inStock;
  String? quantity;
  String? dateTime;
  List<ProductImages>? productImages;

  ProductDetailsResult(
      {this.id,
        this.name,
        this.category,
        this.subCategory,
        this.description,
        this.price,
        this.weight,
        this.weightIn,
        this.status,
        this.inStock,
        this.quantity,
        this.dateTime,
        this.productImages});

  ProductDetailsResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    subCategory = json['sub_category'];
    description = json['description'];
    price = json['price'];
    weight = json['weight'];
    weightIn = json['weight_in'];
    status = json['status'];
    inStock = json['in_stock'];
    quantity = json['quantity'];
    dateTime = json['date_time'];
    if (json['product_images'] != null) {
      productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        productImages!.add(ProductImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['sub_category'] = subCategory;
    data['description'] = description;
    data['price'] = price;
    data['weight'] = weight;
    data['weight_in'] = weightIn;
    data['status'] = status;
    data['in_stock'] = inStock;
    data['quantity'] = quantity;
    data['date_time'] = dateTime;
    if (productImages != null) {
      data['product_images'] =
          productImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductImages {
  String? id;
  String? productId;
  String? image;
  String? dateTime;

  ProductImages({this.id, this.productId, this.image, this.dateTime});

  ProductImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['image'] = image;
    data['date_time'] = dateTime;
    return data;
  }
}
