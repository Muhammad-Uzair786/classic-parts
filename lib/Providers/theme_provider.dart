import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class ThemeProvider extends ChangeNotifier
{
  bool isDarkMode=false;
  // Convert color to hex string
  String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0')}';
  }

  // Convert hex string to color
  Color hexToColor(String hex) {
    return Color(int.parse(hex.replaceAll('#', ''), radix: 16));
  }

  ThemeProvider(){
    loadcolors();
  }
  loadcolors()
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    CustomColor.TextGreyColor= hexToColor(prefs.getString('textGreyColor') ?? '${colorToHex(Color(0xffCBCBCB))}');
    CustomColor.TextFieldColor= hexToColor(prefs.getString('textFieldColor') ?? '${colorToHex(Color(0xffF8F8F8))}');
    CustomColor.BlackColor= hexToColor(prefs.getString('blackColor') ?? '${colorToHex(Colors.black)}');
    CustomColor.WhiteColor= hexToColor(prefs.getString('whiteColor') ?? '${colorToHex(Colors.white)}');
    CustomColor.DarkBlueColor= hexToColor(prefs.getString('darkBlueColor') ?? '${colorToHex(Color(0xff2e286e))}');
    CustomColor.BlueColor= hexToColor(prefs.getString('blueColor') ?? '${colorToHex(Color(0xff2799d5))}');
     CustomColor.StyleWhitenormal=TextStyle(color: hexToColor(prefs.getString('whiteColor') ?? '${colorToHex(Colors.white)}'));
    CustomColor.StyleWhitebold=TextStyle(color: hexToColor(prefs.getString('blackColor') ?? '${colorToHex(Colors.white)}'),fontWeight: FontWeight.bold);
    CustomColor.StyleBlacknormal=TextStyle(color: hexToColor(prefs.getString('whiteColor') ?? '${colorToHex(Colors.black)}'));
    CustomColor.StyleBlackbold=TextStyle(color: hexToColor(prefs.getString('whiteColor') ?? '${colorToHex(Colors.black)}'),fontWeight: FontWeight.bold);
    CustomColor.GradientColor=LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      colors: [hexToColor(prefs.getString('leftGradienColor') ?? '${colorToHex(Color(0xff2e286e))}'),hexToColor(prefs.getString('rightGradienColor') ?? '${colorToHex(Color(0xff2799d5))}')], // Dark shades for a dark theme
    );

    CustomColor.WhiteGradientColor =LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomCenter,
      colors: [hexToColor(prefs.getString('leftWhiteGradienColor') ?? '${colorToHex(Colors.lightBlue[50]!)}'),hexToColor(prefs.getString('rightWhiteGradienColor') ?? '${colorToHex(Colors.lightBlue[50]!)}')], // Dark shades for a dark theme
    );
    print("loadcolorscalled..................");

  }
  Future<void> switchTheme(bool isDarkMode) async {
 SharedPreferences prefs=await SharedPreferences.getInstance();
    if (isDarkMode) {// Use dark mode colors
      // CustomColor.TextGreyColor=Color(0xffCBCBCB);
      // CustomColor.TextFieldColor=Color(0xffF8F8F8);
      // CustomColor.BlackColor=Colors.white;
      // CustomColor.WhiteColor=Colors.black;
      // CustomColor.DarkBlueColor=Colors.black;
      // CustomColor.BlueColor=Colors.black;
      // CustomColor.StyleWhitenormal=TextStyle(color: CustomColor.BlackColor);
      // CustomColor.StyleWhitebold=TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold);
      // CustomColor.StyleBlacknormal=TextStyle(color: CustomColor.WhiteColor);
      // CustomColor.StyleBlackbold=TextStyle(color: CustomColor.WhiteColor,fontWeight: FontWeight.bold);
      // CustomColor.GradientColor=LinearGradient(
      //   begin: Alignment.topLeft,
      //   end: Alignment.bottomCenter,
      //   colors: [Color(0xff202123), Color(0xff202123)], // Dark shades for a dark theme
      // );
      //
      // CustomColor.WhiteGradientColor =LinearGradient(
      //   begin: Alignment.topLeft,
      //   end: Alignment.bottomCenter,
      //   colors: [Color(0xff202123), Color(0xff202123)], // Dark shades for a dark theme
      // );
      // // CustomColor.WhiteGradientColor =LinearGradient(
      // //   begin: Alignment.topLeft,
      // //   end: Alignment.bottomCenter,
      // //   colors: [Colors.lightBlue[50]!, Colors.lightBlue[50]!], // Replace with your desired colors
      // // );
      ///extra
      // Save dark mode colors to SharedPreferences
      prefs.setString('textGreyColor', colorToHex(Color(0xffCBCBCB)));
      prefs.setString('textFieldColor', colorToHex(Color(0xffF8F8F8)));
      prefs.setString('blackColor', colorToHex(Colors.white));
      prefs.setString('whiteColor', colorToHex(Colors.black));
      prefs.setString('darkBlueColor', colorToHex(Colors.black));
      prefs.setString('blueColor', colorToHex(Colors.black));

      prefs.setString('leftGradienColor', colorToHex(Color(0xff202123)));
      prefs.setString('rightGradienColor', colorToHex(Color(0xff202123)));
      prefs.setString('leftWhiteGradienColor', colorToHex(Color(0xff202123)));
      prefs.setString('rightWhiteGradienColor', colorToHex(Color(0xff202123)));
    } else {
      // Use light mode colors
      // CustomColor.TextGreyColor=Color(0xffCBCBCB);
      // CustomColor.TextFieldColor=Color(0xffF8F8F8);
      // CustomColor.BlackColor=Colors.black;
      // CustomColor.WhiteColor=Colors.white;
      // CustomColor.DarkBlueColor=Color(0xff2e286e);
      // CustomColor.BlueColor=Color(0xff2799d5);
      // CustomColor.StyleWhitenormal=TextStyle(color: CustomColor.WhiteColor);
      // CustomColor.StyleWhitebold=TextStyle(color: CustomColor.WhiteColor,fontWeight: FontWeight.bold);
      // CustomColor.StyleBlacknormal=TextStyle(color: CustomColor.BlackColor);
      // CustomColor.StyleBlackbold=TextStyle(color: CustomColor.BlackColor,fontWeight: FontWeight.bold);
      // CustomColor.GradientColor=LinearGradient(
      //   begin: Alignment.topLeft,
      //   end: Alignment.bottomCenter,
      //   colors: [Color(0xff2e286e), Color(0xff2799d5)], // Replace with your desired colors
      // );
      //   CustomColor.WhiteGradientColor =LinearGradient(
      //   begin: Alignment.topLeft,
      //   end: Alignment.bottomCenter,
      //   colors: [Colors.lightBlue[50]!, Colors.lightBlue[50]!], // Replace with your desired colors
      // );

        ///extra
      // Save light mode colors to SharedPreferences
      prefs.setString('textGreyColor', colorToHex(Color(0xffCBCBCB)));
      prefs.setString('textFieldColor', colorToHex(Color(0xffF8F8F8)));
      prefs.setString('blackColor', colorToHex(Colors.black));
      prefs.setString('whiteColor', colorToHex(Colors.white));
      prefs.setString('darkBlueColor', colorToHex(Color(0xff2e286e)));
      prefs.setString('blueColor', colorToHex(Color(0xff2799d5)));


      prefs.setString('leftGradienColor', colorToHex(Color(0xff2e286e)));
      prefs.setString('rightGradienColor', colorToHex(Color(0xff2799d5)));
      prefs.setString('leftWhiteGradienColor', colorToHex(Colors.lightBlue[50]!));
      prefs.setString('rightWhiteGradienColor', colorToHex(Colors.lightBlue[50]!));
    }
    notifyListeners();
  }

}