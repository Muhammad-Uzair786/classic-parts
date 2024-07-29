class SubCategoryProductsModel {
  List<Products>? products;

  SubCategoryProductsModel({this.products});

  SubCategoryProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
