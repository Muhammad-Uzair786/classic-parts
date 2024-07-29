import 'dart:convert';
import 'package:com.classic.classicparts/Providers/translation_provider.dart';
import 'package:com.classic.classicparts/constants.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/history_order_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/order_detail_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/pending_active_order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'authrememberprovider.dart';

class OrderProvider extends  ChangeNotifier
{
  Future<PendingActiveOrderModel> getPendingActiveOrders(context) async {
    final response= await http.get(Uri.parse(ApiEndPoints.BaseUri+ApiEndPoints.PendingActiveOrdersUri),
      headers: {
        'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context,listen: false).authtoken}',
        'Content-Type': 'application/json', // Set the content type to JSON
      },
    );
    final  decoderesponse=jsonDecode(response.body);

    try{      ///todomust correct try block in start of method
    if(response.statusCode==200)
      {
       // Provider.of<TranslationProvider>(context,listen: false).savePendingOrderList(PendingActiveOrderModel.fromJson(decoderesponse));
       print("decode${decoderesponse['orders']}");
       print("decode model${PendingActiveOrderModel.fromJson(decoderesponse)}");


      }else if(response.statusCode==404)
        {

          return PendingActiveOrderModel.fromJson(decoderesponse);
        }
    throw Exception();
   // return
  }catch(e)
    {
      return PendingActiveOrderModel.fromJson(decoderesponse);

    }

    }


    ///
  Future<HistoryOrderModel> getHistoryOrders(context) async {
    final response= await http.get(Uri.parse(ApiEndPoints.BaseUri+ApiEndPoints.HistoryOrdersUri),
      headers: {
        'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context,listen: false).authtoken}',
        'Content-Type': 'application/json', // Set the content type to JSON
      },
    );
    final  decoderesponse=jsonDecode(response.body);
    print("histoyorderresponse....${decoderesponse}");

    try{
      if(response.statusCode==200)
      {
        print('in200${response.body}');
        print('in200${HistoryOrderModel.fromJson(decoderesponse)}');
        return HistoryOrderModel.fromJson(decoderesponse);

      }else if(response.statusCode==404)
      {
        print("error404");
        return HistoryOrderModel.fromJson(decoderesponse);
      }
      throw Exception();
      // return
    }catch(e)
    {
      print("errorcatched");
      return HistoryOrderModel.fromJson(decoderesponse);

    }

  }

///
  Future<OrderDetailModel> getOrderDetail(context,String trackingId) async {
    final response= await http.get(Uri.parse(ApiEndPoints.BaseUri+ApiEndPoints.OrderDetailorgUri+trackingId),
      headers: {
        'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context,listen: false).authtoken}',
        'Content-Type': 'application/json', // Set the content type to JSON
      },
    );
    final  decoderesponse=jsonDecode(response.body);

    try{
      if(response.statusCode==200)
      {
        return OrderDetailModel.fromJson(decoderesponse);

      }else if(response.statusCode==404)
      {

        return OrderDetailModel.fromJson(decoderesponse);
      }
      throw Exception();
      // return
    }catch(e)
    {
      return OrderDetailModel.fromJson(decoderesponse);

    }

  }

///
  double totalPrice=0.0;
  double calcuateTotalPrice(item)
   {
     totalPrice=totalPrice+item;
     //notifyListeners();
     return totalPrice;
   }
}