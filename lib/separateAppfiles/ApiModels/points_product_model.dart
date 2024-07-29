class PointsProductModel {
  List<Products>? _products;

  PointsProductModel({List<Products>? products}) {
    if (products != null) {
      this._products = products;
    }
  }

  List<Products>? get products => _products;
  set products(List<Products>? products) => _products = products;

  PointsProductModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      _products = <Products>[];
      json['products'].forEach((v) {
        _products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._products != null) {
      data['products'] = this._products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? _id;
  String? _thumbnailUrl;
  int? _productPoints;
  String? _productThumbnail;
  String? _productName;
  int? _productPrice;

  Products(
      {int? id,
        String? thumbnailUrl,
        int? productPoints,
        String? productThumbnail,
        String? productName,
        int? productPrice}) {
    if (id != null) {
      this._id = id;
    }
    if (thumbnailUrl != null) {
      this._thumbnailUrl = thumbnailUrl;
    }
    if (productPoints != null) {
      this._productPoints = productPoints;
    }
    if (productThumbnail != null) {
      this._productThumbnail = productThumbnail;
    }
    if (productName != null) {
      this._productName = productName;
    }
    if (productPrice != null) {
      this._productPrice = productPrice;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get thumbnailUrl => _thumbnailUrl;
  set thumbnailUrl(String? thumbnailUrl) => _thumbnailUrl = thumbnailUrl;
  int? get productPoints => _productPoints;
  set productPoints(int? productPoints) => _productPoints = productPoints;
  String? get productThumbnail => _productThumbnail;
  set productThumbnail(String? productThumbnail) =>
      _productThumbnail = productThumbnail;
  String? get productName => _productName;
  set productName(String? productName) => _productName = productName;
  int? get productPrice => _productPrice;
  set productPrice(int? productPrice) => _productPrice = productPrice;

  Products.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _thumbnailUrl = json['thumbnail_url'];
    _productPoints = json['product_points'];
    _productThumbnail = json['product_thumbnail'];
    _productName = json['product_name'];
    _productPrice = json['product_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['thumbnail_url'] = this._thumbnailUrl;
    data['product_points'] = this._productPoints;
    data['product_thumbnail'] = this._productThumbnail;
    data['product_name'] = this._productName;
    data['product_price'] = this._productPrice;
    return data;
  }
}
