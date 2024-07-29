import 'package:com.classic.classicparts/constants.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/points_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/api_provider.dart';
import '../../Providers/authrememberprovider.dart';
import '../ApiModels/all_product_model.dart';
import '../Classes/network_utills.dart';
import '../product_detail_Screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoyalityPointScreen extends StatefulWidget {
  const LoyalityPointScreen({super.key});

  @override
  State<LoyalityPointScreen> createState() => _LoyalityPointScreenState();
}

class _LoyalityPointScreenState extends State<LoyalityPointScreen> {
  int? selectedindex;
  @override
  Widget build(BuildContext context) {
    NetworkUtils.checkAndNavigateIfNetworkUnavailable(context);
    var tr= AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Stack(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                        gradient: CustomColor.GradientColor

                    ),
                      child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage('https://tse2.mm.bing.net/th?id=OIP.StvcRUg7GOPQ53i-L0Ft0AAAAA&pid=Api&P=0&h=180.jpg'),
                                    fit: BoxFit.cover
                                ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${tr?.loyality_points}",style: TextStyle(color: Colors.white),),
                              SizedBox(height: 10,),
                              Consumer<RememberMeProvider>(

                                  builder: (BuildContext context, value, Widget? child) {
                                    return Text("${value.userPoints=='null'?'0':value.userPoints}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white));


                                    },
                              )
                            ],
                          ) ],
                      )
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 480,
                    width: 400,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${tr?.points_product}",style: TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold),),
                          SizedBox(height: 20,),

                          SizedBox(
                            height: 700,
                            child: FutureBuilder<PointsProductModel>(
                                future: Provider.of<ApiProvider>(context, listen: false)
                                    .PointsProduct(context),
                                builder: (context,
                                    AsyncSnapshot<PointsProductModel> snapshot) {
                                 if(snapshot.connectionState==ConnectionState.waiting)
                                      {
                                        return Center(child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Image.asset("asset/applogo.png")));
                                      }
                                  else if(!snapshot.hasData || snapshot.data!.products==null)
                                  {
                                  return Center(child: Text("${tr?.no_points_product}",style: TextStyle(color: CustomColor.BlackColor),));
                                  }else {
                                   return GridView.builder(

                                     itemCount: snapshot.data?.products?.length,
                                     shrinkWrap: true,
                                     physics: NeverScrollableScrollPhysics(),
                                     itemBuilder: (BuildContext context,
                                         index) {
                                       print(
                                           "tttttt${snapshot.data?.products}");

                                       final product = snapshot.data
                                           ?.products![index];
                                       return Container(
                                         margin: EdgeInsets.only(left: 10),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment
                                               .start,
                                           children: [
                                             GestureDetector(
                                               onTap: () {
                                                 Navigator.of(context).push(
                                                     MaterialPageRoute(
                                                         builder: (context) =>
                                                             ProductDetailBody(
                                                               product_id: product
                                                                   ?.id,
                                                               productPoints: product?.productPoints,
                                                             )));
                                               },
                                               child: Container(
                                                 width: MediaQuery
                                                     .of(context)
                                                     .size
                                                     .width * 0.4,
                                                 height: MediaQuery
                                                     .of(context)
                                                     .size
                                                     .height * 0.2,
                                                 margin: EdgeInsets.only(
                                                     top: index % 2 == 0
                                                         ? 0
                                                         : 20),
                                                 decoration: BoxDecoration(
                                                   image: DecorationImage(
                                                       image: NetworkImage(
                                                           "${snapshot.data
                                                               ?.products![index]
                                                               .thumbnailUrl}"),
                                                       fit: BoxFit.fill),
                                                   borderRadius: BorderRadius
                                                       .circular(12),
                                                 ),
                                                 child: Column(
                                                   crossAxisAlignment: CrossAxisAlignment
                                                       .end,
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
                                                     SizedBox(height: 8),
                                                   ],
                                                 ),
                                               ),
                                             ),
                                              Text("${product?.productName}",style: TextStyle(color: CustomColor.BlackColor),),
                                              Text("${tr?.points}:${product?.productPoints}",style: TextStyle(color: CustomColor.BlackColor),),
                                           ],
                                         ),
                                       );
                                     },
                                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                         crossAxisCount: 2,
                                         childAspectRatio: .7,
                                         mainAxisSpacing: 2),
                                   );
                                 }
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
                          ),
                        ],
                      ),
                    ),
                  )



                ],
              ),
             ///todomust
             //  Positioned(
             // bottom: 20,
             //  left: 50,
             //    child: ElevatedButton(onPressed: (){
             //      showDialog(
             //        context: context,
             //        builder: (BuildContext context) {
             //          return AlertDialog(
             //            //backgroundColor: CustomColor.GradientColor,
             //
             //            content: Column(
             //              mainAxisSize: MainAxisSize.min,
             //              children: [
             //                GestureDetector(
             //                  onTap: (){
             //                    Navigator.pop(context);
             //                  },
             //                  child: Align(
             //                      alignment: Alignment.topRight,
             //                      child: Icon(Icons.clear)),
             //                ),
             //                Image.network(
             //                  'https://via.placeholder.com/100',
             //                  width: 50,
             //                  height: 50,
             //                ),
             //                SizedBox(height: 10),
             //                Text('5 points=1 Rs',style: CustomColor.StyleWhitenormal.copyWith(fontSize: 12,color: Colors.blue)),
             //                Text('(from 0 points)',style: CustomColor.StyleWhitenormal.copyWith(fontSize: 12,color: Colors.blue)),
             //                Text('Amount can be convert into wallet money',style: CustomColor.StyleWhitenormal.copyWith(fontSize: 12,color: Colors.blue),),
             //                SizedBox(height: 10),
             //                Container(
             //                  padding: EdgeInsets.only(left: 10),
             //                  decoration: BoxDecoration(
             //                    border: Border.all(color: CustomColor.DarkBlueColor),
             //                    borderRadius: BorderRadius.circular(10)
             //                  ),
             //                  child: TextField(
             //                    keyboardType: TextInputType.number,
             //                    decoration: InputDecoration(
             //                    //  labelText: 'Enter Number',
             //                      hintText: '0',
             //
             //                      border:InputBorder.none
             //
             //                    ),
             //                    textAlign: TextAlign.center,
             //                  ),
             //                ),
             //                SizedBox(height: 20),
             //                GestureDetector(
             //                  onTap: (){
             //                   Navigator.pop(context);
             //                  },
             //                  child: Container(
             //                    width: 100,
             //                    padding: EdgeInsets.all(10),
             //                    decoration: BoxDecoration(
             //                      gradient: CustomColor.GradientColor,
             //                      borderRadius: BorderRadius.circular(10),
             //                    ),
             //             child: Text('Submit',style: CustomColor.StyleWhitebold,textAlign: TextAlign.center,),
             //
             //          ),
             //                ),
             //              ],
             //            ),
             //          );
             //        },
             //      );
             //    }, child: Text("Convert to Wallet Money",style: CustomColor.StyleWhitenormal,),
             //    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(CustomColor.BlueColor)),
             //    ),
             //  )
            ],
          ),
        ),
      ),
    );
  }
}



