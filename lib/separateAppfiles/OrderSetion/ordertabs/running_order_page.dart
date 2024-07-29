
import 'package:com.classic.classicparts/Providers/cart_provider.dart';
import 'package:com.classic.classicparts/Providers/translation_provider.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/pending_active_order_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/OrderSetion/order_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../Providers/order_provider.dart';
import '../../../constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RunningOrderPage extends StatelessWidget {
  const RunningOrderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return FutureBuilder<PendingActiveOrderModel>(future: Provider.of<OrderProvider>(context,listen: false).getPendingActiveOrders(context),
        builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting)
        {
          return Center(child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset("asset/applogo.png")));
        }else if(!snapshot.hasData||snapshot.data!.orders==null)
      {
        return Center(child: Text("${tr?.no_order}"),);
      }else
   //  Map<String,dynamic>  ordermap=snapshot.data!.orders;
   //    List<MapEntry<String, dynamic>> orderlist = ordermap.entries.toList();
   //    for (int i = 0; i < orderlist.length; i++) {
   //      var entry = orderlist[i];
   //      var key = entry.key;
   //      PendingActiveOrderModel orderInstance = entry.value;
   //      print('Key: $key');
   //      // You can access properties and methods of the "Order" instance here
   //      print('Order ID: ${orderInstance.orders}');
   //    }
   // print('listconverted${orderlist[0].value}');
      return ListView.builder(
          itemCount: snapshot.data!.orders?.length,
          itemBuilder: (context,index){
       final orderproduct= snapshot.data!.orders?[index];
       print("test1${snapshot.data}");
       print("test${snapshot.data!.orders?.length}");
       print("test${snapshot.data!.orders}");
       DateTime dateTime = DateTime.parse(orderproduct!.order![0].createdAt.toString());
       String formattedDateTime = DateFormat('MMMM d, y - hh:mm a').format(dateTime);
       // for(int i=0;i<=snapshot.data!.orders!.length;i++)
       //   {
       //     orderproduct.trackingId=snapshot.data!.orders?[i].trackingId;
       //   }
       //  List trackingidfilterlist=[];
       print('Formatted DateTime: $formattedDateTime');
         return GestureDetector(
           onTap: (){


             Navigator.push(context, MaterialPageRoute(builder: (context){
               return OrderDetailScreen(orderCollectionList: orderproduct.order,orderTrackingId:orderproduct.trackingId.toString());
             }));
           },
           child: Card(

             margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
             elevation: 4,
             child: Container(
               width: MediaQuery.of(context).size.width,
               decoration: BoxDecoration(
                   gradient: CustomColor.GradientColor,
                   borderRadius: BorderRadius.circular(10)
               ),
               child: Padding(
                 padding: EdgeInsets.all(16.0),
                 child: Row(

                   children: [
                     Container(
                       height: 60,
                       width: 60,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: CustomColor.WhiteColor
                       ),
                       child: Icon(Icons.delivery_dining,color: CustomColor.BlackColor,),
                     ),
                     SizedBox(width: 10,),

                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,

                           children: [
                             SizedBox(
                               width: 140,
                               child: Text(
                                 '${orderproduct.trackingId}',
                                 style: TextStyle(color: Colors.white),
                                 maxLines: 1,
                               ),
                             ),
                             SizedBox(width: 30,),  ///todo use authentc way
                             Text(
                                 '${orderproduct.order![0].status=='0'?"${tr?.pending}":"${tr?.active}"}',
                                 style:TextStyle(color: orderproduct.order![0].status=='0'?CustomColor.YellowColor:CustomColor.GreenAccentColor,),
                               maxLines: 1,
                             ),
                           ],
                         ),
                         SizedBox(height: 8),
                         Text(
                             '${formattedDateTime}',
                           style: TextStyle(color: Colors.white),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
             ),
           ),
         );
      });
    });
  }
}

