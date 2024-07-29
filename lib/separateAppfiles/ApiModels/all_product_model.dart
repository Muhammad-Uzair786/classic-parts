// class AllProductModel {
//   List<Products>? products;
//
//   AllProductModel({this.products});
//
//   AllProductModel.fromJson(Map<String, dynamic> json) {
//     if (json['products'] != null) {
//       products = <Products>[];
//       json['products'].forEach((v) {
//         products!.add(new Products.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.products != null) {
//       data['products'] = this.products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Products {
//   int? id;
//   String? thumbnailUrl;
//   String? productThumbnail;
//   String? productName;
//   int? productPrice;
//
//   Products(
//       {this.id,
//         this.thumbnailUrl,
//         this.productThumbnail,
//         this.productName,
//         this.productPrice});
//
//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     thumbnailUrl = json['thumbnail_url'];
//     productThumbnail = json['product_thumbnail'];
//     productName = json['product_name'];
//     productPrice = json['product_price'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['thumbnail_url'] = this.thumbnailUrl;
//     data['product_thumbnail'] = this.productThumbnail;
//     data['product_name'] = this.productName;
//     data['product_price'] = this.productPrice;
//     return data;
//   }
// }
class AllProductModel {
  List<Products>? products;

  AllProductModel({this.products});

  AllProductModel.fromJson(Map<String, dynamic> json) {
    products = <Products>[];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    } else {
      // Handle the case where 'products' is null or empty.
      products!.add(Products.defaultProduct());
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? thumbnailUrl;
  String? productThumbnail;
  String? productName;
  String? productnameUrdu;
  int? productPrice;

  Products({
    this.id,
    this.thumbnailUrl,
    this.productThumbnail,
    this.productName,
    this.productnameUrdu,
    this.productPrice,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumbnailUrl = json['thumbnail_url'];
    productThumbnail = json['product_thumbnail'];
    productName = json['product_name'];
    productnameUrdu = json['product_name_urdu'];
    productPrice = json['product_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['thumbnail_url'] = thumbnailUrl;
    data['product_thumbnail'] = productThumbnail;
    data['product_name'] = productName;
    data['product_name_urdu'] = productnameUrdu;
    data['product_price'] = productPrice;
    return data;
  }

  // Factory constructor to create a default Products object.
  factory Products.defaultProduct() {
    return Products(
      id: -1, // Provide a default value for 'id'.
      thumbnailUrl: 'https://tse3.mm.bing.net/th?id=OIP.eMRDV9sAYG9r02FK-DusOQAAAA&pid=Api&P=0&h=220.png', // Provide a default value for 'thumbnailUrl'.
      productThumbnail: '', // Provide a default value for 'productThumbnail'.
      productName: 'Default Product', // Provide a default value for 'productName'.
      productnameUrdu: 'Default Product', // Provide a default value for 'productName'.
      productPrice: 0, // Provide a default value for 'productPrice'.
    );
  }
}
