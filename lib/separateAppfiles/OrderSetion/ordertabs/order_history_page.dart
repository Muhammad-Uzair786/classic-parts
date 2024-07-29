


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../Providers/order_provider.dart';
import '../../../constants.dart';
import '../../ApiModels/history_order_model.dart';
import '../order_detail_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return FutureBuilder<HistoryOrderModel>(future: Provider.of<OrderProvider>(context,listen: false).getHistoryOrders(context),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting)
          {
            return Center(child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("asset/applogo.png")));
          }
          if(!snapshot.hasData ||snapshot.data?.orders==null)
          {
            print("emptyhistory${snapshot.data}");
            print("emptyhistoryorders${snapshot.data?.orders?[0]}");
            return Center(child: Text("${tr?.no_history}",style: TextStyle(color: Colors.black),),);
          }
          return ListView.builder(
              itemCount: snapshot.data!.orders?.length,
              itemBuilder: (context,index){
                print("vvvv${snapshot.data?.orders}");
                final orderproduct= snapshot.data!.orders?[index];
                DateTime dateTime = DateTime.parse(orderproduct!.order![0].createdAt.toString());
                String formattedDateTime = DateFormat('MMMM d, y - hh:mm a').format(dateTime);

                print('Formattedyes${orderproduct.order?[0].status} DateTime: $formattedDateTime');
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return OrderDetailScreen(orderCollectionList: orderproduct.order,fromhistory: true, orderTrackingId: orderproduct.trackingId.toString(),);
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
                          mainAxisAlignment: MainAxisAlignment.start,

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
                                        '${orderproduct?.trackingId}',
                                        style: TextStyle(color: Colors.white),
                                        maxLines: 1,
                                      ),
                                    ),
                                    SizedBox(width: 10,),  ///todo use authentc way
                                    Text(
                                      '${orderproduct.order![0].status=='2'?"${tr?.delivered}":"${tr?.rejected}"}',
                                      style:TextStyle(color: orderproduct.order![0].status=='2'?CustomColor.LightGreenAccentColor:CustomColor.RedColor),
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

