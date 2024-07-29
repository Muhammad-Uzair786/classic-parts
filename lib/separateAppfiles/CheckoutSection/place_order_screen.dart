import 'package:com.classic.classicparts/Auth/login_screen.dart';
import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PlaceOrderScreen extends StatefulWidget {
  final totalamount;
  final totalpoints;
  List<dynamic> pronamewithprice;
   PlaceOrderScreen({super.key, this.totalamount, required this.pronamewithprice, this.totalpoints});


  @override
  State<PlaceOrderScreen> createState() => _PlaceOrderScreenState();
}

class _PlaceOrderScreenState extends State<PlaceOrderScreen> {
  void showBottomSheett(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: CustomColor.WhiteColor,
      context: context,
      isScrollControlled: false,
      builder: (BuildContext context) {
        return BottomSheetContent();
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    final remembermeprovider = Provider.of<RememberMeProvider>(context, listen: false);
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
              '${tr?.checkout}',
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
                Text("${tr?.address}",style: TextStyle(color: CustomColor.BlackColor,fontSize: 15,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),

                Container(
                  height: 100,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: CustomColor.GradientColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width*.5,
                                child: Text('${Provider.of<RememberMeProvider>(context,listen: false).userName}',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,)),
                            SizedBox(height: 10,),
                            SizedBox(
                                width: MediaQuery.of(context).size.width*.5,

                                child: Text('${Provider.of<RememberMeProvider>(context,listen: false).address}',style:TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                          ],),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => sh);
                          showBottomSheett(context);
                        },
                        child: Container(
                          height:30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: CustomColor.TextGreyColor)
                          ),
                          child: Icon(Icons.edit,color: Colors.white,),

                        ),
                      ),

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
                Text("${tr?.order_summary}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),

                CustomCard(pronamewithprice: widget.pronamewithprice,totalamount: widget.totalamount,),
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
                if(remembermeprovider.userRoleIndex!='2')

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
                            Text("${tr?.total}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                            Text(" (${widget.pronamewithprice.length} ${tr?.item})",style:TextStyle(color: Colors.white),),
                          ],
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width*.5,
                            child: Text("Rs:${widget.totalamount}",style:TextStyle(color: Colors.white),textAlign:TextAlign.end, overflow: TextOverflow.ellipsis,)),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${tr?.cancel}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                     await Provider.of<ApiProvider>(context,listen: false).PlaceOrderApi(context,widget.totalpoints);

                      },
                      child: Container(
                        width: 130,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: CustomColor.GradientColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text('${tr?.place_order}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
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
///card
class CustomCard extends StatelessWidget {
  final totalamount;
  List<dynamic> pronamewithprice;
  CustomCard({this.totalamount, required this.pronamewithprice});
  @override
  Widget build(BuildContext context) {
    final remembermeprovider = Provider.of<RememberMeProvider>(context, listen: false);
    var tr= AppLocalizations.of(context);

    return Card(
      elevation: 2.0,
     shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(20)

     ),
      child: Container(
        padding: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          gradient: CustomColor.GradientColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          children: [
             ListTile(
              leading: Icon(Icons.summarize_outlined,color: Colors.white),
              title: Text('${tr.order_summary}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
            ),
            for(int index=0;index<pronamewithprice.length;index++)
            RowItem(itemName:'${pronamewithprice[index]['product_name']}', price: '${pronamewithprice[index]['product_points']!='null'?'Points: '+pronamewithprice[index]['product_points']: "Rs: "+pronamewithprice[index]['product_price']} X ${pronamewithprice[index]['product_count']} '),

            const Divider(), // Divider after the first row
                Text("${tr.points_will_be_deducted_from_your_wallet}",style: TextStyle(color: Colors.greenAccent,fontSize: 10),),
            if(remembermeprovider.userRoleIndex!='2')

              RowItem(itemName:'Subtotal', price:'Rs: $totalamount'),
           // RowItem('Shiping Fee', '15'),
          ],
        ),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final String itemName;
  final String price;

  RowItem({required this.itemName, required this.price});

  @override
  Widget build(BuildContext context) {
    final remembermeprovider = Provider.of<RememberMeProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width*.4,
              child: Text(itemName,style: TextStyle(color: Colors.white),maxLines: 2,)),
          if(remembermeprovider.userRoleIndex!='2')
            SizedBox(
              width: MediaQuery.of(context).size.width*.3,
              child: Text('$price',textAlign: TextAlign.end,style: TextStyle(color: Colors.white),overflow: TextOverflow.ellipsis,)),
        ],
      ),


      ///

    );
  }
}



class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final _formKey = GlobalKey<FormState>();

  String houseNumber = '';
  String street = '';
  String area = '';
  String city = '';

  int selectedDeliveryOption = 0;

   List <Map<String,dynamic>> getdeliveryOptions(BuildContext context)
  {
    var tr= AppLocalizations.of(context);

    return [
  { 'text':'${tr.home}','icon':Icons.home},
  { 'text':'${tr.shop}','icon':Icons.shop_2_outlined},
  { 'text':'${tr.other}','icon':Icons.add}
  ];
  }
  void _selectDeliveryOption(int index) {
    setState(() {
      selectedDeliveryOption = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);
    List <Map<String,dynamic>>  deliveryOptions=getdeliveryOptions(context);
    return KeyboardDismissOnTap(
      child: Scaffold(
        backgroundColor: CustomColor.WhiteColor,
        body: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

            children:[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${tr.delivery_details}',style: TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold)),
                    SizedBox(height: 8,),
                    Container(
                      height: 100,
                      padding: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: CustomColor.GradientColor
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height:60,
                                width: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: CustomColor.TextGreyColor)
                                ),
                                child: Icon(Icons.location_on_outlined,color: Colors.white,),

                              ),
                              Text('${Provider.of<RememberMeProvider>(context,listen: false).address.isEmpty?"not given any address":Provider.of<RememberMeProvider>(context,listen: false).address}',style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                            ],
                          ),
                          // Container(
                          //   height:30,
                          //   width: 30,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     //  border: Border.all(color: CustomColor.TextGreyColor)
                          //   ),
                          //   child: Icon(Icons.edit,color: Colors.white,),
                          //
                          // ),
                        ],
                      ),
                    ),

                    _buildTextField('${tr.house_number}', (value){ houseNumber = value;},(value){
                      if(value=='')
                      {
                        return "${tr.field_is_empty}";
                      }else
                      {
                        return null;
                      }
                    },
                      Icons.home
                    ),
                    _buildTextField('${tr.street}', (value) => street = value,(value){
                      if(value!.isEmpty)
                      {
                        return "${tr.field_is_empty}";
                      }else
                      {
                        return null;
                      }

                    },
                      Icons.streetview
                    ),
                    _buildTextField('${tr.area}', (value) =>area=value,(value){
                      if(value!.isEmpty)
                      {
                        return "${tr.field_is_empty}";
                      }else
                      {
                        return null;
                      }
                    },
                    Icons.area_chart_outlined
                    ),
                    _buildTextField('${tr.city}', (value) => city = value,(value){
                      if(value!.isEmpty)
                      {
                        return "${tr.field_is_empty}";
                      }else
                      {
                        return null;
                      }
                    },
                    Icons.location_city
                    ),

                    SizedBox(height: 16.0),
                    Text(
                      '${tr.add_label}',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(deliveryOptions.length, (index) {
                        return _buildDeliveryOption(index, deliveryOptions[index]);
                      }),
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () async {
                        if(_formKey.currentState!.validate())
                        {
                          print("beforecalladdress");
                          final  response=await Provider.of<ApiProvider>(context,listen: false).updateaddress(context,"$houseNumber"+" $street"+" $area"+" $city");
                          print("aftercalladdress$response");

                          Navigator.pop(context);

                          if(response!='tokenerror') {
                            var snackBar = SnackBar(
                              content: Text('${response['message'].toString()}'),
                              backgroundColor: Colors.blue,);
                            ScaffoldMessenger.of(context).showSnackBar(snackBar,);
                          }else
                          {
                            var snackBar = SnackBar(
                              content: Text('${response['error'].toString()}'),
                              backgroundColor: Colors.blue,);
                            ScaffoldMessenger.of(context).showSnackBar(snackBar,);
                            // Navigator.pop(context);
                          }
                        }

                      },
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),              // margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                            width: double.infinity,

                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              gradient: CustomColor.GradientColor,
                              borderRadius: BorderRadius.circular(20),

                            ),
                            // style: ButtonStyle(
                            //     backgroundColor: MaterialStatePropertyAll(CustomColor.BlueColor),
                            //     padding: MaterialStatePropertyAll(EdgeInsets.all(15))
                            //
                            // ),
                            child: Text("${tr.update_address}",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, Function(String) onChanged, String? Function(String?)? validator,prefixicon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$labelText', style: TextStyle(fontWeight: FontWeight.bold,color: CustomColor.BlackColor),),
        Container(
          decoration: BoxDecoration(
            gradient: CustomColor.GradientColor,
            borderRadius: BorderRadius.circular(20)
          ),
          child: TextFormField(
            //  controller: controller,
            validator: validator,
            onChanged: onChanged,
            cursorColor: Colors.white,
            style:TextStyle(color: Colors.white,),
            decoration: InputDecoration(
              hintText: labelText,
              hintStyle: TextStyle(color: Color(0xffCBCBCB)),
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              prefixIcon: Icon(prefixicon,color: Colors.white,),
              //suffixIcon: labelText == 'Password' ? _buildPasswordStrengthIndicator() : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.transparent//Color(0xffF8F8F8),
            ),
            // validator: validator,
          ),
        ),

      ],
    );
  }

  Widget _buildDeliveryOption(int index, Map<String,dynamic> option) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _selectDeliveryOption(index),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),

            ),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
               // color: selectedDeliveryOption == index ? Colors.blue : Colors.grey[300],
                borderRadius: BorderRadius.circular(50.0),
                gradient: selectedDeliveryOption == index?CustomColor.GradientColor:CustomColor.WhiteGradientColor
              ),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                //  mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    option['icon'],
                    color: selectedDeliveryOption == index ? Colors.white : Colors.white60,
                  ),
                ],
              ),
            ),
          ),
        ),
        Text("${option['text']}")
      ],
    );
  }
}