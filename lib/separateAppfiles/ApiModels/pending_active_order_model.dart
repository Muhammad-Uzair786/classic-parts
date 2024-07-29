class PendingActiveOrderModel {
  List<Orders>? orders;

  PendingActiveOrderModel({this.orders});

  PendingActiveOrderModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  String? trackingId;
  List<Order>? order;

  Orders({this.trackingId, this.order});

  Orders.fromJson(Map<String, dynamic> json) {
    trackingId = json['tracking_id'];
    if (json['order'] != null) {
      order = <Order>[];
      json['order'].forEach((v) {
        order!.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tracking_id'] = this.trackingId;
    if (this.order != null) {
      data['order'] = this.order!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  int? id;
  int? userId;
  int? productId;
  int? quantity;
  int? price;
  String? trackingId;
  String? status;
  String? createdAt;
  String? updatedAt;
  Products? products;

  Order(
      {this.id,
        this.userId,
        this.productId,
        this.quantity,
        this.price,
        this.trackingId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.products});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    price = json['price'];
    trackingId = json['tracking_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['tracking_id'] = this.trackingId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    return data;
  }
}

class Products {
  int? id;
  int? productCode;
  String? productName;
  String? productNameUrdu;
  int? categoryId;
  int? subcategoryId;
  int? productPoints;
  int? productPrice;
  String? productUnit;
  String? productDescription;
  String? productThumbnail;
  String? thumbnailUrl;
  int? sales;
  String? createdAt;
  String? updatedAt;

  Products(
      {this.id,
        this.productCode,
        this.productName,
        this.productNameUrdu,
        this.categoryId,
        this.subcategoryId,
        this.productPoints,
        this.productPrice,
        this.productUnit,
        this.productDescription,
        this.productThumbnail,
        this.thumbnailUrl,
        this.sales,
        this.createdAt,
        this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productCode = json['product_code'];
    productName = json['product_name'];
    productNameUrdu = json['product_name_urdu'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    productPoints = json['product_points'];
    productPrice = json['product_price'];
    productUnit = json['product_unit'];
    productDescription = json['product_description'];
    productThumbnail = json['product_thumbnail'];
    thumbnailUrl = json['thumbnail_url'];
    sales = json['sales'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_code'] = this.productCode;
    data['product_name'] = this.productName;
    data['product_name_urdu'] = this.productNameUrdu;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['product_points'] = this.productPoints;
    data['product_price'] = this.productPrice;
    data['product_unit'] = this.productUnit;
    data['product_description'] = this.productDescription;
    data['product_thumbnail'] = this.productThumbnail;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['sales'] = this.sales;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
