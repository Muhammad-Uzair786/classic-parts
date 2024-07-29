import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/sub_category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';
import '../product_detail_Screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubcategoryScreen extends StatelessWidget {
  final categoryId;
  SubcategoryScreen(this.categoryId);

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return Scaffold(
          backgroundColor: CustomColor.WhiteColor,
          appBar: AppBar(
            backgroundColor: CustomColor.WhiteColor,
            automaticallyImplyLeading: false,
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
                      gradient: CustomColor.GradientColor,
                    ),
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
                  '${tr?.sub_category}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
                ),
             const SizedBox()
              ],
            ),
          ),

          body: SafeArea(
            child: FutureBuilder(
              future: Provider.of<ApiProvider>(context,listen: false).fetchsubCategory(context,categoryId),
              builder: (BuildContext context,AsyncSnapshot<SubCategoryModel> snapshot) {
                print("categoryid------------${categoryId}");
              // print('${snapshot.data!.subcategories!.length}');
                   if(!snapshot.hasData)
                     {
                       return Center(child: SizedBox(
                           height: 100,
                           width: 100,
                           child: Image.asset("asset/applogo.png")));
                     }else if(snapshot.hasError)
                       {
                         var snackBar = SnackBar(content: Text(snapshot.error.toString()),backgroundColor: Colors.white,);
                         ScaffoldMessenger.of(context).showSnackBar(snackBar,);
                       }
                 print("categorysection-----${snapshot.data?.subcategories}");
                
                 return snapshot.data?.subcategories!=null?DefaultTabController(
                   length: snapshot.data!.subcategories!.length,
                   // Number of tabs equals the number of subcategories
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children:[
                       TabBar(
                         isScrollable: true, // Allows scrolling if there are many tabs
                         tabs: snapshot.data!.subcategories!.map((subcategory) {
                           return Tab(
                             text: subcategory.name,
                           );
                         }).toList(),
                         indicatorColor: CustomColor.BlackColor,
                         labelColor: CustomColor.BlackColor,
                       ),
                       const SizedBox(height: 20,),
                       SizedBox(
                         height: MediaQuery.of(context).size.height*.75,
                         child: TabBarView(
                           children: snapshot.data!.subcategories!.map((subcategory) {

                             return FutureBuilder(
                               future: Provider.of<ApiProvider>(context).fetchsubCategoryproducts(context, subcategory.id),
                               builder: (context,snapshot) {
                                 if(!snapshot.hasData)
                                   {
                                     return Center(child: SizedBox(
                                         height: 100,
                                         width: 100,
                                         child: Image.asset("asset/applogo.png")));
                                   }
                                 return GridView.builder(
                                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                     crossAxisCount: 2, // Number of columns in the grid
                                     crossAxisSpacing: 5.0, // Spacing between columns
                                     childAspectRatio: .9// Spacing between rows
                                   ),
                                   itemCount: snapshot.data?.products?.length??1, // The total number of items in your grid
                                   itemBuilder: (BuildContext context, int index) {
                                     print("llll------${snapshot.data?.products?.length}");
                                    if(snapshot.data?.products?.length!=null) {
                                     final product= snapshot.data?.products?[index];
                                      return  Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 15),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(builder: (
                                                        context) =>
                                                        ProductDetailBody(
                                                          product_id: product?.id,)));
                                              },
                                              child: Container(
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width * 0.4,
                                                height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height * 0.17,
                                                // margin: EdgeInsets.only(top: index%2==0?0:30,),
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${product
                                                              ?.thumbnailUrl}"),
                                                      fit: BoxFit.cover),
                                                  borderRadius: BorderRadius
                                                      .circular(12),
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .end,
                                                  children: [
// SizedBox(
//   height: 120,//index % 2 == 0 ? 120 : 100,
//   width: 120,//index % 2 == 0 ? 120 : 100,
//   child: CircleAvatar(
//     radius: index % 2 == 0 ? 40 : 30,
//     backgroundImage: NetworkImage("https://example.com/image${index+1}.jpg"), // Replace with actual image URLs
//   ),
// ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .all(8.0),
                                                      child: CircleAvatar(
                                                          radius: 12,
                                                          backgroundColor: Colors
                                                              .grey[300],
                                                          child: const Icon(Icons
                                                              .favorite_outline,
                                                            size: 15,
                                                            color: Colors.white,)),
                                                    ),
                                                    const SizedBox(height: 8),

                                                  ],
                                                ),
                                              ),
                                            ),
                                            Text("${product?.productName}",style: TextStyle(color: CustomColor.BlackColor),),
                                            Text("${product?.productPrice}",style: TextStyle(color: CustomColor.BlackColor),),

                                          ],
                                        ),
                                      );
                                    }else
                                      {
                                        return Center(child: Text("${tr.no_product}",style: TextStyle(color: CustomColor.BlackColor),));
                                      }
                                   },
                                 );
                               }
                             );



                             //   Wrap(
                             //  // spacing: 12,
                             //   runSpacing: 8,
                             //   children: List.generate(8, (index) {
                             //
                             //     return Container(
                             //       margin: EdgeInsets.only(left: 20),
                             //       child: Column(
                             //         crossAxisAlignment: CrossAxisAlignment.start,
                             //         children: [
                             //           GestureDetector(
                             //             onTap:(){
                             //               Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailBody()));
                             //
                             //             },
                             //             child: Container(
                             //               width: MediaQuery.of(context).size.width * 0.4,
                             //               height: MediaQuery.of(context).size.height * 0.3,
                             //               margin: EdgeInsets.only(top: index%2==0?0:30,),
                             //               decoration: BoxDecoration(
                             //                 image: DecorationImage(image: AssetImage("asset/cover.jpg"),fit: BoxFit.cover),
                             //                 borderRadius: BorderRadius.circular(12),
                             //               ),
                             //               child: Column(
                             //                 crossAxisAlignment: CrossAxisAlignment.end,
                             //                 children: [
                             //                   // SizedBox(
                             //                   //   height: 120,//index % 2 == 0 ? 120 : 100,
                             //                   //   width: 120,//index % 2 == 0 ? 120 : 100,
                             //                   //   child: CircleAvatar(
                             //                   //     radius: index % 2 == 0 ? 40 : 30,
                             //                   //     backgroundImage: NetworkImage("https://example.com/image${index+1}.jpg"), // Replace with actual image URLs
                             //                   //   ),
                             //                   // ),
                             //                   Padding(
                             //                     padding: const EdgeInsets.all(8.0),
                             //                     child: CircleAvatar(
                             //                         radius: 12,
                             //                         backgroundColor: Colors.grey[300],
                             //                         child: Icon(Icons.favorite_outline,size: 15,color: CustomColor.WhiteColor,)),
                             //                   ),
                             //                   SizedBox(height: 8),
                             //
                             //                 ],
                             //               ),
                             //             ),
                             //           ),
                             //           Text("Item Name"),
                             //           Text("\$35.00"),
                             //
                             //         ],
                             //       ),
                             //     );
                             //   }),
                             // );
                           }).toList(),
                         ),
                       ),
                     ]
                   ),
                 ):Center(child: Text("${tr.no_subcategory_added_yet}",style: TextStyle(color: CustomColor.BlackColor),));



              },
            ),
          ),
        );

  }
}



