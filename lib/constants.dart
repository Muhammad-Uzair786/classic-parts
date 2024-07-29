import 'dart:ui';

import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CustomColor
{

  static  Color TextGreyColor=Color(0xffCBCBCB);
  static  Color TextFieldColor=Color(0xffF8F8F8);
  static  Color BlackColor=Colors.black;
  static  Color WhiteColor=Colors.white;
  static  Color DarkBlueColor=Color(0xff2e286e);
  static  Color BlueColor=Color(0xff2799d5);
  static  Color YellowColor=Colors.yellow;
  static  Color GreenAccentColor=Colors.greenAccent;
  static  Color LightGreenAccentColor=Colors.lightGreenAccent;
  static  Color RedColor=Colors.redAccent;
  static  TextStyle StyleWhitenormal=TextStyle(color: CustomColor.WhiteColor);
  static  TextStyle StyleWhitebold=TextStyle(color: CustomColor.WhiteColor,fontWeight: FontWeight.bold);
  static  TextStyle StyleBlacknormal=TextStyle(color: CustomColor.BlackColor);
  static  TextStyle StyleBlackbold=TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold);
  static  Gradient GradientColor =LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
  colors: [Color(0xff2e286e), Color(0xff2799d5)], // Replace with your desired colors
  );
  static  Gradient WhiteGradientColor =LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    colors: [Colors.lightBlue[50]!, Colors.lightBlue[50]!], // Replace with your desired colors
  );
}
class ApiEndPoints
{
  static const String BaseUri='https://ecommerce.classicgroup.org/';
  static const String LoginUri='';
  static const String RegisterUri='';
  static const String LogoutUri='api/auth/logout';
  static const String AllProductUri='api/auth/products';
  static const String PopularProductsUri='api/auth/popular/products';
  static const String CategoryUri='api/auth/category';
  static const String SubCategoryargUri='api/auth/subcategory/';
  static const String SubCategoryProductsargUri='api/auth/subcategory/';
  static const String AddDeleteWishlistProductargUri='api/auth/favourite/products/';
  static const String viewWishlistProductUri='api/auth/user/favourite/products';
  static const String BannerUri='api/auth/banners';
  static const String ContactUsUri='api/auth/contactus';
  static const String ProductDetailargUri='api/auth/product/detail/';
  static const String QrRedeemargUri='api/auth/redeem/qrcode/';
  static const String ProductPriceListUri='api/auth/products/listing';
  static const String SearchProductargUri='api/auth/search/product/';
  static const String UpdateAddressargUri='api/auth/update/address/';
  static const String PlaceOrderUri='api/auth/place/order';
  static const String CancelOrderargUri='api/auth/cencel/order/';
  static const String SendCashargUri='api/auth/transaction/';
  static const String WithdrawCashUri='api/auth/encashment';
  static const String TransactionsHistoryUri='api/auth/user/transactions';
  static const String WithdrawalHistoryUri='api/auth/encashment';
  static const String PendingActiveOrdersUri='api/auth/pending/active/orders';
  static const String HistoryOrdersUri='api/auth/completed/rejected/orders';
  static const String OrderDetailorgUri='api/auth/order/detail/';

  static const String VerifyUserargUri='api/verify/user/';
  static const String CreateNewPasswordUri='api/forget/password';
  static const String UploadProfileImageUri='api/auth/user/profilepicture';
  static const String UpdateUserInfoUri='api/auth/edit/user';
  static const String UserInfoUri='api/auth/user/info';
  static const String PointsProductUri='api/auth/points/product';

}
