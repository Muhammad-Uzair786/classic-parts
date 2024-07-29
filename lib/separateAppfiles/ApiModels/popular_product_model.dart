class PopularProductsModel {
  List<Products>? products;

  PopularProductsModel({this.products});

  PopularProductsModel.fromJson(Map<String, dynamic> json) {
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
  String? thumbnailUrl;
  String? productThumbnail;
  String? productName;
  int? productPrice;

  Products(
      {this.id,
        this.thumbnailUrl,
        this.productThumbnail,
        this.productName,
        this.productPrice});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumbnailUrl = json['thumbnail_url'];
    productThumbnail = json['product_thumbnail'];
    productName = json['product_name'];
    productPrice = json['product_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['product_thumbnail'] = this.productThumbnail;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    return data;
  }
}
