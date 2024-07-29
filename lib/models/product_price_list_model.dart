class ProductPriceListModel {
  List<Products>? products;

  ProductPriceListModel({this.products});

  ProductPriceListModel.fromJson(Map<String, dynamic> json) {
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
  int? productCode;
  String? productName;
  String? productUnit;
  int? productPrice;

  Products(
      {this.productCode,
        this.productName,
        this.productUnit,
        this.productPrice});

  Products.fromJson(Map<String, dynamic> json) {
    productCode = json['product_code'];
    productName = json['product_name'];
    productUnit = json['product_unit'];
    productPrice = json['product_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_code'] = this.productCode;
    data['product_name'] = this.productName;
    data['product_unit'] = this.productUnit;
    data['product_price'] = this.productPrice;
    return data;
  }
}
