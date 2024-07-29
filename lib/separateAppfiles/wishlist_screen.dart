// import 'package:com.classic.classicparts/separateAppfiles/product_detail_Screen.dart';
// import 'package:flutter/material.dart';
//
// import '../constants.dart';
//
// class WishListScreen extends StatefulWidget {
//   final profilefield;
//
//   WishListScreen({this.profilefield});
//
//   @override
//   State<WishListScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<WishListScreen> {
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
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomCenter,
//                     colors: [Color(0xff2e286e), Color(0xff2799d5)], // Replace with your desired colors
//                   ),                ),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Icon(
//                     Icons.arrow_back_ios,
//                     size: 12,
//                     color: Colors.white, // Icon color
//                   ),
//                 ),
//               ),
//             ),
//             Text(
//               'WishList',
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
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomCenter,
//                     colors: [Color(0xff2e286e), Color(0xff2799d5)], // Replace with your desired colors
//                   ),                ),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Icon(
//                     Icons.notification_add_outlined,
//                     size: 15,
//                     color: Colors.white, // Icon color
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
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             decoration: BoxDecoration(
//               color: Colors.lightBlue[50],
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.search,color: Colors.grey,),
//                   onPressed: () {
//                     //_onSearchSubmitted(_searchController.text);
//                   },
//                 ),
//
//                 Expanded(
//                   child: TextField(
//                     // controller: _searchController,
//                     // onSubmitted: _onSearchSubmitted,
//                     cursorColor: Colors.lightBlue,
//                     decoration: InputDecoration(
//                       hintText: "Search item...",
//
//                       hintStyle: TextStyle(color: CustomColor.TextGreyColor,fontSize: 15),
//                       border: InputBorder.none,
//
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//           SizedBox(height: 20,),
//           buildCartField(
//               leftimageUrl: 'https://www.classicparts.com/images/24-969.jpg',
//               name: 'RTX Speedo',
//               price: '\$1122'),
//           buildCartField(
//               leftimageUrl: 'https://www.classicparts.com/images/59-617_Front.jpg',
//               name: 'Accessory Hood Bird',
//               price: '\$2245'),
//           buildCartField(
//               leftimageUrl: 'https://www.classicparts.com/images/32-426B.jpg',
//               name: 'Steering Wheel',
//               price: '\$1320'),
//           buildCartField(
//               leftimageUrl: 'https://www.classicparts.com/images/91-415.jpg',
//               name: 'Automatic Cross Shaft',
//               price: '\$1222'),
//
//
//
//
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
//           color: Colors.lightBlue[50],
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
//                     style: TextStyle(fontSize: 15,color: CustomColor.BlackColor),
//                   ),
//                   Text(
//                     '$price',
//                     style: TextStyle(fontSize: 18, color: CustomColor.BlackColor),
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
// }
//
// ///
// class IncrementDecrementBox extends StatefulWidget {
//   @override
//   _IncrementDecrementBoxState createState() => _IncrementDecrementBoxState();
// }
//
// class _IncrementDecrementBoxState extends State<IncrementDecrementBox> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 90,
//       height: 30,
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xff2e286e), Color(0xff2799d5)], // Replace with your desired colors
//           ),
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Center(
//         child: Text(
//           'Add to Cart',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             // fontSize: ,
//             color: CustomColor.WhiteColor,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/wishlist_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/product_detail_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WishListScreen extends StatefulWidget {
  final profilefield;

  WishListScreen({this.profilefield});

  @override
  State<WishListScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<WishListScreen> {
  bool isSwitched = false;
  String promoCode = "";

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,
      appBar: AppBar(
        backgroundColor: CustomColor.WhiteColor,
        automaticallyImplyLeading: false,
        // Set the background color of the AppBar
        elevation: 0,
        // Set the elevation to 0 to remove the shadow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: CustomColor.GradientColor
                ),
                child: Align(
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
              '${tr.wishlist}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
            ),
            ///todomust
            SizedBox()
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            //   child: Container(
            //     padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(5),
            //       gradient: LinearGradient(
            //         begin: Alignment.topLeft,
            //         end: Alignment.bottomCenter,
            //         colors: [
            //           Color(0xff2e286e),
            //           Color(0xff2799d5)
            //         ], // Replace with your desired colors
            //       ),
            //     ),
            //     child: const Align(
            //       alignment: Alignment.center,
            //       child: Icon(
            //         Icons.notification_add_outlined,
            //         size: 15,
            //         color: Colors.white, // Icon color
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: CustomColor.TextFieldColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    //_onSearchSubmitted(_searchController.text);
                  },
                ),
                Expanded(
                  child: TextField(
                    // controller: _searchController,
                    // onSubmitted: _onSearchSubmitted,
                    cursorColor: Colors.lightBlue,
                    decoration: InputDecoration(
                      hintText: "${tr.add_to_cart}...",
                      hintStyle: TextStyle(
                          color: CustomColor.TextGreyColor, fontSize: 15),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*.8,
            child: FutureBuilder<WishlistModel>(
                future:
                    Provider.of<ApiProvider>(context).fetchwishlist(context),
                builder: (BuildContext context,
                    AsyncSnapshot<WishlistModel> snapshot) {
                  if(!snapshot.hasData){
                    print("${snapshot.data}");
                    return Center(child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset("asset/applogo.png")));
                  }
                  if(snapshot.data?.products==null)
                    {
                      return Center(child: Text("${tr.wishlist_is_empty}",style: TextStyle(color: CustomColor.BlackColor),));
                    }
                  return ListView.builder(
                      itemCount: snapshot.data?.products?.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data!.products?[index];
                        if (!snapshot.hasData) {
                          return Center(child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset("asset/applogo.png")));

                        }
                        else {

                          return buildCartField(
                              leftimageUrl: '${product?.thumbnailUrl}',
                              name: '${product?.productName}',
                              price: 'Rs:${product?.productPrice}', productId: '${product?.id}');
                        }
                      });
                }),
          )
        ],
      ),
    );
  }

  Widget buildCartField({
    required String leftimageUrl,
    required String name,
    required String price,
    required String productId,
    // required Widget rightWidget,
    bool profilefield = false,
  }) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailBody(product_id: productId)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            // color: Colors.lightBlue[50],
            gradient:CustomColor.GradientColor,
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
                  image: DecorationImage(image: NetworkImage("$leftimageUrl"),fit: BoxFit.cover)),
            ),
            // Middle Text
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name',
                      style:
                          TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      '$price',
                      style:
                          TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            // Right Icon
            IncrementDecrementBox()
          ],
        ),
      ),
    );
  }
}

///
class IncrementDecrementBox extends StatefulWidget {
  @override
  _IncrementDecrementBoxState createState() => _IncrementDecrementBoxState();
}

class _IncrementDecrementBoxState extends State<IncrementDecrementBox> {
  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return Container(
      width: 90,
      height: 30,
      decoration: BoxDecoration(
        color: CustomColor.WhiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          '${tr.add_to_cart}',
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
               fontSize: 10,
              color: CustomColor.BlackColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
