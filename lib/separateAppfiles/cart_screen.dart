// // import 'package:com.classic.classicparts/separateAppfiles/product_detail_Screen.dart';
// // import 'package:flutter/material.dart';
// //
// // import '../constants.dart';
// // import 'CheckoutSection/place_order_screen.dart';
// //
// // class CartScreen extends StatefulWidget {
// //   final profilefield;
// //
// //   CartScreen({this.profilefield});
// //
// //   @override
// //   State<CartScreen> createState() => _CartScreenState();
// // }
// //
// // class _CartScreenState extends State<CartScreen> {
// //   bool isSwitched = false;
// //   String promoCode = "";
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: CustomColor.WhiteColor,
// //       appBar: AppBar(
// //         backgroundColor: CustomColor.WhiteColor,
// //         // Set the background color of the AppBar
// //         elevation: 0,
// //         // Set the elevation to 0 to remove the shadow
// //         title: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             GestureDetector(
// //               onTap: () {
// //                 Navigator.pop(context);
// //               },
// //               child: Container(
// //                 padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(5),
// //                   color: CustomColor.TextFieldColor,
// //                 ),
// //                 child: Align(
// //                   alignment: Alignment.center,
// //                   child: Icon(
// //                     Icons.arrow_back_ios,
// //                     size: 12,
// //                     color: Colors.black, // Icon color
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             Text(
// //               'My Cart',
// //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //             ),
// //             GestureDetector(
// //               onTap: () {
// //                 Navigator.pop(context);
// //               },
// //               child: Container(
// //                 padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(5),
// //                   color: CustomColor.TextFieldColor,
// //                 ),
// //                 child: Align(
// //                   alignment: Alignment.center,
// //                   child: Icon(
// //                     Icons.shopping_bag_outlined,
// //                     size: 15,
// //                     color: Colors.black, // Icon color
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //       body: ListView(
// //         padding: EdgeInsets.all(16),
// //         children: [
// //           buildCartField(
// //               leftimageUrl: 'https://www.classicparts.com/images/24-969.jpg',
// //               name: 'RTX Speedo',
// //               price: '1122\$'),
// //           buildCartField(
// //               leftimageUrl: 'https://www.classicparts.com/images/59-617_Front.jpg',
// //               name: 'Accessory Hood Bird',
// //               price: '2245\$'),
// //           buildCartField(
// //               leftimageUrl: 'https://www.classicparts.com/images/32-426B.jpg',
// //               name: 'Steering Wheel',
// //               price: '1320\$'),
// //           buildCartField(
// //               leftimageUrl: 'https://www.classicparts.com/images/91-415.jpg',
// //               name: 'Automatic Cross Shaft',
// //               price: '1222\$'),
// //           SizedBox(height: 20,),
// //           Center(
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 Expanded(
// //                   child: Container(
// //                     padding: EdgeInsets.all(5.0),
// //                     decoration: BoxDecoration(
// //
// //                       borderRadius: BorderRadius.circular(10.0),
// //                       color: CustomColor.TextFieldColor,
// //                     ),
// //                     child: Row(
// //                       children: [
// //                         SizedBox(width: 5,),
// //                         Expanded(
// //                           child: TextField(
// //                             onChanged: (value) {
// //                               setState(() {
// //                                 promoCode = value;
// //                               });
// //                             },
// //                             decoration: InputDecoration(
// //                               border: InputBorder.none,
// //                               hintText: 'Promo Code',
// //                               hintStyle: TextStyle(color: CustomColor.TextGreyColor)
// //                             ),
// //                           ),
// //                         ),
// //                         ElevatedButton(
// //                           onPressed: () {
// //                             // Implement your apply button functionality here
// //                             // For example, you can validate the promo code and apply a discount.
// //                           },
// //                           style: ElevatedButton.styleFrom(
// //                             shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(10.0),
// //                             ),
// //                             primary: Colors.black,
// //                           ),
// //                           child: Text(
// //                             'Apply',
// //                             style: TextStyle(color: Colors.white),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Container(
// //
// //             margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
// //             child: Column(
// //               children: [
// //                 ExtractedRow(title: 'Subtotal',price: '120',),
// //                 ExtractedRow(title: 'Shipping Fee',price: '50',),
// //                 ExtractedRow(title: 'Total',price: '170',)
// //               ],
// //             ),
// //           ),
// //           ElevatedButton(
// //             onPressed: () {
// //               // Implement your "Proceed to Checkout" button functionality here
// //               // For example, you can navigate to the checkout screen.
// //             },
// //             style: ElevatedButton.styleFrom(
// //               shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(10.0),
// //               ),
// //               primary: Colors.black,
// //             ),
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
// //               child: Text(
// //                 'Proceed to Checkout',
// //                 style: TextStyle(color: Colors.white),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget buildCartField({
// //     required String leftimageUrl,
// //     required String name,
// //     required String price,
// //     // required Widget rightWidget,
// //     bool profilefield = false,
// //   }) {
// //     return Container(
// //       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
// //       margin: EdgeInsets.symmetric(vertical: 10),
// //       decoration: BoxDecoration(
// //           color: CustomColor.TextFieldColor,
// //           borderRadius: BorderRadius.circular(10)),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           // Left Icon
// //           Container(
// //             height: 60,
// //             width: 60,
// //             decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(10),
// //                 color: CustomColor.BlackColor,
// //                 image: DecorationImage(image: NetworkImage("$leftimageUrl"))),
// //           ),
// //           // Middle Text
// //           Expanded(
// //             child: Container(
// //               padding: EdgeInsets.symmetric(horizontal: 15),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Text(
// //                     '$name',
// //                     style: TextStyle(fontSize: 18),
// //                   ),
// //                   Text(
// //                     '$price',
// //                     style: TextStyle(fontSize: 18, color: Colors.grey),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           // Right Icon
// //           IncrementDecrementBox()
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget buildNotiIcon({
// //     required final onSwitchChanged,
// //     required final Switchvalue,
// //   }) {
// //     return Container(
// //       padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
// //       margin: EdgeInsets.symmetric(vertical: 10),
// //       decoration: BoxDecoration(
// //           color: CustomColor.TextFieldColor,
// //           borderRadius: BorderRadius.circular(10)),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// // // Left Icon
// //           Container(
// //             height: 40,
// //             width: 40,
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(10),
// //               color: CustomColor.BlackColor,
// //             ),
// //             child: Icon(
// //               Icons.notifications,
// //               size: 20,
// //               color: Colors.white,
// //             ),
// //           ),
// // // Middle Text
// //           Expanded(
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 15.0),
// //               child: Text(
// //                 'Notifications',
// //                 style: TextStyle(fontSize: 18),
// //               ),
// //             ),
// //           ),
// // // Right Icon
// //           Transform.scale(
// //             scale: 0.5, // Adjust the value to resize the switch
// //             child: Switch(
// //               value: Switchvalue,
// //               activeTrackColor: CustomColor.BlackColor,
// //               inactiveTrackColor: CustomColor.WhiteColor,
// //               inactiveThumbColor: CustomColor.BlackColor,
// //               onChanged: onSwitchChanged,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // ///
// // class IncrementDecrementBox extends StatefulWidget {
// //   @override
// //   _IncrementDecrementBoxState createState() => _IncrementDecrementBoxState();
// // }
// //
// // class _IncrementDecrementBoxState extends State<IncrementDecrementBox> {
// //   int count = 0;
// //
// //   void increment() {
// //     setState(() {
// //       count++;
// //     });
// //   }
// //
// //   void decrement() {
// //     setState(() {
// //       if (count > 0) {
// //         count--;
// //       }
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 80,
// //       height: 30,
// //       decoration: BoxDecoration(
// //         color: Colors.black,
// //         borderRadius: BorderRadius.circular(5),
// //       ),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //         children: [
// //           InkWell(
// //             onTap: decrement,
// //             borderRadius: BorderRadius.circular(20),
// //             child: Icon(
// //               Icons.remove,
// //               size: 20,
// //               color: Colors.white,
// //             ),
// //           ),
// //           Text(
// //             count.toString(),
// //             style: TextStyle(
// //               // fontSize: ,
// //               color: CustomColor.WhiteColor,
// //             ),
// //           ),
// //           InkWell(
// //             onTap: increment,
// //             borderRadius: BorderRadius.circular(20),
// //             child: Icon(
// //               Icons.add,
// //               size: 20,
// //               color: Colors.white,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// //
// // ///
// // class ExtractedRow extends StatelessWidget {
// //   final title;
// //   final price;
// //   const ExtractedRow({super.key, this.title, this.price});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: [
// //         Row(
// //           children: [
// //             Text('$title',style: TextStyle(color: Colors.black,fontSize: 15),),
// //            title=='Total'?Text(' (04 item)'):SizedBox(),
// //           ],
// //         ),
// //         SizedBox(
// //             width: 70,
// //             child: Text("Rs:$price",textAlign: TextAlign.start,
// //             maxLines: 1,)),
// //       ],
// //     );
// //   }
// // }
//
//
// import 'package:com.classic.classicparts/Providers/cart_provider.dart';
// import 'package:com.classic.classicparts/separateAppfiles/MainBottomNavigationPage.dart';
// import 'package:com.classic.classicparts/separateAppfiles/home_screen.dart';
// import 'package:com.classic.classicparts/separateAppfiles/product_detail_Screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../constants.dart';
// import 'CheckoutSection/place_order_screen.dart';
//
// class CartScreen extends StatefulWidget {
//   final profilefield;
//
//   CartScreen({this.profilefield});
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   bool isSwitched = false;
//   String promoCode = "";
//   // List <CartItem> items=[123
//   //   CartItem(
//   //       leftimageUrl: 'https://www.classicparts.com/images/24-969.jpg',
//   //       name: 'RTX Speedo',
//   //       price: '1122\$'),
//   //   CartItem(
//   //       leftimageUrl: 'https://www.classicparts.com/images/59-617_Front.jpg',
//   //       name: 'Accessory Hood Bird',
//   //       price: '2245\$'),
//   //   CartItem(
//   //       leftimageUrl: 'https://www.classicparts.com/images/32-426B.jpg',
//   //       name: 'Steering Wheel',
//   //       price: '1320\$'),
//   //   CartItem(
//   //       leftimageUrl: 'https://www.classicparts.com/images/91-415.jpg',
//   //       name: 'Automatic Cross Shaft',
//   //       price: '1222\$'),
//   //
//   // ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColor.WhiteColor,
//
//       appBar: AppBar(
//         backgroundColor: CustomColor.WhiteColor,
//         title: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//             onTap: () {
//               //Navigator.pop(context);
//               Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainBottomNavigationPage()));
//
//             },
//             child: Container(
//               padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   gradient: CustomColor.GradientColor
//               ),
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Icon(
//                   Icons.arrow_back_ios,
//                   size: 12,
//                   color: CustomColor.WhiteColor, // Icon color
//                 ),
//               ),
//             ),
//           ),
//           Text(
//             'Shoping Cart',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(),
//         ],
//       ),automaticallyImplyLeading: false,),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           SizedBox(
//             height: 600,
//             child: ListView.builder(
//               padding: EdgeInsets.all(16),
//               itemCount:Provider.of<CartProvider>(context,listen: false).cartitems.length,
//               itemBuilder: (context, index) {
//                 final cartItem = Provider.of<CartProvider>(context,listen: false).cartitems[index];
//                print("cartid------${cartItem.productId}") ;
//                 return Dismissible(
//                   key: Key(cartItem.productName!),
//                   direction: DismissDirection.endToStart,
//                   onDismissed: (direction) {
//                     // Remove the item from the list
//                       Provider.of<CartProvider>(context,listen: false).removeItem(index);
//
//                     // Show a snackbar to inform the user
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('${cartItem.productName} dismissed')),
//                     );
//                   },
//                   background: Container(
//                     alignment: Alignment.centerRight,
//                     color: Colors.red,
//                     child: Padding(
//                       padding: EdgeInsets.only(right: 20.0),
//                       child: Icon(Icons.delete, color: Colors.white),
//                     ),
//                   ),
//                   child: buildCartField(
//                     leftimageUrl: cartItem.productPic!,
//                     name: cartItem.productName!,
//                     price: cartItem.productPrice!,
//                   ),
//                 );
//               },
//             ),
//           ),
//           GestureDetector(
//             onTap: () {
//               // Implement your "Proceed to Checkout" button functionality here
//               // For example, you can navigate to the checkout screen.
//               print("${Provider.of<CartProvider>(context,listen: false).cartitems}");
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlaceOrderScreen()));
//
//             },
//
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 gradient: CustomColor.GradientColor,
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
//               child: Text(
//                 'Proceed to Checkout',textAlign: TextAlign.center,
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//
//
//     //   Scaffold(
//     //   backgroundColor: CustomColor.WhiteColor,
//     //   appBar: AppBar(
//     //     backgroundColor: CustomColor.WhiteColor,
//     //     // Set the background color of the AppBar
//     //     elevation: 0,
//     //     // Set the elevation to 0 to remove the shadow
//     //     title: Row(
//     //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //       children: [
//     //         GestureDetector(
//     //           onTap: () {
//     //             Navigator.pop(context);
//     //           },
//     //           child: Container(
//     //             padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
//     //             decoration: BoxDecoration(
//     //               borderRadius: BorderRadius.circular(5),
//     //               color: CustomColor.TextFieldColor,
//     //             ),
//     //             child: Align(
//     //               alignment: Alignment.center,
//     //               child: Icon(
//     //                 Icons.arrow_back_ios,
//     //                 size: 12,
//     //                 color: Colors.black, // Icon color
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //         Text(
//     //           'My Cart',
//     //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//     //         ),
//     //         GestureDetector(
//     //           onTap: () {
//     //             Navigator.pop(context);
//     //           },
//     //           child: Container(
//     //             padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
//     //             decoration: BoxDecoration(
//     //               borderRadius: BorderRadius.circular(5),
//     //               color: CustomColor.TextFieldColor,
//     //             ),
//     //             child: Align(
//     //               alignment: Alignment.center,
//     //               child: Icon(
//     //                 Icons.shopping_bag_outlined,
//     //                 size: 15,
//     //                 color: Colors.black, // Icon color
//     //               ),
//     //             ),
//     //           ),
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     //   body: ListView(
//     //     padding: EdgeInsets.all(16),
//     //     children: [
//     //
//     //       SizedBox(height: 20,),
//     //       Center(
//     //         child: Row(
//     //           mainAxisAlignment: MainAxisAlignment.center,
//     //           children: [
//     //             Expanded(
//     //               child: Container(
//     //                 padding: EdgeInsets.all(5.0),
//     //                 decoration: BoxDecoration(
//     //
//     //                   borderRadius: BorderRadius.circular(10.0),
//     //                   color: CustomColor.TextFieldColor,
//     //                 ),
//     //                 child: Row(
//     //                   children: [
//     //                     SizedBox(width: 5,),
//     //                     Expanded(
//     //                       child: TextField(
//     //                         onChanged: (value) {
//     //                           setState(() {
//     //                             promoCode = value;
//     //                           });
//     //                         },
//     //                         decoration: InputDecoration(
//     //                             border: InputBorder.none,
//     //                             hintText: 'Promo Code',
//     //                             hintStyle: TextStyle(color: CustomColor.TextGreyColor)
//     //                         ),
//     //                       ),
//     //                     ),
//     //                     ElevatedButton(
//     //                       onPressed: () {
//     //                         // Implement your apply button functionality here
//     //                         // For example, you can validate the promo code and apply a discount.
//     //                       },
//     //                       style: ElevatedButton.styleFrom(
//     //                         shape: RoundedRectangleBorder(
//     //                           borderRadius: BorderRadius.circular(10.0),
//     //                         ),
//     //                         primary: Colors.black,
//     //                       ),
//     //                       child: Text(
//     //                         'Apply',
//     //                         style: TextStyle(color: Colors.white),
//     //                       ),
//     //                     ),
//     //                   ],
//     //                 ),
//     //               ),
//     //             ),
//     //           ],
//     //         ),
//     //       ),
//     //       Container(
//     //
//     //         margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
//     //         child: Column(
//     //           children: [
//     //             ExtractedRow(title: 'Subtotal',price: '120',),
//     //             ExtractedRow(title: 'Shipping Fee',price: '50',),
//     //             ExtractedRow(title: 'Total',price: '170',)
//     //           ],
//     //         ),
//     //       ),
//     //       ElevatedButton(
//     //         onPressed: () {
//     //           // Implement your "Proceed to Checkout" button functionality here
//     //           // For example, you can navigate to the checkout screen.
//     //         },
//     //         style: ElevatedButton.styleFrom(
//     //           shape: RoundedRectangleBorder(
//     //             borderRadius: BorderRadius.circular(10.0),
//     //           ),
//     //           primary: Colors.black,
//     //         ),
//     //         child: Padding(
//     //           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
//     //           child: Text(
//     //             'Proceed to Checkout',
//     //             style: TextStyle(color: Colors.white),
//     //           ),
//     //         ),
//     //       ),
//     //     ],
//     //   ),
//     // );
//   }
//
//   Widget buildCartField({
//     required String leftimageUrl,
//     required String name,
//     required String price,
//     // required Widget rightWidget,
//     bool profilefield = false,
//   }) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
//       margin: EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//          // color: CustomColor.TextFieldColor,
//         gradient: CustomColor.GradientColor,
//           borderRadius: BorderRadius.circular(10)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Left Icon
//           Container(
//             height: 60,
//             width: 60,
//             decoration: BoxDecoration(
//
//                 borderRadius: BorderRadius.circular(10),
//                 color: CustomColor.BlackColor,
//                 image: DecorationImage(image: NetworkImage("$leftimageUrl"),fit: BoxFit.cover)),
//           ),
//           // Middle Text
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '$name',
//                     style: TextStyle(fontSize: 18,color: CustomColor.WhiteColor),
//                   ),
//                   Text(
//                     '$price',
//                     style: TextStyle(fontSize: 18, color: Colors.white70),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Right Icon
//           IncrementDecrementBox()
//         ],
//       ),
//     );
//   }
//
//   Widget buildNotiIcon({
//     required final onSwitchChanged,
//     required final Switchvalue,
//   }) {
//     return Container(
//       padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
//       margin: EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//           color: CustomColor.TextFieldColor,
//           borderRadius: BorderRadius.circular(10)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
// // Left Icon
//           Container(
//             height: 40,
//             width: 40,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: CustomColor.BlackColor,
//             ),
//             child: Icon(
//               Icons.notifications,
//               size: 20,
//               color: Colors.white,
//             ),
//           ),
// // Middle Text
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15.0),
//               child: Text(
//                 'Notifications',
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           ),
// // Right Icon
//           Transform.scale(
//             scale: 0.5, // Adjust the value to resize the switch
//             child: Switch(
//               value: Switchvalue,
//               activeTrackColor: CustomColor.BlackColor,
//               inactiveTrackColor: CustomColor.WhiteColor,
//               inactiveThumbColor: CustomColor.BlackColor,
//               onChanged: onSwitchChanged,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// ///
// class IncrementDecrementBox extends StatefulWidget {
//   @override
//   _IncrementDecrementBoxState createState() => _IncrementDecrementBoxState();
// }
//
// class _IncrementDecrementBoxState extends State<IncrementDecrementBox> {
//   int count = 0;
//
//   void increment() {
//     setState(() {
//       count++;
//     });
//     print("countvalue----$count");
//   }
//
//   void decrement() {
//     setState(() {
//       if (count > 0) {
//         count--;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 80,
//       height: 30,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           InkWell(
//             onTap: decrement,
//             borderRadius: BorderRadius.circular(20),
//             child: Icon(
//               Icons.remove,
//               size: 20,
//               color: Colors.black,
//             ),
//           ),
//           Text(
//             count.toString(),
//             style: TextStyle(
//               // fontSize: ,
//               color: CustomColor.BlackColor,
//             ),
//           ),
//           InkWell(
//             onTap: increment,
//             borderRadius: BorderRadius.circular(20),
//             child: Icon(
//               Icons.add,
//               size: 20,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//
// }
//
// // class CartItem {
// //   final String leftimageUrl;
// //   final String name;
// //   final String price;
// //
// //   CartItem({
// //     required this.leftimageUrl,
// //     required this.name,
// //     required this.price, required ,
// //   });
// //}
// ///
// // class ExtractedRow extends StatelessWidget {
// //   final title;
// //   final price;
// //   const ExtractedRow({super.key, this.title, this.price});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: [
// //         Row(
// //           children: [
// //             Text('$title',style: TextStyle(color: Colors.black,fontSize: 15),),
// //             title=='Total'?Text(' (04 item)'):SizedBox(),
// //           ],
// //         ),
// //         SizedBox(
// //             width: 70,
// //             child: Text("Rs:$price",textAlign: TextAlign.start,
// //               maxLines: 1,)),
// //       ],
// //     );
// //   }
// // }

///for test
// import 'package:com.classic.classicparts/separateAppfiles/product_detail_Screen.dart';
// import 'package:flutter/material.dart';
//
// import '../constants.dart';
// import 'CheckoutSection/place_order_screen.dart';
//
// class CartScreen extends StatefulWidget {
//   final profilefield;
//
//   CartScreen({this.profilefield});
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   bool isSwitched = false;
//   String promoCode = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColor.WhiteColor,
//       appBar: AppBar(
//         backgroundColor: CustomColor.WhiteColor,
//         // Set the background color of the AppBar
//         elevation: 0,
//         // Set the elevation to 0 to remove the shadow
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: CustomColor.TextFieldColor,
//                 ),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Icon(
//                     Icons.arrow_back_ios,
//                     size: 12,
//                     color: Colors.black, // Icon color
//                   ),
//                 ),
//               ),
//             ),
//             Text(
//               'My Cart',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: CustomColor.TextFieldColor,
//                 ),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Icon(
//                     Icons.shopping_bag_outlined,
//                     size: 15,
//                     color: Colors.black, // Icon color
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(16),
//         children: [
//           buildCartField(
//               leftimageUrl: 'https://www.classicparts.com/images/24-969.jpg',
//               name: 'RTX Speedo',
//               price: '1122\$'),
//           buildCartField(
//               leftimageUrl: 'https://www.classicparts.com/images/59-617_Front.jpg',
//               name: 'Accessory Hood Bird',
//               price: '2245\$'),
//           buildCartField(
//               leftimageUrl: 'https://www.classicparts.com/images/32-426B.jpg',
//               name: 'Steering Wheel',
//               price: '1320\$'),
//           buildCartField(
//               leftimageUrl: 'https://www.classicparts.com/images/91-415.jpg',
//               name: 'Automatic Cross Shaft',
//               price: '1222\$'),
//           SizedBox(height: 20,),
//           Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: Container(
//                     padding: EdgeInsets.all(5.0),
//                     decoration: BoxDecoration(
//
//                       borderRadius: BorderRadius.circular(10.0),
//                       color: CustomColor.TextFieldColor,
//                     ),
//                     child: Row(
//                       children: [
//                         SizedBox(width: 5,),
//                         Expanded(
//                           child: TextField(
//                             onChanged: (value) {
//                               setState(() {
//                                 promoCode = value;
//                               });
//                             },
//                             decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: 'Promo Code',
//                               hintStyle: TextStyle(color: CustomColor.TextGreyColor)
//                             ),
//                           ),
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             // Implement your apply button functionality here
//                             // For example, you can validate the promo code and apply a discount.
//                           },
//                           style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10.0),
//                             ),
//                             primary: Colors.black,
//                           ),
//                           child: Text(
//                             'Apply',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//
//             margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
//             child: Column(
//               children: [
//                 ExtractedRow(title: 'Subtotal',price: '120',),
//                 ExtractedRow(title: 'Shipping Fee',price: '50',),
//                 ExtractedRow(title: 'Total',price: '170',)
//               ],
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // Implement your "Proceed to Checkout" button functionality here
//               // For example, you can navigate to the checkout screen.
//             },
//             style: ElevatedButton.styleFrom(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               primary: Colors.black,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
//               child: Text(
//                 'Proceed to Checkout',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildCartField({
//     required String leftimageUrl,
//     required String name,
//     required String price,
//     // required Widget rightWidget,
//     bool profilefield = false,
//   }) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
//       margin: EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//           color: CustomColor.TextFieldColor,
//           borderRadius: BorderRadius.circular(10)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Left Icon
//           Container(
//             height: 60,
//             width: 60,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: CustomColor.BlackColor,
//                 image: DecorationImage(image: NetworkImage("$leftimageUrl"))),
//           ),
//           // Middle Text
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '$name',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   Text(
//                     '$price',
//                     style: TextStyle(fontSize: 18, color: Colors.grey),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Right Icon
//           IncrementDecrementBox()
//         ],
//       ),
//     );
//   }
//
//   Widget buildNotiIcon({
//     required final onSwitchChanged,
//     required final Switchvalue,
//   }) {
//     return Container(
//       padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
//       margin: EdgeInsets.symmetric(vertical: 10),
//       decoration: BoxDecoration(
//           color: CustomColor.TextFieldColor,
//           borderRadius: BorderRadius.circular(10)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
// // Left Icon
//           Container(
//             height: 40,
//             width: 40,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: CustomColor.BlackColor,
//             ),
//             child: Icon(
//               Icons.notifications,
//               size: 20,
//               color: Colors.white,
//             ),
//           ),
// // Middle Text
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15.0),
//               child: Text(
//                 'Notifications',
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           ),
// // Right Icon
//           Transform.scale(
//             scale: 0.5, // Adjust the value to resize the switch
//             child: Switch(
//               value: Switchvalue,
//               activeTrackColor: CustomColor.BlackColor,
//               inactiveTrackColor: CustomColor.WhiteColor,
//               inactiveThumbColor: CustomColor.BlackColor,
//               onChanged: onSwitchChanged,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// ///
// class IncrementDecrementBox extends StatefulWidget {
//   @override
//   _IncrementDecrementBoxState createState() => _IncrementDecrementBoxState();
// }
//
// class _IncrementDecrementBoxState extends State<IncrementDecrementBox> {
//   int count = 0;
//
//   void increment() {
//     setState(() {
//       count++;
//     });
//   }
//
//   void decrement() {
//     setState(() {
//       if (count > 0) {
//         count--;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 80,
//       height: 30,
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           InkWell(
//             onTap: decrement,
//             borderRadius: BorderRadius.circular(20),
//             child: Icon(
//               Icons.remove,
//               size: 20,
//               color: Colors.white,
//             ),
//           ),
//           Text(
//             count.toString(),
//             style: TextStyle(
//               // fontSize: ,
//               color: CustomColor.WhiteColor,
//             ),
//           ),
//           InkWell(
//             onTap: increment,
//             borderRadius: BorderRadius.circular(20),
//             child: Icon(
//               Icons.add,
//               size: 20,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// ///
// class ExtractedRow extends StatelessWidget {
//   final title;
//   final price;
//   const ExtractedRow({super.key, this.title, this.price});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Text('$title',style: TextStyle(color: Colors.black,fontSize: 15),),
//            title=='Total'?Text(' (04 item)'):SizedBox(),
//           ],
//         ),
//         SizedBox(
//             width: 70,
//             child: Text("Rs:$price",textAlign: TextAlign.start,
//             maxLines: 1,)),
//       ],
//     );
//   }
// }

import 'dart:convert';

import 'package:com.classic.classicparts/Providers/cart_provider.dart';
import 'package:com.classic.classicparts/separateAppfiles/MainBottomNavigationPage.dart';
import 'package:com.classic.classicparts/separateAppfiles/home_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/product_detail_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Providers/authrememberprovider.dart';
import '../constants.dart';
import 'CheckoutSection/place_order_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///latest
class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool isSwitched = false;
  String promoCode = "";

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,
      appBar: AppBar(
        backgroundColor: CustomColor.WhiteColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                //Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => MainBottomNavigationPage()));
              },
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: CustomColor.GradientColor),
                child: const Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 12,
                    color: Colors.white, // Icon color
                  ),
                ),
              ),
            ),
            Text(
              '${tr?.shoping_cart}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
            ),
            SizedBox(),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              height: 600,
              child: Consumer<CartProvider>(
                builder: (BuildContext context, value, Widget? child) {
                  //Provider.of<CartProvider>(context,listen: false).loadCartItems();

                  return value.cartitems.isEmpty
                      ? Center(child: Text("${tr?.empty_cart}",style: TextStyle(color:CustomColor.BlackColor,)))
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: value.cartitems.length,
                          itemBuilder: (context, index) {
                            double totalprice = 0.0;

                            final cartItem = value.cartitems[index];
                            final itemprice = int.parse(cartItem.productPrice.toString()) ??
                                    0.0;
                            final countno =
                                value.counted[cartItem.productId] ?? 1;

                            final newprice = itemprice * countno;

                            totalprice = (totalprice + newprice);
                            print("counts---$countno");
                            print("itemprice$itemprice");
                            print("itempricewithcount${itemprice * countno}");
                            print("totalprice${totalprice * countno}");
                            print(
                                "cartid------${cartItem.productId} and length   ${Provider.of<CartProvider>(context, listen: false).cartitems.length}");
                            return Dismissible(
                              key: Key(cartItem.productName!),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                // Remove the item from the list
                                value.removecount(
                                    value.cartitems[index].productId!);

                                value.removeItem(index);
                                // print("remove-----${counts.remove('2')}");
                                // Show a snackbar to inform the user
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          '${cartItem.productName} dismissed')),
                                );
                              },
                              background: Container(
                                alignment: Alignment.centerRight,
                                color: Colors.red,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child:
                                      Icon(Icons.delete, color: Colors.white),
                                ),
                              ),
                              child: buildCartField(
                                  leftimageUrl: cartItem.productPic!,
                                  name: cartItem.productName!,
                                  price: cartItem.productPoints !='null'?cartItem.productPoints.toString():cartItem.productPrice.toString(),
                                  initialCount:
                                      value.counted[cartItem.productId] ?? 1,
                                  onCountedChanged: (count) {
                                    value.onCountedChanged(
                                        cartItem.productId!, count);
                                  }),
                            );
                          },
                        );
                },
              )),
          GestureDetector(
            onTap: () {
              if (Provider.of<CartProvider>(context, listen: false)
                  .cartitems
                  .isNotEmpty) {
                // Implement your "Proceed to Checkout" button functionality here
                // For example, you can navigate to the checkout screen.
                print(
                    "${Provider.of<CartProvider>(context, listen: false).cartitems[0].productId}");
                Provider.of<CartProvider>(context, listen: false)
                    .cartdetail
                    .clear();
                for (int i = 0;
                    i <
                        Provider.of<CartProvider>(context, listen: false)
                            .cartitems
                            .length;
                    i++) {
                  final cartItem =
                      Provider.of<CartProvider>(context, listen: false)
                          .cartitems[i];
                  final mapvalue = {
                    "product_id": cartItem.productId,
                    "quantity":
                        Provider.of<CartProvider>(context, listen: false)
                                .counted[cartItem.productId] ??
                            1,
                    "price": cartItem.productPrice
                  };
                  Provider.of<CartProvider>(context, listen: false)
                      .addcartsDetail(mapvalue);
                }
                print(
                    "cartdetail${Provider.of<CartProvider>(context, listen: false).cartdetail}");

                final pro = Provider.of<CartProvider>(context, listen: false);
                double totalamount = 0.0;
                double totalpoints = 0.0;
                List pronamewithprice = [];
                for (int i = 0; i < pro.cartitems.length; i++) {
                  String individualName =
                      pro.cartitems[i].productName.toString();

                  double individualprice =
                      double.parse(pro.cartitems[i].productPrice.toString());
                  String individualpoints =
                  pro.cartitems[i].productPoints.toString();
                  int? individualcount =
                      pro.counted[pro.cartitems[i].productId] ?? 1;
                  if(individualpoints=='null')
                    {
                      var cashConversion = individualprice * individualcount;
                      totalamount = totalamount + cashConversion;
                   print("insidelooppoints${individualpoints}");
                    }else
                      {
                        print("elsepoints${individualpoints}");
                        double pointsConversion = double.parse(individualpoints) * individualcount;
                        totalpoints = totalpoints + pointsConversion;

                      };



                  print('proprice${pro.cartitems[i].productPrice}');
                  // print('proprice${pro.counts[i]??1}');
                  ///add map objects to maplist

                  var newItem = {
                    "product_name": "$individualName",
                    "product_price": "$individualprice",
                    "product_points": "$individualpoints",
                    "product_count": "$individualcount",
                  };
                  pronamewithprice.add(newItem);
                }
                print("totalamount$totalamount");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PlaceOrderScreen(
                          totalamount: totalamount,
                            totalpoints: totalpoints,
                          pronamewithprice: pronamewithprice,
                        )));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Add Product To Cart To Proceed'),
                  ),
                );
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: CustomColor.GradientColor,
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: Text(
                '${tr?.proceed_to_checkout}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );

    //   Scaffold(
    //   backgroundColor: CustomColor.WhiteColor,
    //   appBar: AppBar(
    //     backgroundColor: CustomColor.WhiteColor,
    //     // Set the background color of the AppBar
    //     elevation: 0,
    //     // Set the elevation to 0 to remove the shadow
    //     title: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         GestureDetector(
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //           child: Container(
    //             padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(5),
    //               color: CustomColor.TextFieldColor,
    //             ),
    //             child: Align(
    //               alignment: Alignment.center,
    //               child: Icon(
    //                 Icons.arrow_back_ios,
    //                 size: 12,
    //                 color: Colors.black, // Icon color
    //               ),
    //             ),
    //           ),
    //         ),
    //         Text(
    //           'My Cart',
    //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //         ),
    //         GestureDetector(
    //           onTap: () {
    //             Navigator.pop(context);
    //           },
    //           child: Container(
    //             padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(5),
    //               color: CustomColor.TextFieldColor,
    //             ),
    //             child: Align(
    //               alignment: Alignment.center,
    //               child: Icon(
    //                 Icons.shopping_bag_outlined,
    //                 size: 15,
    //                 color: Colors.black, // Icon color
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   body: ListView(
    //     padding: EdgeInsets.all(16),
    //     children: [
    //
    //       SizedBox(height: 20,),
    //       Center(
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Expanded(
    //               child: Container(
    //                 padding: EdgeInsets.all(5.0),
    //                 decoration: BoxDecoration(
    //
    //                   borderRadius: BorderRadius.circular(10.0),
    //                   color: CustomColor.TextFieldColor,
    //                 ),
    //                 child: Row(
    //                   children: [
    //                     SizedBox(width: 5,),
    //                     Expanded(
    //                       child: TextField(
    //                         onChanged: (value) {
    //                           setState(() {
    //                             promoCode = value;
    //                           });
    //                         },
    //                         decoration: InputDecoration(
    //                             border: InputBorder.none,
    //                             hintText: 'Promo Code',
    //                             hintStyle: TextStyle(color: CustomColor.TextGreyColor)
    //                         ),
    //                       ),
    //                     ),
    //                     ElevatedButton(
    //                       onPressed: () {
    //                         // Implement your apply button functionality here
    //                         // For example, you can validate the promo code and apply a discount.
    //                       },
    //                       style: ElevatedButton.styleFrom(
    //                         shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(10.0),
    //                         ),
    //                         primary: Colors.black,
    //                       ),
    //                       child: Text(
    //                         'Apply',
    //                         style: TextStyle(color: Colors.white),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Container(
    //
    //         margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
    //         child: Column(
    //           children: [
    //             ExtractedRow(title: 'Subtotal',price: '120',),
    //             ExtractedRow(title: 'Shipping Fee',price: '50',),
    //             ExtractedRow(title: 'Total',price: '170',)
    //           ],
    //         ),
    //       ),
    //       ElevatedButton(
    //         onPressed: () {
    //           // Implement your "Proceed to Checkout" button functionality here
    //           // For example, you can navigate to the checkout screen.
    //         },
    //         style: ElevatedButton.styleFrom(
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(10.0),
    //           ),
    //           primary: Colors.black,
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
    //           child: Text(
    //             'Proceed to Checkout',
    //             style: TextStyle(color: Colors.white),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget buildCartField({
    required String leftimageUrl,
    required String name,
    required String price,
    required int initialCount,
    required Function(int) onCountedChanged,
    // required Widget rightWidget,
    bool profilefield = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          // color: CustomColor.TextFieldColor,
          gradient: CustomColor.GradientColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Icon
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CustomColor.BlackColor,
                image: DecorationImage(
                    image: NetworkImage("$leftimageUrl"), fit: BoxFit.cover)),
          ),
          // Middle Text
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style:
                        const TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  if(Provider.of<RememberMeProvider>(context, listen: false)
              .userRoleIndex!='2')
                    Text(
                    price,
                    style: const TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          // Right Icon
          IncrementDecrementBox(
              initialCount: initialCount, onCountedChanged: onCountedChanged)
        ],
      ),
    );
  }

  Widget buildNotiIcon({
    required final onSwitchChanged,
    required final Switchvalue,
  }) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: CustomColor.TextFieldColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
// Left Icon
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColor.BlackColor,
            ),
            child: Icon(
              Icons.notifications,
              size: 20,
              color: Colors.white,
            ),
          ),
// Middle Text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Notifications',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
// Right Icon
          Transform.scale(
            scale: 0.5, // Adjust the value to resize the switch
            child: Switch(
              value: Switchvalue,
              activeTrackColor: CustomColor.BlackColor,
              inactiveTrackColor: CustomColor.WhiteColor,
              inactiveThumbColor: CustomColor.BlackColor,
              onChanged: onSwitchChanged,
            ),
          ),
        ],
      ),
    );
  }
}

///
class IncrementDecrementBox extends StatefulWidget {
  int initialCount;
  Function(int) onCountedChanged;

  IncrementDecrementBox({
    required this.initialCount,
    required this.onCountedChanged,
  });

  @override
  _IncrementDecrementBoxState createState() => _IncrementDecrementBoxState();
}

class _IncrementDecrementBoxState extends State<IncrementDecrementBox> {
  int count = 1;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount;
  }

  void increment() {
    setState(() {
      count++;
      widget.onCountedChanged(count); // Notify the parent of the updated count
    });
    print("countvalue----$count");
  }

  void decrement() {
    setState(() {
      if (count > 1) {
        count--;
        widget
            .onCountedChanged(count); // Notify the parent of the updated count
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: decrement,
            borderRadius: BorderRadius.circular(20),
            child: Icon(
              Icons.remove,
              size: 20,
              color: Colors.black,
            ),
          ),
          Text(
            count.toString(),
            style: TextStyle(
              // fontSize: ,
              color: Colors.black,
            ),
          ),
          InkWell(
            onTap: increment,
            borderRadius: BorderRadius.circular(20),
            child: Icon(
              Icons.add,
              size: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class CartParsing {
  final String count;
  final String id;

  CartParsing({
    required this.count,
    required this.id,
  });
}

///latest
// class ExtractedRow extends StatelessWidget {
//   final title;
//   final price;
//   const ExtractedRow({super.key, this.title, this.price});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Text('$title',style: TextStyle(color: Colors.black,fontSize: 15),),
//             title=='Total'?Text(' (04 item)'):SizedBox(),
//           ],
//         ),
//         SizedBox(
//             width: 70,
//             child: Text("Rs:$price",textAlign: TextAlign.start,
//               maxLines: 1,)),
//       ],
//     );
//   }
// }

///change
