import 'package:com.classic.classicparts/Auth/login_screen.dart';
import 'package:com.classic.classicparts/Helpers/helper_class.dart';
import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
import 'package:com.classic.classicparts/Providers/order_provider.dart';
import 'package:com.classic.classicparts/constants.dart';
import 'package:com.classic.classicparts/separateAppfiles/AddressSection/add_new_address.dart';
import 'package:com.classic.classicparts/separateAppfiles/MainBottomNavigationPage.dart';
import 'package:com.classic.classicparts/separateAppfiles/OrderSetion/ordertabs/order_tabs_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/OrderSetion/ordertabs/running_order_page.dart';
import 'package:com.classic.classicparts/separateAppfiles/home_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/paymentscreen/paymentmethodscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:provider/provider.dart';

import '../../Providers/cart_provider.dart';
import '../ApiModels/pending_active_order_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderDetailScreen extends StatefulWidget {
  final orderCollectionList;
  bool fromhistory;
  String orderTrackingId;
OrderDetailScreen({required this.orderCollectionList,this.fromhistory=false, required this.orderTrackingId});
  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<OrderProvider>(context,listen: false).totalPrice=0;
    var tr= AppLocalizations.of(context);


    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,
      resizeToAvoidBottomInset: true, // This is the key property for handling the keyboard

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
              '${tr?.order_detail}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
            ),
            SizedBox(),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${tr?.address}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: CustomColor.BlackColor)),
              SizedBox(height: 5,),

              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: CustomColor.GradientColor
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height:60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: CustomColor.TextGreyColor)
                      ),
                      child: Icon(Icons.location_on_outlined,color: Colors.white,),

                    ),
                    SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                            child: Text('${Provider.of<RememberMeProvider>(context).userName}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,)),
                        SizedBox(height: 10,),
                        SizedBox(
                            width: 200,
                            child: Text('${Provider.of<RememberMeProvider>(context).address}',style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                      ],),
                  ],
                ),
              ),

              SizedBox(height: 10,),
              ///Paymentsection
              // Text("Selected payment method",style: CustomColor.StyleBlackbold.copyWith(fontSize: 15),),
              // SizedBox(height: 5,),
              //
              // ///payment
              // Card(
              //   elevation: 2.0,
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(20)
              //
              //   ),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         gradient: CustomColor.GradientColor,
              //         borderRadius: BorderRadius.circular(20)
              //     ),
              //     child: Column(
              //       children: [
              //         ListTile(
              //           onTap: (){
              //             Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentMethodScreen()));
              //
              //           },
              //           leading: Icon(Icons.wallet_outlined,color: CustomColor.WhiteColor,),
              //           title: Text('Payment Method',style: CustomColor.StyleWhitebold,),
              //           trailing: Icon(Icons.edit,color: CustomColor.WhiteColor,),
              //         ),
              //         ListTile(
              //           leading: Icon(Icons.paid_outlined,color: CustomColor.WhiteColor,),
              //           title: Text('Cash',style: CustomColor.StyleWhitebold.copyWith(fontSize: 15,fontWeight:FontWeight.normal),),
              //           trailing: Text('Rs:228.00',style: CustomColor.StyleWhitenormal,)
              //         ),
              //
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(height: 5,),
              ///Order Summary
              Text("${tr?.order_summary}",style: CustomColor.StyleBlackbold.copyWith(fontSize: 15)),
               Card(
              elevation: 2.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)

            ),
            child: Container(
              decoration: BoxDecoration(
                  gradient: CustomColor.GradientColor,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.summarize_outlined,color: Colors.white,),
                    title: Text('${tr?.order_summary}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),
                  //for(int index=0;index<pronamewithprice.length;index++)
                 SizedBox(
                   height: 200,
                   child: ListView.builder(
                       itemCount: widget.orderCollectionList?.length,

                       itemBuilder: (context,index){
                        if(widget.orderCollectionList?[index].products?.productPoints==null) {
                          final productQuantity = widget
                              .orderCollectionList![index].quantity;
                          final productPrice = widget
                              .orderCollectionList![index].products
                              ?.productPrice;
                          final item = productQuantity! * productPrice!;

                          Provider.of<OrderProvider>(context, listen: false)
                              .calcuateTotalPrice(item);
                        }
                        // print('total$totalprice');
                         return RowItem('${widget.orderCollectionList?[index].products?.productName}', '${widget.orderCollectionList?[index].products?.productPoints!=null? (widget.orderCollectionList?[index].products?.productPoints):widget.orderCollectionList?[index].products?.productPrice} X ${widget.orderCollectionList?[index].quantity} ');

                       }),),

                  ///no need at this time
                    //RowItem('Subtotal', ""),



                  // RowItem('Shiping Fee', '15'),
                ],
              ),
            ),
          ),
              SizedBox(height: 10,),
              // Card(
              //   elevation: 2,
              //   child: Container(
              //     padding: EdgeInsets.all(10),
              //     decoration: BoxDecoration(
              //         gradient: CustomColor.GradientColor,
              //         borderRadius: BorderRadius.circular(10)
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text("Estimated Delivery Time:",style: CustomColor.StyleWhitenormal,),
              //         Text("3-7 day",style: CustomColor.StyleWhitenormal,),
              //       ],
              //     ),
              //   ),
              // ),

              Card(
                elevation: 2,

                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      gradient: CustomColor.GradientColor,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("${tr?.total}",style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold).copyWith(fontSize: 18),),
                          Text(" (${widget.orderCollectionList?.length} ${tr?.item})",style:TextStyle(color: Colors.white),),
                        ],
                      ),
                      Consumer<OrderProvider>(
                          builder: (BuildContext context, value, Widget? child) {
                            return Text("Rs:${value.totalPrice}",style:TextStyle(color: Colors.white),);
                          },
                          ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.fromhistory?SizedBox(): GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Text(
                      '${tr?.cancel}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.BlackColor
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      HelperClass helper=HelperClass();
                      widget.fromhistory?
                      Navigator.pop(context):
                      await helper.showCancelOrderConfirmationDialog(context, widget.orderTrackingId);
                      //Provider.of<CartProvider>(context,listen: false).clearCartItems();
                    },
                    child: Container(
                      width: 130,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          gradient: CustomColor.GradientColor,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(widget.fromhistory?'${tr?.close}':'${tr?.cancel_order}',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}


class RowItem extends StatelessWidget {
  final String itemName;
  final String price;

  RowItem(this.itemName, this.price);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(itemName,style:TextStyle(color: Colors.white),),
            Consumer<OrderProvider>(builder: (BuildContext context, value, Widget? child) =>
           Text('Rs:' + '${price}', style:TextStyle(color: Colors.white)))

            ],
          ),
          Divider(), // Divider after the first row

        ],
      ),


      ///

    );
  }
}