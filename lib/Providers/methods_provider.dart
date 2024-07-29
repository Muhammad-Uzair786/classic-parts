import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/sub_category_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../separateAppfiles/ApiModels/category_model.dart';
import 'api_provider.dart';
import 'authrememberprovider.dart';

class MethodsProvider extends ChangeNotifier
{
  final BuildContext context;

  MethodsProvider(this.context);
  double lowPrice = 100; // Initial low price value
  double highPrice = 500; // Initial high price value
  void rangevalues(values) {

  lowPrice = values.start;
  highPrice = values.end;
  notifyListeners();

  }
  ///categorieslist
  Categories?  selectedCategory;
    final selectedSubcategories = [];
  bool isSelected=false;
  void selectCategory(category) {

      selectedCategory = category;
      selectedSubcategories.clear();
      notifyListeners();

  }

  ///
  void toggleSubcategory(Subcategories subcategory) {

      if (selectedSubcategories.contains(subcategory)) {
        selectedSubcategories.remove(subcategory);
      } else {
        selectedSubcategories.add(subcategory);
      }
      notifyListeners();

  }
  ///NETWORK CHECK
   checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    print("Manually Checked Network Status: ${connectivityResult}");
  }

  ///fav
    List<int> favoriteProducts = [];
  Future togglefav(int? productId,context)
  async {
    final pref=await SharedPreferences.getInstance();
    final favourites=pref.getStringList("favouriteskey")??[];
    if(favourites.contains(productId.toString()))
      {
        print("remove");
        favourites.remove(productId.toString());
        Provider.of<ApiProvider>(context,listen: false).Addtowishlist(context,Provider.of<RememberMeProvider>(context,listen: false).uid,productId);
      ///todocontinuehere
        //Provider.of<RememberMeProvider>(context,listen: false).loadlengths();
      } else
    {
      favourites.add(productId.toString());
      Provider.of<ApiProvider>(context,listen: false).Addtowishlist(context,Provider.of<RememberMeProvider>(context,listen: false).uid,productId);

    }
    print("togglefav$favourites");
   await pref.setStringList("favouriteskey", favourites);
      notifyListeners();

  }
 Future<List<int>> getfavouritesid()
  async {
    final pref=await SharedPreferences.getInstance();
   final favouritesid=pref.getStringList("favouriteskey")??[];
   final newfavids=<int>[];

   for(var id in favouritesid)
     {
       newfavids.add(int.parse(id));
     }
    notifyListeners();
    print("getfavid$favouritesid");

    return newfavids;
  }
///scrolling animation

  // double _scrollOffset = 0.0;
  // bool _isCardExpanded = true;
  //
  // double get scrollOffset => _scrollOffset;
  // bool get isCardExpanded => _isCardExpanded;
  //
  // set scrollOffset(double offset) {
  //   _scrollOffset = offset;
  //   _isCardExpanded = offset <= 100; // Adjust the threshold as needed
  //   notifyListeners();
  // }

  //
  double _scrollOffset = 14.0;
  double _scrollOffset2 = 0.0;
  double newPosition=10;
  double reversedValue=200;
  double reversedValuePadding=100;
  double get scrollOffset => _scrollOffset;
  double get scrollOffset2 => _scrollOffset2;

  set scrollOffset(double offset) {
    _scrollOffset = offset;
    newPosition = calculateNewPosition( scrollOffset);

    // Print the current scroll offset and the calculated position
    // print("Scroll Offset: ${ Provider.of<MethodsProvider>(context, listen: false).scrollOffset}, New Position: $newPosition");
    // Calculate reversed value from 200 to 100
    reversedValue = 200.0 -  scrollOffset;
   // reversedValuePadding = 100.0 -  scrollOffset2;

    notifyListeners();
  }
  set scrollOffset2(double offset) {
    _scrollOffset2 = offset;
    reversedValuePadding = 110.0 -  scrollOffset2;

    notifyListeners();
  }
  double calculateNewPosition(double scrollOffset) {
    // Your logic to determine the new position based on scrolling
    // Replace this with your own calculations
    notifyListeners();// Adjust as needed
    return scrollOffset*2;
  }
///

  ImageProvider<Object>? ImageType() {
    ImageProvider<Object>? backgroundImage;

    final remembermeprovider = Provider.of<RememberMeProvider>(context, listen: false);
    if (remembermeprovider.profileImage.startsWith('http')) {
      backgroundImage = NetworkImage('${remembermeprovider.profileImage}');
      return backgroundImage;
    } else if (remembermeprovider.profileImage == 'null') {
      backgroundImage = AssetImage("asset/user.png");
      return backgroundImage;
    }
    else {
      backgroundImage = FileImage(File(remembermeprovider.profileImage));
      return backgroundImage;
    }
}

     Future<String?> getDeviceToken()
      async {
        String? deviceToken;
        FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

        await _firebaseMessaging.getToken().then((String? token) {
          deviceToken=token;

          // Send this token to your server or save it locally for future use.
        });
        return deviceToken;
      }
}