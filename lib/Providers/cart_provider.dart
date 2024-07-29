import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
///original
class CartProvider extends ChangeNotifier
{
   List <CartItem> cartitems=[];
   List cartdetail=[];
   String countvalue='1';
   // Constructor to initialize the cart from SharedPreferences
   CartProvider() {
     //loadCartItems();
   }
   clearCartItems()
   {
     cartitems.clear();
     notifyListeners();
   }
   Future<void> addItem(CartItem item) async {
     cartitems.add(item);
     print("items$cartitems");
     await saveCartItems(cartitems);
     notifyListeners();

   }
   Future<String> savedetailcount(String detailcount,id) async {
     final prefs = await SharedPreferences.getInstance();
     await prefs.setString("detail_count$id", detailcount);
     countvalue=await prefs.getString("detail_count$id")!;
     var maplist=[];
    maplist.add({
      '$id':'$detailcount'
    });
     notifyListeners();

     return countvalue;

   }
   Future<void> removeItem(int index) async {
     cartitems.removeAt(index);
     await saveCartItems(cartitems);
     notifyListeners();

   }
   ///
   Future<void> removecount(String id) async {
     counted.remove(id);
     final prefs = await SharedPreferences.getInstance();
      prefs.remove("detail_count$id");
     // await saveCartItems(cartitems);
     notifyListeners();

   }
   clearAllcounts()
   {
     print('beforclear$counted');
     counted.clear();
     print('afterclear$counted');
     notifyListeners();
   }
   ///
   Future<void> saveCartItems(List<CartItem> cartitems) async {
     final prefs = await SharedPreferences.getInstance();
     print("insaveitems$cartitems");
     final cartItemsJson = cartitems.map((item) => jsonEncode(item.tojson())).toList();
     await prefs.setStringList('cartItems', cartItemsJson);
     print("cartItemsJson$cartItemsJson");

     print("itemsinsaved$cartitems");
       notifyListeners();
   }

   Future<void> loadCartItems() async {
     final prefs = await SharedPreferences.getInstance();
     final cartItemsJson = prefs.getStringList('cartItems') ?? [];

     cartitems = cartItemsJson.map(( item) => CartItem.fromJson(jsonDecode(item))).toList();
     print("itemsload$cartitems");

     notifyListeners();
   }


    addcartsDetail(carts)  {
     cartdetail.add(carts);
     notifyListeners();
   }
   ///must
   // Map<int, int> counts = {}; // Map to store count values
   // void onCountChanged(int index, int count) {
   //   // Update the count for a specific item in the Map
   //   counts[index] = count;
   //
   //
   //   // You can perform any additional logic here
   //   print("totalcounts--$counts Count for item $index is now $count");
   //    notifyListeners();
   // }



   ///
  Map<String, int> counted = {}; // Map to store count values
  void onCountedChanged(String id,count) {
    // Update the count for a specific item in the Map
    if(counted.containsKey(id))
    {

      counted[id] = counted[id]! +1;
      print("ifalreadyexists${counted[id]}");

    }else {
      // If it doesn't exist, add it to the cart with a counter of 1
      counted[id] = 1;
      print("newadd${counted[id]}");
    }
  print('oncountedchange$counted');


    // You can perform any additional logic here
   // print("totalcounts--$counts Count for item $index is now $count");
    notifyListeners();
  }
}

class CartItem
{
  String? productName;
  String? productPrice;
  String? productPoints;
  String? productPic;
  String? productId;
  CartItem({
    required this.productName,
    required this.productPrice,
    required this.productPoints,
    required this.productPic,
    required this.productId,
   });



 Map<String,dynamic> tojson()
  {
    return {
      'productName':productName,
      'productPrice':productPrice,
      'productPoints':productPoints,
      'productPic':productPic,
      'productId':productId
    };
  }
  // Create a CartItem from a JSON map
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productName: json['productName'],
      productPrice: json['productPrice'],
      productPoints: json['productPoints'],
      productPic: json['productPic'],
      productId: json['productId'],
// Ensure the price is parsed as double
    );
  }




}
///changimg
// class CartProvider extends ChangeNotifier
// {
//   List <CartItem> cartitems=[];
//   List<int> counts = [];
//
//   List cartdetail=[];
//   // Constructor to initialize the cart from SharedPreferences
//   // CartProvider() {
//   //   loadCartItems();
//   // }
//   clearCartItems()
//   {
//     cartitems.clear();
//     notifyListeners();
//   }
//   Future<void> addItem(CartItem item) async {
//     cartitems.add(item);
//     print("items$cartitems");
//     //counts.add(); // Initialize count to 1 for the newly added item
//
//     await saveCartItems(cartitems);
//     notifyListeners();
//
//   }
//
//   Future<void> removeItem(int index) async {
//     cartitems.removeAt(index);
//     //counts.removeAt(index);
//
//     await saveCartItems(cartitems);
//     notifyListeners();
//
//   }
//   Future<void> saveCartItems(List<CartItem> cartitems) async {
//     final prefs = await SharedPreferences.getInstance();
//     print("insaveitems$cartitems");
//     final cartItemsJson = cartitems.map((item) => jsonEncode(item.tojson())).toList();
//     await prefs.setStringList('cartItems', cartItemsJson);
//    // await prefs.setStringList('cartCounts', counts.map((count) => count.toString()).toList());
//
//     print("cartItemsJson$cartItemsJson");
//
//     print("itemsinsaved$cartitems");
//     notifyListeners();
//   }
//
//   Future<void> loadCartItems() async {
//     final prefs = await SharedPreferences.getInstance();
//     final cartItemsJson = prefs.getStringList('cartItems') ?? [];
//    // final cartCountsJson = prefs.getStringList('cartCounts') ?? [];
//
//     cartitems = cartItemsJson.map(( item) => CartItem.fromJson(jsonDecode(item))).toList();
//   //  counts = cartCountsJson.map((count) => int.parse(count)).toList();
//
//     print("itemsload$cartitems");
//
//     //notifyListeners();
//   }
//
//
//   addcartsDetail(carts)  {
//     cartdetail.add(carts);
//     notifyListeners();
//   }
//   ///
//  // Map<int, int> counts = {}; // Map to store count values
//   void onCountChanged(int index, int count) {
//     // Update the count for a specific item in the Map
//     counts[index] = count;
//
//     // You can perform any additional logic here
//     print("totalcounts--$counts Count for item $index is now $count");
//     notifyListeners();
//   }
// }
//
// class CartItem
// {
//   String? productName;
//   String? productPrice;
//   String? productPic;
//   String? productId;
//   CartItem({
//     required this.productName,
//     required this.productPrice,
//     required this.productPic,
//     required this.productId,
//   });
//
//
//
//   Map<String,dynamic> tojson()
//   {
//     return {
//       'productName':productName,
//       'productPrice':productPrice,
//       'productPic':productPic,
//       'productId':productId
//     };
//   }
//   // Create a CartItem from a JSON map
//   factory CartItem.fromJson(Map<String, dynamic> json) {
//     return CartItem(
//       productName: json['productName'],
//       productPrice: json['productPrice'],
//       productPic: json['productPic'],
//       productId: json['productId'],
// // Ensure the price is parsed as double
//     );
//   }
//
//
//
//
// }
// // class CartItemWithCount {
// //   final CartItem cartItem;
// //   int count;
// //
// //   CartItemWithCount({
// //     required this.cartItem,
// //     required this.count,
// //   });
// // }