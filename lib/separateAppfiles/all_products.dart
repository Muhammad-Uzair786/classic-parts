// import 'package:com.classic.classicparts/Providers/api_provider.dart';
// import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
// import 'package:com.classic.classicparts/separateAppfiles/ApiModels/all_product_model.dart';
// import 'package:com.classic.classicparts/separateAppfiles/product_detail_Screen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../constants.dart';
//
// class ProductListingScreen extends StatefulWidget {
//   @override
//   _ProductListingScreenState createState() => _ProductListingScreenState();
// }
//
// class _ProductListingScreenState extends State<ProductListingScreen> {
//   List<int> favoriteProducts = [];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColor.WhiteColor,
//       appBar: AppBar(
//         backgroundColor: CustomColor.WhiteColor,
//         automaticallyImplyLeading: false,
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
//                     borderRadius: BorderRadius.circular(5),
//                     gradient: CustomColor.GradientColor),
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
//               'All Products',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox()
//           ],
//         ),
//       ),
//
//       body: FutureBuilder<AllProductModel>(
//         future: Provider.of<ApiProvider>(context, listen: false).fetchProducts(
//             context),
//         builder: (context, AsyncSnapshot<AllProductModel> snapshot)
//         {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }else {
//             final products = snapshot.data?.products;
//             return products![0].productThumbnail==''?Center(child: Text("Products Not Fetched")):GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // Number of columns in the grid
//                 crossAxisSpacing: 5.0, // Spacing between columns
//                 mainAxisSpacing: 10.0,
//                 childAspectRatio: .8// Spacing between rows
//               ),
//               itemCount: products?.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final product = products?[index];
//                 final isFavorite = favoriteProducts.contains(index); // Check if the product is in favorites
//
//                 // Build and return the widget for each grid item
//                 return Container(
//                   margin: EdgeInsets.only(left: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => ProductDetailBody(product_id: product?.id,)));
//                           print('productid--------${product?.id}');
//                         },
//                         child: Container(
//                           width: MediaQuery
//                               .of(context)
//                               .size
//                               .width * 0.4,
//                           height:150,
//                           // margin: EdgeInsets.only(top: index%2==0?0:30,),
//                           decoration: BoxDecoration(
//                             image: DecorationImage(image: NetworkImage(
//                                 "${product?.thumbnailUrl}"),
//                                 fit: BoxFit.cover),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   print("urlllllll${product?.thumbnailUrl}");
//                                   // Check if the product is already a favorite
//                                   if (isFavorite) {
//                                     // Remove the product from the list of favorites
//                                     setState(() {
//                                       favoriteProducts.remove(index);
//                                     });
//                                   } else {
//                                     // Add the product to the list of favorites
//                                     setState(() {
//                                       favoriteProducts.add(index);
//                                       Provider.of<ApiProvider>(context,listen: false).Addtowishlist(context,Provider.of<RememberMeProvider>(context,listen: false).uid,product?.id);
//                                       print("uid------${Provider.of<RememberMeProvider>(context,listen: false).uid}");
//                                     });
//                                   }
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: CircleAvatar(
//                                       radius: 12,
//                                       backgroundColor: Colors.grey[300],
//                                       child: Icon(
//                                         isFavorite?Icons.favorite:Icons.favorite_outline, size: 15,
//                                         color: isFavorite?CustomColor.BlueColor:CustomColor.WhiteColor,)),
//                                 ),
//                               ),
//                               SizedBox(height: 8),
//
//                             ],
//                           ),
//                         ),
//                       ),
//                       Text("${product?.productName}"),
//                       Text("${product?.productPrice}"),
//
//                     ],
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//


///changing
import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
import 'package:com.classic.classicparts/Providers/methods_provider.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/all_product_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/product_detail_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductListingScreen extends StatefulWidget {
  @override
  _ProductListingScreenState createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {


  @override
  Widget build(BuildContext context) {
    final remembermeprovider = Provider.of<RememberMeProvider>(context, listen: false);
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
                    gradient: CustomColor.GradientColor),
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
              '${tr?.all_products}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
            ),
            SizedBox()
          ],
        ),
      ),

      body: FutureBuilder<AllProductModel>(
        future: Provider.of<ApiProvider>(context, listen: false).fetchProducts(
            context),
        builder: (context, AsyncSnapshot<AllProductModel> snapshot)
        {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("asset/applogo.png")));
          }else {
            final products = snapshot.data?.products;
            return products![0].productThumbnail==''?Center(child: Text("Products Not Fetched")):GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                  crossAxisSpacing: 5.0, // Spacing between columns
                 // mainAxisSpacing: 10.0,
                  childAspectRatio: .8// Spacing between rows
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                //favoriteProducts=Provider.of<MethodsProvider>(context,listen: false).getfavouritesid();
                final isFavorite = Provider.of<MethodsProvider>(context,listen: true).favoriteProducts.contains(product.id); // Check if the product is in favorites
                print('isfav$isFavorite');

                // Build and return the widget for each grid item
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductDetailBody(product_id: product.id,)));
                          print('productid--------${product.id}');
                        },
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.4,
                          height:150,
                          // margin: EdgeInsets.only(top: index%2==0?0:30,),
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage(
                                "${product.thumbnailUrl}"),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Consumer<MethodsProvider>(
                                builder: (context, methodsProvider, child) {

                                  return GestureDetector(
                                    onTap: () async {
                                      // print("urlllllll${product?.thumbnailUrl}");
                                      // Check if the product is already a favorite

                                      await Provider.of<MethodsProvider>(context,listen: false).togglefav(product.id,context);
                                      methodsProvider.favoriteProducts.clear();
                                      methodsProvider.favoriteProducts= await Provider.of<MethodsProvider>(context,listen: false).getfavouritesid();
                                     // print('fav$favoriteProducts');
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 12,
                                        backgroundColor: Colors.grey[300],
                                        child: Icon(
                                          isFavorite ? Icons.favorite : Icons.favorite_outline,
                                          size: 15,
                                          color: isFavorite ? CustomColor.BlueColor : CustomColor.WhiteColor,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),


                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      SizedBox(
                          width:  MediaQuery
                          .of(context)
                    .size
                    .width * 0.4,
                          child: Text("${product.productName}",style: TextStyle(color: CustomColor.BlackColor),maxLines: 2,overflow: TextOverflow.ellipsis,)),
                      if(remembermeprovider.userRoleIndex!='2')
                        Text("Rs:${product.productPrice}",style: TextStyle(color: CustomColor.BlackColor),),

                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

