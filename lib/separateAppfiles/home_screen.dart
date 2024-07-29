// import 'dart:io';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:com.classic.classicparts/Providers/api_provider.dart';
// import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
// import 'package:com.classic.classicparts/Providers/language_provider.dart';
// import 'package:com.classic.classicparts/Providers/methods_provider.dart';
// import 'package:com.classic.classicparts/TransactionsSection/transaction_tabs.dart';
// import 'package:com.classic.classicparts/constants.dart';
// import 'package:com.classic.classicparts/newscreens/apimodel.dart';
// import 'package:com.classic.classicparts/separateAppfiles/ApiModels/all_product_model.dart';
// import 'package:com.classic.classicparts/separateAppfiles/ApiModels/popular_product_model.dart';
// import 'package:com.classic.classicparts/separateAppfiles/Category/price_list.dart';
// import 'package:com.classic.classicparts/separateAppfiles/Category/subcategory_screen.dart';
// import 'package:com.classic.classicparts/separateAppfiles/SettingScreen.dart';
// import 'package:com.classic.classicparts/separateAppfiles/User/profile_screen.dart';
// import 'package:com.classic.classicparts/separateAppfiles/cart_screen.dart';
// import 'package:com.classic.classicparts/separateAppfiles/notification_screen.dart';
// import 'package:com.classic.classicparts/separateAppfiles/product_detail_Screen.dart';
// import 'package:com.classic.classicparts/separateAppfiles/searchscreen.dart';
// import 'package:com.classic.classicparts/separateAppfiles/transaction_history_screen.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:upgrader/upgrader.dart';
//
// import '../Providers/translation_provider.dart';
// import 'ApiModels/category_model.dart';
// import 'Classes/network_utills.dart';
// import 'TransactionScreens/cash_withdraw_screen.dart';
// import 'TransactionScreens/cashtransfer_screen.dart';
// import 'all_products.dart';
//
// class DashboardPage extends StatefulWidget {
//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }
//
// class _DashboardPageState extends State<DashboardPage> {
//
//   bool status = false;
//   ScrollController _scrollController = ScrollController();
//
//   // bool _isCardExpanded = true;
//   bool favclick = false;
//   int? selectedindex;
//   Future<bool>? networkcheck;
//   var tr;
// ///
//   ImageProvider<Object>? backgroundImage;
//
//
//   ///
//   @override
//   void initState() {
//     super.initState();
//
//     _scrollController.addListener(() {
//       Provider.of<MethodsProvider>(context, listen: false).scrollOffset =
//           _scrollController.offset;
//     });
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     ///
//     final remembermeprovider = Provider.of<RememberMeProvider>(context, listen: false);
//     if (remembermeprovider.profileImage.startsWith('http')) {
//       backgroundImage=NetworkImage('${remembermeprovider.profileImage}');
//     }else if(remembermeprovider.profileImage=='null')
//     {
//       backgroundImage=AssetImage("asset/user.png");
//     }
//     else {
//       backgroundImage=
//           FileImage(File(remembermeprovider.profileImage));
//     }
//     ///
//     NetworkUtils.checkAndNavigateIfNetworkUnavailable(context);
//     return Scaffold(
//       backgroundColor: CustomColor.WhiteColor,
//
//       // backgroundColor: Color(0xff343541),
//       appBar: AppBar(
//         backgroundColor: CustomColor.WhiteColor,
//         automaticallyImplyLeading: false,
//         leading: Consumer<MethodsProvider>(
//           builder: (BuildContext context, value, Widget? child) {
//             return GestureDetector(
//               onTap: (){
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => SettingScreen()));              },
//               child: Container(
//                 margin: EdgeInsets.only(left: 10, top: 8, bottom: 8),
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//
//                     image: DecorationImage(
//                         image:value.ImageType()!,
//                         fit: BoxFit.fill)),
//               ),
//             );
//           },
//
//         ),
//         title: Text(
//                 "Hi,${Provider.of<RememberMeProvider>(context, listen: false).userName}",style: TextStyle(color: CustomColor.BlackColor),)
//             .animate()
//             .fadeIn(duration: 600.ms)
//             .then(delay: 300.ms) // baseline=800ms
//             .slideX(),
//         actions: [
//           ///todomust
//           // IconButton(
//           //   icon: Icon(Icons.search,color: CustomColor.BlackColor,),
//           //   onPressed: () {
//           //     // Handle search icon press
//           //     Navigator.of(context).push(
//           //         MaterialPageRoute(builder: (context) => SearchScreen()));
//           //   },
//           // ),
//           IconButton(
//             icon: Icon(Icons.shopping_bag_outlined,color: CustomColor.BlackColor,),
//             onPressed: () {
//               // Handle store icon press
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (context) => CartScreen()));
//             },
//           ),
//
//           ///todomust
//           GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => NotificationScreen()));
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Icon(Icons.notifications_none,color: CustomColor.BlackColor,),
//             ),
//           ),
//         ],
//       ),
//       body: CustomScrollView(
//         controller: _scrollController,
//
//         //  crossAxisAlignment: CrossAxisAlignment.start,
//         slivers: [
//           Consumer<MethodsProvider>(
//             builder: (BuildContext context, expandedprovider, Widget? child) {
//               return SliverPadding(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 sliver: SliverAppBar(
//                   automaticallyImplyLeading: false,
//                   toolbarHeight: 100,
//                   expandedHeight:
//                       expandedprovider.isCardExpanded ? 200.0 : 100.0,
//                   pinned: true,
//                   // backgroundColor:Color(0xff343541),
//                   backgroundColor: Colors.white,
//                   elevation: 0,
//                   flexibleSpace: FlexibleSpaceBar(
//                       background: expandedprovider.isCardExpanded
//                           ? CashWalletCard(
//                               scrollOffset: expandedprovider.scrollOffset,
//                             )
//                           : SmallCashWalletCard()),
//                 ),
//               );
//             },
//           ),
//           SliverPadding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             sliver: SliverList(
//                 delegate: SliverChildListDelegate([
//               SizedBox(
//                 height: 10,
//               ),
//               BannerCarousel(status: '0'),
//               SizedBox(
//                 height: 10,
//               ),
//               Text("${AppLocalizations.of(context)?.categories}",
//                   style: CustomColor.StyleBlackbold.copyWith(fontSize: 18)),
//               SizedBox(height: 16),
//               Container(
//                 height: 120,
//                 child: FutureBuilder<CategoryModel>(
//                   future: Provider.of<ApiProvider>(context, listen: false)
//                       .fetchCategory(context),
//                   builder: (BuildContext context,
//                       AsyncSnapshot<CategoryModel> snapshot) {
//                     if (!snapshot.hasData) {
//                       return Center(child: CircularProgressIndicator());
//                     }
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(child: CircularProgressIndicator());
//                     } else {
//                       final categories = snapshot.data?.categories;
//
//                       print(
//                           "categorieslegnth............${categories!.length}");
//                       List urls = [
//                         'asset/three_wheeler.jpg',
//
//                         'asset/spray.jpeg',
//                         'asset/wire_lock.jpeg',
//
//                         'asset/two_wheeler.jpeg'
//                       ];
//                       return ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: categories.length,
//                         itemExtent: 80,
//                         // Replace with the actual number of items
//                         itemBuilder: (context, index) {
//                           // final category = categories?[index];
//
//                           return GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => SubcategoryScreen(
//                                           categories[index].id)));
//                             },
//                             child: Container(
//                               child: Column(
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 30,
//                                     backgroundColor: Colors.pinkAccent[80],
//                                     backgroundImage: AssetImage(
//                                         "${urls[index]}"), // Replace with actual image URLs
//                                   ),
//                                   SizedBox(height: 8),
//                                   Text(
//                                     Provider.of<TranslationProvider>(context,
//                                                     listen: false)
//                                                 .status &&
//                                             index < categories.length
//                                         ? "${Provider.of<TranslationProvider>(context, listen: false).Translatecategorynamesreturn[index]['translations'][0]['text']}"
//                                         : "${categories[index].name}",
//                                     textAlign: TextAlign.center,
//                                     style: TextStyle(color: CustomColor.BlackColor),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           );
//                         },
//                       );
//                     }
//                   },
//                 ),
//               ),
//               BannerCarousel(
//                 status: '1',
//               ),
//               SizedBox(height: 32),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "${AppLocalizations.of(context)?.mostpopular}",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                       color: CustomColor.BlackColor
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => ProductListingScreen()));
//                     },
//                     child: const Text(
//                       "See All",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//
//               ///
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * .5,
//                 child: FutureBuilder<PopularProductsModel?>(
//                     future: Provider.of<ApiProvider>(context, listen: false)
//                         .fetchPopularProducts(context),
//                     builder:
//                         (context, AsyncSnapshot<PopularProductsModel?> snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return Center(
//                           child: CircularProgressIndicator(),
//                         );
//                       }
//                       if (!snapshot.hasData) {
//                         return Center(child: Text("Products Not found"));
//                       }
//                       return snapshot.data?.products![0].productThumbnail == ''
//                           ? Center(child: Text("Products Not Fetched"))
//                           : GridView.builder(
//                               scrollDirection: Axis.horizontal,
//                               itemCount: snapshot.data?.products?.length,
//                               shrinkWrap: true,
//                               //physics: NeverScrollableScrollPhysics(),
//                               itemBuilder: (BuildContext context, index) {
//                                 final length = snapshot.data?.products?.length;
//                                 final product = snapshot.data?.products![index];
//                                 return Container(
//                                   //margin: EdgeInsets.only(left: 10),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       GestureDetector(
//                                         onTap: () {
//                                           Navigator.of(context).push(
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       ProductDetailBody(
//                                                         product_id: product?.id,
//                                                       )));
//                                         },
//                                         child: Container(
//                                           width: MediaQuery.of(context)
//                                                   .size
//                                                   .width *
//                                               0.4,
//                                           height: MediaQuery.of(context)
//                                                   .size
//                                                   .height *
//                                               0.2,
//                                           // margin: EdgeInsets.only(top: index % 2 == 0 ? 0 : 30),
//                                           decoration: BoxDecoration(
//                                             image: DecorationImage(
//                                                 image: NetworkImage(
//                                                     "${snapshot.data?.products![index].thumbnailUrl}"),
//                                                 fit: BoxFit.fill),
//                                             borderRadius:
//                                                 BorderRadius.circular(12),
//                                           ),
//                                           child: const Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.end,
//                                             children: [
//                                               ///todomust
//                                               // GestureDetector(
//                                               //   onTap: () {
//                                               //     setState(() {
//                                               //       selectedindex = index;
//                                               //     });
//                                               //   },
//                                               //   child: Padding(
//                                               //     padding: const EdgeInsets.all(8.0),
//                                               //     child: CircleAvatar(
//                                               //         radius: 12,
//                                               //         backgroundColor: Colors
//                                               //             .grey[300],
//                                               //         child: Icon(
//                                               //             selectedindex == index
//                                               //                 ? Icons.favorite
//                                               //                 : Icons.favorite_border,
//                                               //             size: 15,
//                                               //             color: selectedindex ==
//                                               //                 index ? CustomColor
//                                               //                 .BlueColor : Colors
//                                               //                 .white)),
//                                               //   ),
//                                               // ),
//                                               SizedBox(height: 10),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(height: 5,),
//                                       GestureDetector(
//                                           onTap: () {},
//                                           child: Text(Provider.of<
//                                                               TranslationProvider>(
//                                                           context,
//                                                           listen: false)
//                                                       .status &&
//                                                   (index +
//                                                           Provider.of<TranslationProvider>(
//                                                                   context,
//                                                                   listen: false)
//                                                               .homePageCount) <
//                                                       (length! +
//                                                           Provider.of<TranslationProvider>(
//                                                                   context,
//                                                                   listen: false)
//                                                               .homePageCount)
//                                               ? "${Provider.of<TranslationProvider>(context, listen: false).Translatecategorynamesreturn[index + Provider.of<TranslationProvider>(context, listen: false).homePageCount]['translations'][0]['text']}"
//                                               : "${product?.productName}",style: TextStyle(color: CustomColor.BlackColor),)),
//
//                                       if(remembermeprovider.userRoleIndex!='2')
//                                         Text("Rs:${product?.productPrice}",style: TextStyle(color: CustomColor.BlackColor),),
//                                     ],
//                                   ),
//                                 );
//                               },
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                       crossAxisCount: 1,
//                                       childAspectRatio: 2.5,
//                                       mainAxisSpacing: 10),
//                             );
//                     }
//                     // Wrap(
//                     //   spacing: 12,
//                     //   runSpacing: 8,
//                     //   children: List.generate(6, (index) {
//                     //     return Container(
//                     //       margin: EdgeInsets.only(left: 10),
//                     //       child: Column(
//                     //         crossAxisAlignment: CrossAxisAlignment.start,
//                     //         children: [
//                     //           GestureDetector(
//                     //             onTap: () {
//                     //               Navigator.of(context).push(MaterialPageRoute(
//                     //                   builder: (context) => ProductDetailBody()));
//                     //             },
//                     //             child: Container(
//                     //               width: MediaQuery.of(context).size.width * 0.4,
//                     //               height: MediaQuery.of(context).size.height * 0.3,
//                     //               margin:
//                     //                   EdgeInsets.only(top: index % 2 == 0 ? 0 : 30),
//                     //               decoration: BoxDecoration(
//                     //                 image: DecorationImage(
//                     //                     image: AssetImage("asset/cover.jpg"),
//                     //                     fit: BoxFit.cover),
//                     //                 borderRadius: BorderRadius.circular(12),
//                     //               ),
//                     //               child: Column(
//                     //                 crossAxisAlignment: CrossAxisAlignment.end,
//                     //                 children: [
//                     //
//                     //                   GestureDetector(
//                     //                     onTap:(){
//                     //                       favclick=true;
//                     //                     },
//                     //                     child: Padding(
//                     //                       padding: const EdgeInsets.all(8.0),
//                     //                       child: CircleAvatar(
//                     //                           radius: 12,
//                     //                           backgroundColor: Colors.grey[300],
//                     //                           child: Icon(
//                     //                             favclick?Icons.favorite_outline:Icons.favorite,
//                     //                             size: 15,
//                     //                             color: favclick?CustomColor.WhiteColor:CustomColor.BlueColor,
//                     //                           )),
//                     //                     ),
//                     //                   ),
//                     //                   SizedBox(height: 8),
//                     //                 ],
//                     //               ),
//                     //             ),
//                     //           ),
//                     //           Text("Item Name"),
//                     //           Text("\$35.00"),
//                     //         ],
//                     //       ),
//                     //     );
//                     //   }),
//                     // ),
//                     ),
//               )
//             ])),
//           ),
//         ],
//       ),
//       ///todomust
//       floatingActionButton: FloatingActionButton.extended(
//         heroTag: "1",
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => PriceList()));
//         },
//         label: const Text(
//           "Product List",
//         ),
//         icon: Icon(
//           Icons.price_change,
//           color: CustomColor.BlueColor,
//         ),
//         backgroundColor: Colors.white,
//         elevation: 10,
//       ),
//     );
//   }
// }
//
// ///
//
// class CashWalletCard extends StatelessWidget {
//
//   final scrollOffset;
//   final double walletAmount = 500.0;
//   final double activeBalance = 150.0;
//
//   CashWalletCard({this.scrollOffset});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       color: CustomColor.DarkBlueColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Container(
//         width: 320,
//        // padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           gradient: CustomColor.GradientColor,
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//
//           children: [
//             // GestureDetector(
//             //   onTap: () {
//             //     Navigator.of(context).push(MaterialPageRoute(
//             //         builder: (context) => TransactionTabsScreen()));
//             //   },
//             //   child: Align(
//             //     alignment: Alignment.topRight,
//             //     child: Card(
//             //       elevation: 4,
//             //       color: CustomColor.WhiteColor,
//             //       shape: RoundedRectangleBorder(
//             //         borderRadius: BorderRadius.circular(10),
//             //       ),
//             //       child: Container(
//             //         decoration: BoxDecoration(
//             //           borderRadius: BorderRadius.circular(10),
//             //           color: CustomColor.WhiteColor,
//             //         ),
//             //         padding: EdgeInsets.all(5),
//             //         child: Column(
//             //           mainAxisAlignment: MainAxisAlignment.center,
//             //           children: [
//             //             Icon(Icons.receipt, color: CustomColor.BlackColor),
//             //             SizedBox(height: 3),
//             //             Text(
//             //               "History",
//             //               style: TextStyle(color: CustomColor.BlackColor,fontSize: 10),
//             //             ),
//             //           ],
//             //         ),
//             //       ),
//             //     )
//             //   ),
//             // ),
//             Consumer<LanguageProvider>(builder: (context, provider, child) {
//               return GestureDetector(
//                   onTap: () {
//
//                   },
//                   child: Text(
//                     'Cash Wallet',
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   ));
//             }),
//             SizedBox(height: 10),
//             Consumer<RememberMeProvider>(
//               builder: (BuildContext context, value, Widget? child) {
//                 return Text(
//                   'Rs ${value.userCredit=='null'?'0':value.userCredit}',
//                   style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 );
//               },
//
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Transform.translate(
//                   offset: Offset(
//                     scrollOffset,
//                     -scrollOffset / 1.5,
//                   ),
//                   child: GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => CashTransactionScreen()));
//                       },
//                       child: SmallCard(
//                           icon: Icons.send,
//                           text: '${AppLocalizations.of(context)?.send}')),
//                 ),
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => CashWithdrawScreen()));
//                     },
//                     child: SmallCard(
//                         icon: Icons.credit_card,
//                         text: 'Withdraw')),
//                 GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) => TransactionTabsScreen()));
//                     },
//                     child: SmallCard(
//                         icon: Icons.receipt,
//                         text: 'History')),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class SmallCard extends StatelessWidget {
//   final IconData icon;
//   final String text;
//
//   SmallCard({required this.icon, required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       color: CustomColor.WhiteColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: CustomColor.WhiteColor,
//         ),
//         padding: EdgeInsets.all(8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, color: CustomColor.BlackColor,size: 16,),
//             SizedBox(width: 5),
//             Text(
//               text,
//               style: TextStyle(color: CustomColor.BlackColor),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// ///smallcashwallet
// class SmallCashWalletCard extends StatelessWidget {
//   final double walletAmount = 500.0;
//   final double activeBalance = 150.0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4,
//       color: CustomColor.DarkBlueColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Container(
//         width: 320,
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           gradient: CustomColor.GradientColor,
//           shape: BoxShape.rectangle,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               // mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Cash Wallet',
//                   style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//                 SizedBox(height: 5),
//                 Consumer<RememberMeProvider>(
//                   builder: (BuildContext context, value, Widget? child) {
//                     return Text(
//                       'Rs ${value.userCredit== 'null'?'0':value.userCredit}',
//                       style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white),
//                     );
//                   },
//                 ),
//               ],
//             ),
//
//             ///
//             GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pushReplacement(MaterialPageRoute(
//                     builder: (context) => CashTransactionScreen()));
//               },
//               child: SmallCard(
//                 icon: Icons.send,
//                 text: '${AppLocalizations.of(context)?.send}',
//               ),
//
//               //
//               // TweenAnimationBuilder(
//               //   tween: Tween<double>(begin: 0, end: 1),
//               //   duration: Duration(milliseconds: 500),
//               //   builder: (context, double value, child) {
//               //     return Transform.translate(
//               //       offset: Offset(
//               //         (1 - value) * MediaQuery.of(context).size.width,
//               //         (1 - value) * MediaQuery.of(context).size.height,
//               //       ),
//               //       child: SmallCard(
//               //         icon: Icons.send,
//               //         text: '${AppLocalizations.of(context)?.send}',
//               //       ),
//               //     );
//               //   },
//               // ),
//             ),
//
//             ///
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// /// carosel
// class BannerCarousel extends StatefulWidget {
//   String status;
//
//   BannerCarousel({super.key, required this.status});
//
//   @override
//   State<BannerCarousel> createState() => _BannerCarouselState();
// }
//
// class _BannerCarouselState extends State<BannerCarousel> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: Provider.of<ApiProvider>(context).fetchbanner(
//           context,
//         ),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(
//                 child: Container(
//               height: 150,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   color: Colors.grey.shade200),
//             ));
//           } else if (!snapshot.hasData) {
//             return SizedBox();
//           }
//           //   int? bannerslength=snapshot.data?.banners?.length;
//
//           final bannerList = snapshot.data?.banners
//               ?.where((element) => element.status == '0')
//               .toList();
//           print("ban${bannerList?.length}");
//           var promotionaladsList = snapshot.data?.banners
//               ?.where((element) => element.status == '1')
//               .toList();
//           print("pro${promotionaladsList}");
//
//           if (widget.status == '0' && bannerList?.length != 0) {
//             return CarouselSlider.builder(
//               itemCount: bannerList?.length,
//               options: CarouselOptions(
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//                 viewportFraction: 1.0,
//                 aspectRatio: 2.6,
//                 initialPage: 0,
//               ),
//               itemBuilder: (BuildContext context, int index, int realIndex) {
//                 return Container(
//                   margin: EdgeInsets.symmetric(horizontal: 5.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     image: DecorationImage(
//                       image: NetworkImage('${bannerList?[index].imagePath}'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else if (widget.status == '1' && promotionaladsList?.length != 0) {
//             return CarouselSlider.builder(
//               itemCount: promotionaladsList?.length,
//               options: CarouselOptions(
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//                 viewportFraction: 1.0,
//                 aspectRatio: 2.6,
//                 initialPage: 0,
//               ),
//               itemBuilder: (BuildContext context, int index, int realIndex) {
//                 return Container(
//                   height: 150,
//                   margin: EdgeInsets.symmetric(horizontal: 5.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10.0),
//                     image: DecorationImage(
//                       image: NetworkImage(
//                           '${promotionaladsList?[index].imagePath}'),
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//           return SizedBox();
//         });
//   }
// }
//
//
//
//


import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
import 'package:com.classic.classicparts/Providers/language_provider.dart';
import 'package:com.classic.classicparts/Providers/methods_provider.dart';
import 'package:com.classic.classicparts/TransactionsSection/transaction_tabs.dart';
import 'package:com.classic.classicparts/constants.dart';
import 'package:com.classic.classicparts/newscreens/apimodel.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/all_product_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/popular_product_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/Category/price_list.dart';
import 'package:com.classic.classicparts/separateAppfiles/Category/subcategory_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/SettingScreen.dart';
import 'package:com.classic.classicparts/separateAppfiles/User/profile_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/cart_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/notification_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/product_detail_Screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/searchscreen.dart';
import 'package:com.classic.classicparts/separateAppfiles/transaction_history_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';

import '../Providers/translation_provider.dart';
import 'ApiModels/category_model.dart';
import 'Classes/network_utills.dart';
import 'TransactionScreens/cash_withdraw_screen.dart';
import 'TransactionScreens/cashtransfer_screen.dart';
import 'all_products.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool status = false;
  ScrollController _scrollController = ScrollController();

  // bool _isCardExpanded = true;
  bool favclick = false;
  //int? selectedindex;
  Future<bool>? networkcheck;
  //var tr;
  ///
  ImageProvider<Object>? backgroundImage;


  ///
  bool selectedIndex=false;
  // double scrollOffset=10;
  // double scrollOffset2=0;
  // double newPosition=10;
  // double reversedValue=200;
  // double reversedValuePadding=100;
  @override
  void initState() {
    super.initState();

    // Listen to scroll events
    _scrollController.addListener(() {
      // Access the current scroll position


        Provider.of<MethodsProvider>(context, listen: false).scrollOffset = //_scrollController.offset;
        _scrollController.offset.clamp(8, 110.0);
        Provider.of<MethodsProvider>(context, listen: false).scrollOffset2 = //_scrollController.offset;
        _scrollController.offset.clamp(10.0, 100.0);

      // Your logic to determine position based on scrolling
        //Provider.of<MethodsProvider>(context, listen: false). newPosition = calculateNewPosition( Provider.of<MethodsProvider>(context, listen: false).scrollOffset);

      // Print the current scroll offset and the calculated position
     // print("Scroll Offset: ${ Provider.of<MethodsProvider>(context, listen: false).scrollOffset}, New Position: $newPosition");
      // Calculate reversed value from 200 to 100
       // Provider.of<MethodsProvider>(context, listen: false).reversedValue = 200.0 -  Provider.of<MethodsProvider>(context, listen: false).scrollOffset;
       // Provider.of<MethodsProvider>(context, listen: false).reversedValuePadding = 100.0 -  Provider.of<MethodsProvider>(context, listen: false).scrollOffset2;
      // reversedValuePadding = reversedValuePadding.clamp(90, 200.0);

      // Ensure the reversed value is within the desired range
     //   Provider.of<MethodsProvider>(context, listen: false).reversedValue =  Provider.of<MethodsProvider>(context, listen: false).reversedValue.clamp(100.0, 200.0);

     // print('Reversed Value: $reversedValue');
    });
  }

  // double calculateNewPosition(double scrollOffset) {
  //   // Your logic to determine the new position based on scrolling
  //   // Replace this with your own calculations
  //   return scrollOffset*2; // Adjust as needed
  // }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr= AppLocalizations.of(context);

    ///
    final remembermeprovider = Provider.of<RememberMeProvider>(context, listen: false);
    if (remembermeprovider.profileImage.startsWith('http')) {
      backgroundImage=NetworkImage('${remembermeprovider.profileImage}');
    }else if(remembermeprovider.profileImage=='null')
    {
      backgroundImage=AssetImage("asset/user.png");
    }
    else {
      backgroundImage=
          FileImage(File(remembermeprovider.profileImage));
    }
    ///
    NetworkUtils.checkAndNavigateIfNetworkUnavailable(context);
    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,

      // backgroundColor: Color(0xff343541),
      appBar: AppBar(
        backgroundColor: CustomColor.WhiteColor,
        automaticallyImplyLeading: false,
        leading: Consumer<MethodsProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SettingScreen()));              },
              child: Container(
                margin: EdgeInsets.only(left: 10, top: 8, bottom: 8),
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),

                    image: DecorationImage(
                        image:value.ImageType()!,
                        fit: BoxFit.fill)),
              ),
            );
          },

        ),
        title: Text(
          "Hi,${Provider.of<RememberMeProvider>(context, listen: false).userName}",style: TextStyle(color: CustomColor.BlackColor),)
            .animate()
            .fadeIn(duration: 600.ms)
            .then(delay: 300.ms) // baseline=800ms
            .slideX(),
        actions: [
          ///todomust
          // IconButton(
          //   icon: Icon(Icons.search,color: CustomColor.BlackColor,),
          //   onPressed: () {
          //     // Handle search icon press
          //     Navigator.of(context).push(
          //         MaterialPageRoute(builder: (context) => SearchScreen()));
          //   },
          // ),
          IconButton(
            icon: Icon(Icons.shopping_bag_outlined,color: CustomColor.BlackColor,),
            onPressed: () {
              // Handle store icon press
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CartScreen()));
            },
          ),

          ///todomust
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NotificationScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.notifications_none,color: CustomColor.BlackColor,),
            ),
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
             children: [
            Consumer<MethodsProvider>(
                builder: (BuildContext context, methodProvider, Widget? child) {
                  return CashWalletCard(reversedValue:  methodProvider.reversedValue,reversedValuePadding:  methodProvider.reversedValuePadding,newPosition:  methodProvider.newPosition,scrollOffset:  methodProvider.scrollOffset,);

                },
            ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  BannerCarousel(status: '0'),
                  SizedBox(
                    height: 10,
                  ),
                  Text("${AppLocalizations.of(context)?.categories}",
                      style: CustomColor.StyleBlackbold.copyWith(fontSize: 18)),
                  SizedBox(height: 16),
                  Container(
                    height: 120,
                    child: FutureBuilder<CategoryModel>(
                      future: Provider.of<ApiProvider>(context, listen: false)
                          .fetchCategory(context),
                      builder: (BuildContext context,
                          AsyncSnapshot<CategoryModel> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          final categories = snapshot.data?.categories;

                          print(
                              "categorieslegnth............${categories!.length}");

                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemExtent: 80,
                            // Replace with the actual number of items
                            itemBuilder: (context, index) {
                              // final category = categories?[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SubcategoryScreen(
                                              categories[index].id)));
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.pinkAccent[80],
                                        backgroundImage:NetworkImage("${categories[index].image}")
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        Provider.of<TranslationProvider>(context,
                                            listen: false)
                                            .status &&
                                            index < categories.length
                                            ? "${Provider.of<TranslationProvider>(context, listen: false).Translatecategorynamesreturn[index]['translations'][0]['text']}"
                                            : "${categories[index].name}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: CustomColor.BlackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                  BannerCarousel(
                    status: '1',
                  ),
                  SizedBox(height: 32),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)?.mostpopular}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: CustomColor.BlackColor
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProductListingScreen()));
                        },
                        child:  Text(
                          tr.see_all,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  ///
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .5,
                    child: FutureBuilder<PopularProductsModel?>(
                        future: Provider.of<ApiProvider>(context, listen: false)
                            .fetchPopularProducts(context),
                        builder:
                            (context, AsyncSnapshot<PopularProductsModel?> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (!snapshot.hasData) {
                            return Center(child: Text("Products Not found"));
                          }
                          return snapshot.data?.products![0].productThumbnail == ''
                              ? Center(child: Text("Products Not Fetched"))
                              : GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data?.products?.length,
                            shrinkWrap: true,
                            //physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, index) {
                              final length = snapshot.data?.products?.length;
                              final product = snapshot.data?.products![index];
                              return Container(
                                //margin: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetailBody(
                                                      product_id: product?.id,
                                                    )));
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context)
                                            .size
                                            .width *
                                            0.4,
                                        height: MediaQuery.of(context)
                                            .size
                                            .height *
                                            0.2,
                                        // margin: EdgeInsets.only(top: index % 2 == 0 ? 0 : 30),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${snapshot.data?.products![index].thumbnailUrl}"),
                                              fit: BoxFit.fill),
                                          borderRadius:
                                          BorderRadius.circular(12),
                                        ),
                                        child: const Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            ///todomust
                                            // GestureDetector(
                                            //   onTap: () {
                                            //     setState(() {
                                            //       selectedindex = index;
                                            //     });
                                            //   },
                                            //   child: Padding(
                                            //     padding: const EdgeInsets.all(8.0),
                                            //     child: CircleAvatar(
                                            //         radius: 12,
                                            //         backgroundColor: Colors
                                            //             .grey[300],
                                            //         child: Icon(
                                            //             selectedindex == index
                                            //                 ? Icons.favorite
                                            //                 : Icons.favorite_border,
                                            //             size: 15,
                                            //             color: selectedindex ==
                                            //                 index ? CustomColor
                                            //                 .BlueColor : Colors
                                            //                 .white)),
                                            //   ),
                                            // ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    GestureDetector(
                                        onTap: () {},
                                        child: Text(Provider.of<
                                            TranslationProvider>(
                                            context,
                                            listen: false)
                                            .status &&
                                            (index +
                                                Provider.of<TranslationProvider>(
                                                    context,
                                                    listen: false)
                                                    .homePageCount) <
                                                (length! +
                                                    Provider.of<TranslationProvider>(
                                                        context,
                                                        listen: false)
                                                        .homePageCount)
                                            ? "${Provider.of<TranslationProvider>(context, listen: false).Translatecategorynamesreturn[index + Provider.of<TranslationProvider>(context, listen: false).homePageCount]['translations'][0]['text']}"
                                            : "${product?.productName}",style: TextStyle(color: CustomColor.BlackColor),)),

                                    if(remembermeprovider.userRoleIndex!='2')
                                      Text("Rs:${product?.productPrice}",style: TextStyle(color: CustomColor.BlackColor),),
                                  ],
                                ),
                              );
                            },
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 2.5,
                                mainAxisSpacing: 10),
                          );
                        }
                      // Wrap(
                      //   spacing: 12,
                      //   runSpacing: 8,
                      //   children: List.generate(6, (index) {
                      //     return Container(
                      //       margin: EdgeInsets.only(left: 10),
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           GestureDetector(
                      //             onTap: () {
                      //               Navigator.of(context).push(MaterialPageRoute(
                      //                   builder: (context) => ProductDetailBody()));
                      //             },
                      //             child: Container(
                      //               width: MediaQuery.of(context).size.width * 0.4,
                      //               height: MediaQuery.of(context).size.height * 0.3,
                      //               margin:
                      //                   EdgeInsets.only(top: index % 2 == 0 ? 0 : 30),
                      //               decoration: BoxDecoration(
                      //                 image: DecorationImage(
                      //                     image: AssetImage("asset/cover.jpg"),
                      //                     fit: BoxFit.cover),
                      //                 borderRadius: BorderRadius.circular(12),
                      //               ),
                      //               child: Column(
                      //                 crossAxisAlignment: CrossAxisAlignment.end,
                      //                 children: [
                      //
                      //                   GestureDetector(
                      //                     onTap:(){
                      //                       favclick=true;
                      //                     },
                      //                     child: Padding(
                      //                       padding: const EdgeInsets.all(8.0),
                      //                       child: CircleAvatar(
                      //                           radius: 12,
                      //                           backgroundColor: Colors.grey[300],
                      //                           child: Icon(
                      //                             favclick?Icons.favorite_outline:Icons.favorite,
                      //                             size: 15,
                      //                             color: favclick?CustomColor.WhiteColor:CustomColor.BlueColor,
                      //                           )),
                      //                     ),
                      //                   ),
                      //                   SizedBox(height: 8),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //           Text("Item Name"),
                      //           Text("\$35.00"),
                      //         ],
                      //       ),
                      //     );
                      //   }),
                      // ),
                    ),
                  )
                ],
              ),
            ),
          )
          ]),
      ),

      ///todomust
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "1",
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PriceList()));
        },
        label: Text(
          "${AppLocalizations.of(context)?.product_list}",
        ),
        icon: Icon(
          Icons.price_change,
          color: CustomColor.BlueColor,
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
    );
  }
}

///

class CashWalletCard extends StatelessWidget {

  final scrollOffset;
  final reversedValue;
  final reversedValuePadding;
  final newPosition;
  final double walletAmount = 500.0;
  final double activeBalance = 150.0;

  CashWalletCard({this.reversedValue, this.reversedValuePadding, this.newPosition, this.scrollOffset,});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      // curve: Curves.easeInOut,
      padding: const EdgeInsets.only(top: 5),
      //margin: const EdgeInsets.all(10),
      height: reversedValue,
      //width: 320, // Enlarge selected container
      width: 325, // Enlarge selected container
      decoration: BoxDecoration(
        //color: selectedIndex == index ? Colors.white : Colors.grey,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15),
          topLeft: Radius.circular(10),topRight: Radius.circular(10),

        ),
      ),
      child: Card(
        elevation: 4,
        color: CustomColor.DarkBlueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
         // height: 180,
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: CustomColor.GradientColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(

            children: [
              // GestureDetector(
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //         builder: (context) => TransactionTabsScreen()));
              //   },
              //   child: Align(
              //     alignment: Alignment.topRight,
              //     child: Card(
              //       elevation: 4,
              //       color: CustomColor.WhiteColor,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: CustomColor.WhiteColor,
              //         ),
              //         padding: EdgeInsets.all(5),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Icon(Icons.receipt, color: CustomColor.BlackColor),
              //             SizedBox(height: 3),
              //             Text(
              //               "History",
              //               style: TextStyle(color: CustomColor.BlackColor,fontSize: 10),
              //             ),
              //           ],
              //         ),
              //       ),
              //     )
              //   ),
              // ),
              Positioned(
                left: reversedValuePadding,
                top: reversedValue*.15,
                child: Consumer<LanguageProvider>(builder: (context, provider, child) {
                  return GestureDetector(
                      onTap: () {

                      },
                      child: Text(
                        '${AppLocalizations.of(context)?.cash_wallet}',
                        style: TextStyle(
                            fontSize: reversedValue*.1,//20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ));
                }),
              ),
              Positioned(
                left: reversedValuePadding,
                top: reversedValue*.3,
                child: Consumer<RememberMeProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Text(
                      'Rs ${value.userCredit=='null'?'0':value.userCredit}',
                      style: TextStyle(
                          fontSize: reversedValue*.1,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    );
                  },

                ),
              ),
              //SizedBox(height: 20),
              if(scrollOffset<80)
                Positioned(
                bottom: 10,
                right: scrollOffset,
                child: Row(
                  children: [
                  //  SizedBox(width: 10,),

                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CashWithdrawScreen()));
                        },
                        child: SmallCard(
                            icon: Icons.credit_card,
                            text: '${AppLocalizations.of(context)?.withdraw}',
                        scrollOffset: scrollOffset,                        )),

                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TransactionTabsScreen()));
                        },
                        child: SmallCard(
                            icon: Icons.receipt,
                            text: '${AppLocalizations.of(context)?.history}',
                        scrollOffset: scrollOffset,
                        )),
                    //SizedBox(width: 5,),

                  ],
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                left: newPosition*.95,
                bottom:scrollOffset>=100?15:10,// scrollOffset,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CashTransactionScreen()));
                    },
                    child: SmallCard(
                        icon: Icons.send,
                        text: '${AppLocalizations.of(context)?.send} ',
                    scrollOffset: scrollOffset,)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final scrollOffset;

  SmallCard({required this.icon, required this.text, this.scrollOffset});

  @override
  Widget build(BuildContext context) {
    print("object$text");
    print("object${text}");
    return Card(
      elevation: 0,
      color: text.trim()=="Send"?(CustomColor.WhiteColor):(scrollOffset<30?CustomColor.WhiteColor:scrollOffset<45?CustomColor.WhiteColor.withOpacity(.6):scrollOffset<80?CustomColor.WhiteColor.withOpacity(.2):Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
       width: 90,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: text.trim()=="Send"?(CustomColor.WhiteColor):(scrollOffset<30?CustomColor.WhiteColor:scrollOffset<45?CustomColor.WhiteColor.withOpacity(.6):scrollOffset<80?CustomColor.WhiteColor.withOpacity(.2):Colors.white),
        ),
        padding: EdgeInsets.all(8),
        child: Row(          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: CustomColor.BlackColor,size: 16,),
            SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(color: CustomColor.BlackColor,fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

///smallcashwallet
class SmallCashWalletCard extends StatelessWidget {
  final double walletAmount = 500.0;
  final double activeBalance = 150.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: CustomColor.DarkBlueColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: 320,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: CustomColor.GradientColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cash Wallet',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 5),
                Consumer<RememberMeProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return Text(
                      'Rs ${value.userCredit== 'null'?'0':value.userCredit}',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    );
                  },
                ),
              ],
            ),

            ///
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => CashTransactionScreen()));
              },
              child: SmallCard(
                icon: Icons.send,
                text: '${AppLocalizations.of(context)?.send}',
              ),

              //
              // TweenAnimationBuilder(
              //   tween: Tween<double>(begin: 0, end: 1),
              //   duration: Duration(milliseconds: 500),
              //   builder: (context, double value, child) {
              //     return Transform.translate(
              //       offset: Offset(
              //         (1 - value) * MediaQuery.of(context).size.width,
              //         (1 - value) * MediaQuery.of(context).size.height,
              //       ),
              //       child: SmallCard(
              //         icon: Icons.send,
              //         text: '${AppLocalizations.of(context)?.send}',
              //       ),
              //     );
              //   },
              // ),
            ),

            ///
          ],
        ),
      ),
    );
  }
}

/// carosel
class BannerCarousel extends StatefulWidget {
  String status;

  BannerCarousel({super.key, required this.status});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<ApiProvider>(context).fetchbanner(
          context,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey.shade200),
                ));
          } else if (!snapshot.hasData) {
            return SizedBox();
          }
          //   int? bannerslength=snapshot.data?.banners?.length;

          final bannerList = snapshot.data?.banners
              ?.where((element) => element.status == '0')
              .toList();
          print("ban${bannerList?.length}");
          var promotionaladsList = snapshot.data?.banners
              ?.where((element) => element.status == '1')
              .toList();
          print("pro${promotionaladsList}");

          if (widget.status == '0' && bannerList?.length != 0) {
            return CarouselSlider.builder(
              itemCount: bannerList?.length,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                aspectRatio: 2.6,
                initialPage: 0,
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage('${bannerList?[index].imagePath}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          } else if (widget.status == '1' && promotionaladsList?.length != 0) {
            return CarouselSlider.builder(
              itemCount: promotionaladsList?.length,
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                aspectRatio: 2.6,
                initialPage: 0,
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          '${promotionaladsList?[index].imagePath}'),
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            );
          }
          return SizedBox();
        });
  }
}
