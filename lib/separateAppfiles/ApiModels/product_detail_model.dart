
class ProductDetailModel {
  ProductDetails? productDetails;

  ProductDetailModel({this.productDetails});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    productDetails = json["product details"] == null ? null : ProductDetails.fromJson(json["product details"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(productDetails != null) {
      _data["product details"] = productDetails?.toJson();
    }
    return _data;
  }
}

class ProductDetails {
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
  String? createdAt;
  String? updatedAt;
  List<dynamic>? images;

  ProductDetails({this.id, this.productCode, this.productName, this.categoryId, this.subcategoryId, this.productPrice, this.productUnit, this.productDescription, this.productThumbnail, this.thumbnailUrl, this.createdAt, this.updatedAt, this.images});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    productCode = json["product_code"];
    productName = json["product_name"];
    categoryId = json["category_id"];
    subcategoryId = json["subcategory_id"];
    productPrice = json["product_price"];
    productUnit = json["product_unit"];
    productDescription = json["product_description"];
    productThumbnail = json["product_thumbnail"];
    thumbnailUrl = json["thumbnail_url"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    images = json["images"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["product_code"] = productCode;
    _data["product_name"] = productName;
    _data["category_id"] = categoryId;
    _data["subcategory_id"] = subcategoryId;
    _data["product_price"] = productPrice;
    _data["product_unit"] = productUnit;
    _data["product_description"] = productDescription;
    _data["product_thumbnail"] = productThumbnail;
    _data["thumbnail_url"] = thumbnailUrl;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    if(images != null) {
      _data["images"] = images;
    }
    return _data;
  }
}