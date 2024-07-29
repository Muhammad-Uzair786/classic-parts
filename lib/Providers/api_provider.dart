import 'dart:convert';
import 'dart:io';

import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
import 'package:com.classic.classicparts/Providers/cart_provider.dart';
import 'package:com.classic.classicparts/Providers/translation_provider.dart';
import 'package:com.classic.classicparts/constants.dart';
import 'package:com.classic.classicparts/models/product_price_list_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/all_product_model.dart' as all;
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/banners_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/category_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/encashments_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/points_product_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/popular_product_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/product_detail_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/sub_category_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/transactions_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/user_info_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/wishlist_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/SettingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http ;
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Auth/login_screen.dart';
import '../separateAppfiles/ApiModels/all_product_model.dart';
import '../separateAppfiles/ApiModels/search_model.dart';
import '../separateAppfiles/ApiModels/sub_category_products_model.dart';
import '../separateAppfiles/OrderSetion/ordertabs/order_tabs_screen.dart';
import 'methods_provider.dart';
import 'notification_provider.dart';
class ApiProvider extends ChangeNotifier
{
  bool isloggedout=false;

  Future<AllProductModel> fetchProducts(context) async {
    try {
      final response = await http.get(
          Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.AllProductUri),
          headers: {
            'Authorization': 'Bearer ${Provider
                .of<RememberMeProvider>(context, listen: false)
                .authtoken}',
            // Assuming Bearer token authentication
            'Content-Type': 'application/json',
            // Add other headers as needed
          });
      final jsonResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        Provider.of<TranslationProvider>(context,listen: false).saveproductsList(all.AllProductModel.fromJson(jsonResponse));

        return all.AllProductModel.fromJson(jsonResponse);
      } else {
        //return all.AllProductModel(products: [all.Products.defaultProduct()]);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content:  Text('${jsonResponse['error']}'),
        //     action: SnackBarAction(
        //       onPressed: () {
        //         //if action button is pressed
        //       },
        //       label: 'Close',
        //     ),
        //   ),
        // );
        // print(response.body);
        throw Exception('Failed to load products');
      }
    }catch(e){
      return all.AllProductModel(products: [all.Products.defaultProduct()]);
    }
  }
///popular products
  Future<PopularProductsModel?> fetchPopularProducts(context) async {
    try {
      final response = await http.get(
          Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.PopularProductsUri),
          headers: {
            'Authorization': 'Bearer ${Provider
                .of<RememberMeProvider>(context, listen: false)
                .authtoken}',
            // Assuming Bearer token authentication
            'Content-Type': 'application/json',
            // Add other headers as needed
          });
      final jsonResponse = json.decode(response.body);

      if (response.statusCode == 200) {
       // Provider.of<TranslationProvider>(context,listen: false).saveproductsList(PopularProductsModel.fromJson(jsonResponse));

        return PopularProductsModel.fromJson(jsonResponse);
      } else {
        //return all.AllProductModel(products: [all.Products.defaultProduct()]);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content:  Text('${jsonResponse['error']}'),
        //     action: SnackBarAction(
        //       onPressed: () {
        //         //if action button is pressed
        //       },
        //       label: 'Close',
        //     ),
        //   ),
        // );
        // print(response.body);
        throw Exception('Failed to load products');
      }
    }catch(e){
     return null;

    }
  }

  Future fetchLogoutApi(String authtoken,context)
  async {
  try {
    http.Response logoutresponse = await http.post(
      headers: {
        'Authorization': 'Bearer $authtoken',
        // Assuming Bearer token authentication
        'Content-Type': 'application/json',
        // Add other headers as needed
      },
      Uri.parse('${ApiEndPoints.BaseUri + ApiEndPoints.LogoutUri}'),);
    if (logoutresponse.statusCode == 200 && authtoken.isNotEmpty) {
      return jsonDecode(logoutresponse.body);
    } else if (authtoken.isEmpty) {
      return "tokenerror";
    }
  }catch(e)
    {

      ScaffoldMessenger.of(context).showSnackBar(snackbar(text: "check your internet connectivity"),);
    }

  }




  ///category Api
 // final List<Map<String, dynamic>> categorlist = [];
  Future<CategoryModel> fetchCategory(context) async {
    print("AAAAAAAAAaaaaaa");

    final response = await http.get(Uri.parse(ApiEndPoints.BaseUri+ApiEndPoints.CategoryUri),
      headers :{
        'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context,listen: false).authtoken}',
        'Content-Type': 'application/json', // Set the content type to JSON
        },
    );
    final jsonResponse = json.decode(response.body);
    print("inside method{$jsonResponse}");

    if (response.statusCode == 200) {
    print("category json response${jsonResponse}");
    print("category json response${CategoryModel.fromJson(jsonResponse).categories?.map((e) => e.name)}");
   /// why this not working as expected not needed anymore
    // for(Map<String,dynamic> i in jsonResponse['categories']){
    //   categorlist.add(i);
    //   print('check$i');
    // }
      Provider.of<TranslationProvider>(context,listen: false).saveCategoryList(CategoryModel.fromJson(jsonResponse));
    return CategoryModel.fromJson(jsonResponse);
    } else {
      print("json error response{$jsonResponse}");

      return CategoryModel.fromJson(jsonResponse);
      // throw Exception('Failed to load products');
    }
  }

  ///sub_category


  Future<SubCategoryModel> fetchsubCategory(context, categoryId,) async {
    print("AAAAAAAAAaaaaaa");

    final response = await http.get(Uri.parse('${ApiEndPoints.BaseUri+ApiEndPoints.SubCategoryargUri+'$categoryId'}'),
      headers :{
        'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context,listen: false).authtoken}',
        'Content-Type': 'application/json', // Set the content type to JSON
      },

    );
    final jsonResponse = json.decode(response.body);
    print("inside method{$jsonResponse}");

    if (response.statusCode == 200) {
      print("json response{$jsonResponse}");

      return SubCategoryModel.fromJson(jsonResponse);
    }
    return SubCategoryModel.fromJson(jsonResponse);
  }
///sub category products
  Future<SubCategoryProductsModel> fetchsubCategoryproducts(context, categoryId,) async {
    print("AAAAAAAAAaaaaaa");

    final response = await http.get(Uri.parse('${ApiEndPoints.BaseUri+ApiEndPoints.SubCategoryProductsargUri+'$categoryId/products'}'),
      headers :{
        'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context,listen: false).authtoken}',
        'Content-Type': 'application/json', // Set the content type to JSON
      },

    );
    final jsonResponse = json.decode(response.body);
    print("inside method{$jsonResponse}");

    if (response.statusCode == 200) {
      print("json response{$jsonResponse}");

      return SubCategoryProductsModel.fromJson(jsonResponse);
    }
    return SubCategoryProductsModel.fromJson(jsonResponse);
  }


  ///fetch wishlist products

  /// add/del wishlist
  Future Addtowishlist(context,uid,pid) async {
    print("AAAAAAAAAaaaaaa");
///tododynamic id
    final response = await http.get(Uri.parse(ApiEndPoints.BaseUri+ApiEndPoints.AddDeleteWishlistProductargUri+'$uid/$pid'),
      headers :{
        'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context,listen: false).authtoken}',
        'Content-Type': 'application/json', // Set the content type to JSON
      },
    );
    final jsonResponse = json.decode(response.body);
    print("inside method{$jsonResponse}");

    if (response.statusCode == 200) {
      print("json response{$jsonResponse}");

    } else {
      print("json error response{$jsonResponse}");

      // throw Exception('Failed to load products');
    }
  }

///fetchwishlist
  Future<WishlistModel> fetchwishlist(context) async {
    print("AAAAAAAAAaaaaaa");
    ///tododynamic id
    final response = await http.get(Uri.parse(ApiEndPoints.BaseUri+ApiEndPoints.viewWishlistProductUri),
      headers :{
        'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context,listen: false).authtoken}',
        'Content-Type': 'application/json', // Set the content type to JSON
      },
    );
    final jsonResponse = json.decode(response.body);
    print("inside method{$jsonResponse}");
    if (response.statusCode == 200) {

      print("json response{$jsonResponse}");
    return WishlistModel.fromJson(jsonResponse);
    } else {
      print("json error response{$jsonResponse}");
     return WishlistModel.fromJson(jsonResponse);
      //throw Exception('Failed to load products');
    }
  }

/// banner
  Future<BannersModel> fetchbanner(context,) async {
    print("AAAAAAAAAaaaaaa");
    ///tododynamic id
    final response = await http.get(Uri.parse(ApiEndPoints.BaseUri+ApiEndPoints.BannerUri),
      headers :{
        'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context,listen: false).authtoken}',
        'Content-Type': 'application/json',
// Set the content type to JSON
      },
    );
    final jsonResponse = json.decode(response.body);
    print("inside method{$jsonResponse}");
    if (response.statusCode == 200) {

      print("json response{$jsonResponse}");
      return BannersModel.fromJson(jsonResponse);
    } else {
      print("json error response{$jsonResponse}");
      return jsonResponse;
      //throw Exception('Failed to load products');
    }
  }
///product detail
  Future<ProductDetailModel> fetchProductDetail(context,product_id) async {
    print("AAAAAAAAAaaaaaa");
    ///tododynamic id
    final response = await http.get(Uri.parse(ApiEndPoints.BaseUri+ApiEndPoints.ProductDetailargUri+'$product_id'),
      headers :{
        'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context,listen: false).authtoken}',
        'Content-Type': 'application/json', // Set the content type to JSON
      },
    );
    final jsonResponse = json.decode(response.body);
    print("inside method product detail{$jsonResponse}");
    if (response.statusCode == 200) {

      print("json response product detail{$jsonResponse}");
      return ProductDetailModel.fromJson(jsonResponse);
    } else {
      print("json error response product detail{$jsonResponse}");
      return jsonResponse;
      //throw Exception('Failed to load products');
    }
  }

  ///productApi
  fetchRedeemPoints(context,credit,qrcodekey,int type) async {
print("type$type");
    ///tododynamic id
try {
  final response = await http.get(Uri.parse(
      ApiEndPoints.BaseUri + ApiEndPoints.QrRedeemargUri +
          "$qrcodekey/$credit/$type/${Provider
              .of<RememberMeProvider>(context, listen: false).address}"),
    headers: {
      'Authorization': 'Bearer ${Provider
          .of<RememberMeProvider>(context, listen: false)
          .authtoken}',
      'Content-Type': 'application/json', // Set the content type to JSON
    },
  );
  print(response.body);
  final jsonResponse = json.decode(response.body);
  print("inside method{$jsonResponse}");
  if (response.statusCode == 200) {
    print("qr json response{$jsonResponse}");
    ScaffoldMessenger.of(context).showSnackBar(
        snackbar(text: jsonResponse['message']));
    await Provider.of<ApiProvider>(context, listen: false).getUserInfo(context);
  }else
    {
      throw Exception();
    }
}catch(e)
    {

      ScaffoldMessenger.of(context).showSnackBar(
        snackbar(text: "Your Qr Code expired"),);
    }
  }


  SnackBar snackbar({final text})
  {
    return SnackBar(content: Text('$text'));
  }



  ///fetchpricelist
  List staticlist = [];
  List filteredList = [];

  Future<ProductPriceListModel> fetchproductpricelist(context) async {
    final response = await http.get(Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.ProductPriceListUri),
      headers: {
        'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context, listen: false).authtoken}',
        'Content-Type': 'application/json', // Set the content type to JSON
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
     staticlist= jsonResponse['products'];
     filteredList=staticlist;


     // print("jsonlist----$staticlist");
      print("staticlist----$staticlist");

      notifyListeners();

      return ProductPriceListModel.fromJson(jsonResponse);
    } else {
      // Handle error here
      throw Exception('Failed to load products');
    }
  }


  Future<SearchModel> fetchsearchproduct(context,productName) async {
    print("AAAAAAAAAaaaaaa");
    ///tododynamic id
    final response = await http.get(Uri.parse(ApiEndPoints.BaseUri+ApiEndPoints.SearchProductargUri+'$productName'),
      headers :{
        'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context,listen: false).authtoken}',
        'Content-Type': 'application/json', // Set the content type to JSON
      },
    );
    final jsonResponse = json.decode(response.body);
    print("inside method search{$jsonResponse}");
    if (response.statusCode == 200) {

      print("json response search{$jsonResponse}");
      return SearchModel.fromJson(jsonResponse);
    } else {
      print("json error response search{$jsonResponse}");
      return jsonResponse;
      //throw Exception('Failed to load products');
    }
  }


///update Address
  Future updateaddress(context,String address)
  async {
    try {
      http.Response addressresponse = await http.get(Uri.parse('${ApiEndPoints.BaseUri + ApiEndPoints.UpdateAddressargUri+'$address'}'),
        headers: {
          'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context,listen: false).authtoken}',
          // Assuming Bearer token authentication
          'Content-Type': 'application/json',
          // Add other headers as needed
        },
        );
      if (addressresponse.statusCode == 200 && Provider.of<RememberMeProvider>(context,listen: false).authtoken.isNotEmpty) {
        print('status$addressresponse');
        return json.decode(addressresponse.body);
      } else if (Provider.of<RememberMeProvider>(context).authtoken.isEmpty) {
        print('statusfail$addressresponse');

        return "tokenerror";
      }
    }catch(e)
    {

      ScaffoldMessenger.of(context).showSnackBar(snackbar(text: "check your internet connectivity"),);
    }

  }
///placeorder api

  Future<void> PlaceOrderApi(context,double totalPoints) async {
    showLoadingIndicator(context);

    print("points----$totalPoints");
    final apiUrl = "${ApiEndPoints.BaseUri+ApiEndPoints.PlaceOrderUri}"; // Replace with your API URL
    // Define the data in the specified format
    final data = {"points":"${totalPoints}",
      "products": Provider.of<CartProvider>(context,listen: false).cartdetail
      // [
      //   {"product_id": 10, "quantity": 5},
      //   {"product_id": 14, "quantity": 3},
      //   {"product_id": 13, "quantity": 2}
      // ]
    };
    // Encode the data as JSON
    final jsonData = jsonEncode(data);

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context,listen: false).authtoken}',
          'Content-Type': 'application/json', // Set the content type to JSON
        },
        body: jsonData,
      );
      final decodedresponse=jsonDecode(response.body);

      if (response.statusCode == 200) {

        // Request was successful, you can handle the response here
        print('Response: ${response.body}');
        print('Response: ${decodedresponse}');
        await Provider.of<ApiProvider>(context, listen: false).getUserInfo(context);
        Provider.of<CartProvider>(context,listen: false).clearCartItems();
        Provider.of<CartProvider>(context,listen: false).clearAllcounts();
        Navigator.of(context).pop();

        var snackBar = SnackBar(content: Text('${decodedresponse['message']}'),backgroundColor: Colors.blue,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar,);



        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OrderTabScreen()));
        // Provider.of<RememberMeProvider>(context,listen: false).saveCardItems(phoneNumber, password, authtoken, uid);
      } else {
        Navigator.of(context).pop();

        // Request failed, handle the error
        print('Request failed with status: ${response.statusCode}');
        print('Response: ${response.body}');
        var snackBar = SnackBar(content: Text('${decodedresponse['error']}'),backgroundColor: Colors.blue,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar,);
      }
    } catch (e) {
      Navigator.of(context).pop();

      // Handle any exceptions that occur during the request
      print('Error:');
      var snackBar = SnackBar(content: Text("You can't place Order right now,try again"),backgroundColor: Colors.blue,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar,);
    }
  }
///
  Future<void> CancelOrderApi(context,trackingId) async {
    print("incanceltrakingid----$trackingId");
    final apiUrl = "${ApiEndPoints.BaseUri+ApiEndPoints.CancelOrderargUri+trackingId}"; // Replace with your API URL


    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Authorization': 'Bearer ${Provider.of<RememberMeProvider>(context,listen: false).authtoken}',
          'Content-Type': 'application/json', // Set the content type to JSON
        },
      );
      print('beforecancelResponse:url.....$apiUrl');

      final decodedresponse=jsonDecode(response.body);
      print('aftercanceldecodedResponse: ${decodedresponse}');

      if (response.statusCode == 200) {
        // Request was successful, you can handle the response here
        print('cancelResponse: ${response.body}');
        print('canceldecodedResponse: ${decodedresponse}');

        var snackBar = SnackBar(content: Text('${decodedresponse[1]}'),backgroundColor: Colors.blue,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar,);
        print('cancelsnack: ${decodedresponse}');

        // Provider.of<RememberMeProvider>(context,listen: false).saveCardItems(phoneNumber, password, authtoken, uid);
      } else {
        // Request failed, handle the error
        print('Request failed with status: ${response.statusCode}');
        print('Response: ${response.body}');
        var snackBar = SnackBar(content: Text('${decodedresponse['error']}'),backgroundColor: Colors.blue,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar,);
      }
    } catch (e) {
      // Handle any exceptions that occur during the request
      print('Error:${e.toString()}');
      var snackBar = SnackBar(content: Text("You can't place Order right now,try again"),backgroundColor: Colors.blue,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar,);
    }
  }


  ///cashtransfer api
 SendCash(context, String amount, String mobileNumber, String note) async {
   final rememberProvider=Provider.of<RememberMeProvider>(context, listen: false);
    try {
      final response = await http.get(
          Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.SendCashargUri+"$amount/$mobileNumber/${note}"),
          headers: {
            'Authorization': 'Bearer ${rememberProvider
                .authtoken}',
            // Assuming Bearer token authentication
            'Content-Type': 'application/json',
            // Add other headers as needed
          });
      print('note.......$note');

      final jsonResponse = json.decode(response.body);
      print('cash$jsonResponse');

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:  Text('${jsonResponse['message']}'),
            action: SnackBarAction(
              onPressed: () {
                //if action button is pressed
              },
              label: 'Close',
            ),
          ),
        );
        await getUserInfo(context);
      } else {
        //return all.AllProductModel(products: [all.Products.defaultProduct()]);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:  Text('${jsonResponse['error']}'),
            action: SnackBarAction(
              onPressed: () {
                //if action button is pressed
              },
              label: 'Close',
            ),
          ),
        );
        // print(response.body);
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:  Text('Unable to proceed'),
        ),
      );
    }
  }

///Transactions History
  Future<Iterable<Transactions>?> TransactionHistory(context,) async {

      final response = await http.get(
          Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.TransactionsHistoryUri),
          headers: {
            'Authorization': 'Bearer ${Provider
                .of<RememberMeProvider>(context, listen: false)
                .authtoken}',
            // Assuming Bearer token authentication
            'Content-Type': 'application/json',
            // Add other headers as needed
          });
      print('beforeTransaction$response');

      final jsonResponse = json.decode(response.body);
      print('afterTransaction$response');
      print('afterTransaction$jsonResponse');

      if (response.statusCode == 200) {
        print("transactiontrue${TransactionsModel.fromJson(jsonResponse).transactions?.reversed.toList()}");
        return TransactionsModel.fromJson(jsonResponse).transactions?.reversed.toList();

      } else {

        return TransactionsModel.fromJson(jsonResponse).transactions?.reversed.toList();

        // print(response.body);
      }
  }
///WithdrawalHistory
  Future<EncashmentsModel> WithdrawalHistory(context,) async {

    final response = await http.get(
        Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.WithdrawalHistoryUri),
        headers: {
          'Authorization': 'Bearer ${Provider
              .of<RememberMeProvider>(context, listen: false)
              .authtoken}',
          // Assuming Bearer token authentication
          'Content-Type': 'application/json',
          // Add other headers as needed
        });
    print('beforeTransaction${response.body}');

    final jsonResponse = json.decode(response.body);
    print('afterTransaction${response.body}');

    if (response.statusCode == 200) {
      print("transactiontrue");
      return EncashmentsModel.fromJson(jsonResponse);

    } else {

      return EncashmentsModel.fromJson(jsonResponse);

      // print(response.body);
    }
  }

  ///VerifyUser
 Future<bool> veifyUser(final phone)
  async {
    try {
      http.Response response = await http.get(
          Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.VerifyUserargUri+phone));
      if (response.statusCode == 200) {
        print("verify true");

        return true;

      } else {
        print("else");

        return false;

      }
    }catch(e)
    {
      print("else");

      return false;
    }
  }

  Future<bool> createNewPassword(String phone,String newpassword,String confirmpassword)
  async {
    var mapvalue=  {
      "phone_number":"$phone",
      "new_password":"$newpassword",
      "new_password_confirmation":"$confirmpassword"
    };
    print("$phone $newpassword $confirmpassword}");
    try {
      http.Response response = await http.post(
          Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.CreateNewPasswordUri),
      body: jsonEncode(mapvalue),
         headers: {
    'Content-Type': 'application/json',
    // Add other headers as needed
    }
      );

      if (response.statusCode == 200) {
        print("password true");

        return true;

      } else {
        print("else not");

        return false;

      }
    }catch(e)
    {
      print("else not");

      return false;
    }
  }

   profileImageUpload(String base64image,context)
  async {
    try {
      http.Response response = await http.post(
          Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.UploadProfileImageUri),
          body:jsonEncode( {
            "image":"$base64image"
          }),
          headers: {
            'Authorization': 'Bearer ${Provider
                .of<RememberMeProvider>(context, listen: false)
                .authtoken}',
            'Content-Type': 'application/json',
            // Add other headers as needed
          }
      );
       final decodedresponse=jsonDecode(response.body);
       print("res$decodedresponse");
      if (response.statusCode == 200) {
        var snackBar = SnackBar(content: Text('${decodedresponse['message']}'),backgroundColor: Colors.blue,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar,);
      print("uploaded sucess");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackbar(text: "${decodedresponse['error']}"),);

        print("uploaded fail");


      }
    }catch(e)
    {
      print("uploaded fail");

      ScaffoldMessenger.of(context).showSnackBar(snackbar(text: "Try Again"),);

    }
  }
  ///
     File? image;
    final picker = ImagePicker();
  void pickImage(context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);


    if (pickedFile != null) {
      image = File(pickedFile.path);
      final imageBytes = image?.readAsBytesSync();
      String base64String = base64Encode(imageBytes!);

      print('Base64-encoded image: $base64String');
      print('image: $image  uiuiyui${image?.path}');
      await Provider.of<ApiProvider>(context,listen: false).profileImageUpload(base64String, context);
      print("after");
    } else {
      print('No image selected.');
    }
      notifyListeners();
  }
  String? base64String;

  void pickSignupImage(context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);


    if (pickedFile != null) {
      image = File(pickedFile.path);
      final imageBytes = image?.readAsBytesSync();
       base64String = base64Encode(imageBytes!);

      print('Base64-encoded image: $base64String');
      print('image: $image  uiuiyui${image?.path}');

    } else {
      print('No image selected.');
    }
    notifyListeners();
  }
  ///user fields
  updateUserInfo(String name,String phone,String address,context)
  async {
    final remeberprovider=Provider.of<RememberMeProvider>(context,listen: false);
    try {
      http.Response response = await http.post(
          Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.UpdateUserInfoUri),
          body:jsonEncode( {
            "name":"$name",
            "phone":"$phone",
            "address":"$address"
          }),
          headers: {
            'Authorization': 'Bearer ${Provider
                .of<RememberMeProvider>(context, listen: false)
                .authtoken}',
            'Content-Type': 'application/json',
            // Add other headers as needed
          }
      );
      final decodedresponse=jsonDecode(response.body);
      print("res$decodedresponse");
      if (response.statusCode == 200) {
        var snackBar = SnackBar(content: Text('${decodedresponse['message']}'),backgroundColor: Colors.blue,);
        ScaffoldMessenger.of(context).showSnackBar(snackBar,);
        String? deviceToken=await Provider.of<MethodsProvider>(context,listen: false).getDeviceToken();

        await remeberprovider.saveUserData(name,remeberprovider.userRoleIndex, address,phone, remeberprovider.password, remeberprovider.authtoken, remeberprovider.uid,image?.path??'null',deviceToken.toString(),remeberprovider.userCredit,remeberprovider.userPoints);
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SettingScreen()));
        print("uploaded sucess");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackbar(text: "${decodedresponse['error']}"),);

        print("uploaded fail");


      }
    }catch(e)
    {
      print("uploaded fail");

      ScaffoldMessenger.of(context).showSnackBar(snackbar(text: "Try Again"),);

    }
  }



  ///points product
  Future<PointsProductModel> PointsProduct(context,) async {

    final response = await http.get(
        Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.PointsProductUri),
        headers: {
          'Authorization': 'Bearer ${Provider
              .of<RememberMeProvider>(context, listen: false)
              .authtoken}',
          // Assuming Bearer token authentication
          'Content-Type': 'application/json',
          // Add other headers as needed
        });
    final jsonResponse = json.decode(response.body);
    print('points$jsonResponse');

    if (response.statusCode == 200) {
      print('points${PointsProductModel.fromJson(jsonResponse)}');
      return PointsProductModel.fromJson(jsonResponse);

    } else {

      return PointsProductModel.fromJson(jsonResponse);

      // print(response.body);
    }
  }


  ///userinfo product
  Future<UserInfoModel> getUserInfo(context,) async {

    final response = await http.get(
        Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.UserInfoUri),
        headers: {
          'Authorization': 'Bearer ${Provider
              .of<RememberMeProvider>(context, listen: false)
              .authtoken}',
          // Assuming Bearer token authentication
          'Content-Type': 'application/json',
          // Add other headers as needed
        });
    final jsonResponse = json.decode(response.body);
    print('userinfo$jsonResponse');
    final remeberprovider=Provider.of<RememberMeProvider>(context,listen: false);

    if (response.statusCode == 200) {
      print('userinfo${UserInfoModel.fromJson(jsonResponse)}');
      print('userinfo${UserInfoModel.fromJson(jsonResponse).userinfo?.userPoints}');
      final userInfoModelValue=UserInfoModel.fromJson(jsonResponse).userinfo;
      await Provider.of<RememberMeProvider>(context,listen: false).saveUserData(userInfoModelValue!.name.toString(),userInfoModelValue!.role.toString(), userInfoModelValue.address.toString(), userInfoModelValue!.phone.toString(), remeberprovider.password, remeberprovider.authtoken, remeberprovider.uid, userInfoModelValue.imagePath.toString(), userInfoModelValue.deviceToken.toString(), userInfoModelValue.userCredit.toString(), userInfoModelValue.userPoints.toString());
      print("userinfo1success");

      return UserInfoModel.fromJson(jsonResponse);

    } else {

      return UserInfoModel.fromJson(jsonResponse);

      // print(response.body);
    }
  }
  ///cloneabve
  Future<UserInfoModel> getUserInfo2() async {
    RememberMeProvider? authProvider = ServiceLocator.authProvider;
    await authProvider?.loadRememberMe();
    final response = await get(
        Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.UserInfoUri),
        headers: {
          'Authorization': 'Bearer ${authProvider
              ?.authtoken}',
          // Assuming Bearer token authentication
          'Content-Type': 'application/json',
          // Add other headers as needed
        });
    final jsonResponse = json.decode(response.body);
    print('userinfo$jsonResponse');
    final remeberprovider=authProvider;

    if (response.statusCode == 200) {
      print('userinfo${UserInfoModel.fromJson(jsonResponse)}');
      print('userinfo${UserInfoModel.fromJson(jsonResponse).userinfo?.userPoints}');
      final userInfoModelValue=UserInfoModel.fromJson(jsonResponse).userinfo;
      await authProvider?.saveUserData(userInfoModelValue!.name.toString(),userInfoModelValue.role.toString(), userInfoModelValue.address.toString(), userInfoModelValue!.phone.toString(), remeberprovider!.password, remeberprovider.authtoken, remeberprovider.uid, userInfoModelValue.imagePath.toString(), userInfoModelValue.deviceToken.toString(), userInfoModelValue.userCredit.toString(), userInfoModelValue.userPoints.toString());
      print("userinfo2success");
      return UserInfoModel.fromJson(jsonResponse);

    } else {

      return UserInfoModel.fromJson(jsonResponse);

      // print(response.body);
    }
  }

  ///clone
  ///cashtransfer api
  WithdrawRequest(context,String AccountTitle,String mobileNumber,String AccountType,String amount, ) async {
    try {
      Map withdrawbody={
        "account_name":"$AccountTitle",
        "phone":"$mobileNumber",
        "bank": "$AccountType",
        "amount": "$amount",

      };

      final response = await http.post(
          Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.WithdrawCashUri),
          headers: {
            'Authorization': 'Bearer ${Provider
                .of<RememberMeProvider>(context, listen: false)
                .authtoken}',
            // Assuming Bearer token authentication
            'Content-Type': 'application/json',
            // Add other headers as needed
          },
        body: jsonEncode(withdrawbody)
          );
      final jsonResponse = json.decode(response.body);
      print('cash$jsonResponse');

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:  Text('${jsonResponse['message']}'),
            action: SnackBarAction(
              onPressed: () {
                //if action button is pressed
              },
              label: 'Close',
            ),
          ),
        );
        await getUserInfo(context);

      } else {
        //return all.AllProductModel(products: [all.Products.defaultProduct()]);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:  Text('${jsonResponse['error']}'),
            action: SnackBarAction(
              onPressed: () {
                //if action button is pressed
              },
              label: 'Close',
            ),
          ),
        );
        // print(response.body);
      }
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:  Text('Unable to proceed'),
        ),
      );
    }
  }


///Contact us
  Future<bool> ContactUsApi({required String name,required String email,required String phone,required String message,context})
  async {
    var mapvalue=  {
      "name":"$name",
      "email":"$email",
      "phone":"$phone",
      "message":"$message"
    };
    try {
      http.Response response = await http.post(
          Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.ContactUsUri),
          body: jsonEncode(mapvalue),
          headers: {
            'Authorization': 'Bearer ${Provider
                .of<RememberMeProvider>(context, listen: false)
                .authtoken}',
            'Content-Type': 'application/json',
            // Add other headers as needed

          }
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted Form")));


        return true;

      } else {
        print("else not${response.body}");

        return false;

      }
    }catch(e)
    {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Currently you can't submit form${e.toString()}")));
      return false;
    }
  }

///

  ///payfast

   payfastRequest(context) async {
    try {
      final client = http.Client();

      final response = await client.post(
        Uri.parse('https://sandbox.payfast.co.za/eng/process?testing=true'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'merchant_id': '10031710',
          'merchant_key': '46f0cd694581a',
          'amount': '100.00',
          'item_name': 'Test Product',
        },
      );

      print('Initial Response Status Code: ${response.statusCode}');

      // Check if the response is a redirection
      if (response.statusCode == HttpStatus.movedTemporarily || response.statusCode == HttpStatus.movedPermanently) {
        final redirectUrl = response.headers['location'];
        print('Redirect URL: $redirectUrl');

        // If you want to follow the redirect manually, you can send another request
        final redirectResponse = await client.get(Uri.parse(redirectUrl!));
        print('Final Response Status Code: ${redirectResponse.statusCode}');
        print('Final Response Body: ${redirectResponse.body}');
      } else {
        // Handle the response as usual
        print('Response Body: ${response.body}');
      }

      client.close();
    } catch (e) {
      print("${e.toString()}");
    }
  }


}