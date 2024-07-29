import 'dart:convert';

import 'package:com.classic.classicparts/separateAppfiles/ApiModels/all_product_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/category_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/pending_active_order_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/translation_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslationProvider extends ChangeNotifier
{
  bool status=false;
  String commonKey = 'Text';

  List Translatecategorynamesreturn=[];
  Future<String> translateHomePageText(context) async {
    final apiKey = '15fafc2bec1a457b88f7f88e5d718bec';
    final endpoint = 'https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&from=en&to=ur';
   final homepagelist= await Provider.of<TranslationProvider>(context,listen: false).homepagelists();
   print('map$homepagelist');
    final response = await post(
      Uri.parse(endpoint) ,
      headers: {
        'Content-Type': 'application/json',
        'Ocp-Apim-Subscription-Key': apiKey,
        'Ocp-Apim-Subscription-Region': 'eastasia',
      },
      body: json.encode(
       homepagelist
      ),
    );

    if (response.statusCode == 200) {
      final translations = json.decode(response.body);
      print("check1$translations");

      for(var a in translations)
        {
          Translatecategorynamesreturn.add(a);
          print("checknext$a");
        }

    //  print(translations[0]['translations'][0]['text']);
      notifyListeners();
      print('tra$Translatecategorynamesreturn');

      return translations[0]['translations'][0]['text'];
    } else {
      throw Exception('Failed to translate text.');
    }

  }
                                      ///HomeScreen store/retrieve Apis data for Translation

// Function to save a list of strings
  Future<void> saveCategoryList(CategoryModel list) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('categorylist', list.categories!.map((e) => e.name!).toList());
    notifyListeners();
  }

// Function to retrieve a list of strings
  Future<List<String>> getCategoryList() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('categorylist') ?? [];
    notifyListeners();
    return list;
  }
  // Function to Clear a list of strings
  ClearCategoryList() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('categorylist');
    notifyListeners();
  }

// Function to save a list of strings
  Future<void> saveproductsList(AllProductModel list) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('productlist', list.products!.map((e) => e.productName!).toList());
    notifyListeners();
  }

// Function to retrieve a list of strings
  Future<List<String>> getproductsList() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('productlist') ?? [];
    notifyListeners();
    return list;
  }

  ClearproductList() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('productlist');
    notifyListeners();
  }
  int homePageCount=0;
 Future homepagelists()
  async {
   final categorylist=await getCategoryList();
   homePageCount =categorylist.length;
   final productlist=await getproductsList();

   final catpromaplist=[];
    categorylist.addAll(productlist);
  for(var i in categorylist)
  {

    catpromaplist.add({
      '$commonKey':'$i',
    });
  }
   print('mappppppp$catpromaplist');
   print('count$homePageCount');
   notifyListeners();
   return catpromaplist;
   print('homepagelists$catpromaplist');
  }


                                                ///OrderScreen store/retrieve Apis data for Translation
// Function to save a list of strings
//   Future<void> savePendingOrderList(PendingActiveOrderModel list) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList('running_product_name_list', list.orders!.map((e) => e.products?.productName??'').toList());
//     await prefs.setStringList('running_product_date', list.orders!.map((e) => e.products?.productName??'').toList());
//     notifyListeners();
//   }

// Function to retrieve a list of strings
  Future<List<String>> getPendingOrderList() async {
    final prefs = await SharedPreferences.getInstance();
    final list1 = prefs.getStringList('running_product_name_list') ?? [];
    final list2 = prefs.getStringList('running_product_date') ?? [];
    list1.addAll(list2);
    notifyListeners();
    return list1;
  }
  // Function to Clear a list of strings
  ClearPendingOrderList() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('running_product_name_list');
    prefs.remove('running_product_date');
    notifyListeners();
  }
  Future RunningOrderlists()
  async {
    final PendingOrderList=await getPendingOrderList();

    final runningmaplist=[];
    for(var i in PendingOrderList)
    {

      runningmaplist.add({
        '$commonKey':'$i',
      });
    }
    print('mappppppp$runningmaplist');
    notifyListeners();
    return runningmaplist;
  }

  List Translaterunningorders=[];

  Future<String> translateRunningOrderPageText(context) async {
    final apiKey = '15fafc2bec1a457b88f7f88e5d718bec';
    final endpoint = 'https://api.cognitive.microsofttranslator.com/translate?api-version=3.0&from=en&to=ur';
    final runningorderpagelist= await Provider.of<TranslationProvider>(context,listen: false).RunningOrderlists();
    print('map$runningorderpagelist');
    final response = await post(
      Uri.parse(endpoint) ,
      headers: {
        'Content-Type': 'application/json',
        'Ocp-Apim-Subscription-Key': apiKey,
        'Ocp-Apim-Subscription-Region': 'eastasia',
      },
      body: json.encode(
          runningorderpagelist
      ),
    );

    if (response.statusCode == 200) {
      final translations = json.decode(response.body);
      print("check1$translations");

      for(var a in translations)
      {
        Translaterunningorders.add(a);
        print("checknext$a");
      }

      //  print(translations[0]['translations'][0]['text']);
      notifyListeners();
      print('tra$Translaterunningorders');

      return translations[0]['translations'][0]['text'];
    } else {
      throw Exception('Failed to translate text.');
    }

  }


}