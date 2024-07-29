class OrderDetailModel {
  List<Orderdetail>? orderdetail;

  OrderDetailModel({this.orderdetail});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    if (json['orderdetail'] != null) {
      orderdetail = <Orderdetail>[];
      json['orderdetail'].forEach((v) {
        orderdetail!.add(new Orderdetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderdetail != null) {
      data['orderdetail'] = this.orderdetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orderdetail {
  int? id;
  int? userId;
  int? productId;
  int? quantity;
  int? price;
  String? trackingId;
  String? status;
  String? createdAt;
  String? updatedAt;
  Users? users;
  Products? products;

  Orderdetail(
      {this.id,
        this.userId,
        this.productId,
        this.quantity,
        this.price,
        this.trackingId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.users,
        this.products});

  Orderdetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    price = json['price'];
    trackingId = json['tracking_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    users = json['users'] != null ? new Users.fromJson(json['users']) : null;
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
    if (this.users != null) {
      data['users'] = this.users!.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products!.toJson();
    }
    return data;
  }
}

class Users {
  int? id;
  String? name;
  Null? email;
  String? phone;
  Null? emailVerifiedAt;
  Null? imagePath;
  String? role;
  String? status;
  Null? address;
  int? userCredit;
  String? createdAt;
  String? updatedAt;

  Users(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.emailVerifiedAt,
        this.imagePath,
        this.role,
        this.status,
        this.address,
        this.userCredit,
        this.createdAt,
        this.updatedAt});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    imagePath = json['image_path'];
    role = json['role'];
    status = json['status'];
    address = json['address'];
    userCredit = json['user_credit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['image_path'] = this.imagePath;
    data['role'] = this.role;
    data['status'] = this.status;
    data['address'] = this.address;
    data['user_credit'] = this.userCredit;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Products {
  int? id;
  int? productCode;
  String? productName;
  int? categoryId;
  int? subcategoryId;
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
        this.categoryId,
        this.subcategoryId,
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
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
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
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
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
