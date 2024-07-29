import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Auth/sign_up_Screen.dart';

class RememberMeProvider extends ChangeNotifier {

  bool _rememberMe = true;
  String _userName = '';
  String _userRoleIndex = '';
  String _address = '';
  String _phoneNumber = '';
  String _password = '';
  String _authtoken = '';
  String _deviceToken = '';
  String _uid = '';
  String _profileImage = '';
  String _userCredit = '0';
  String _userPoints = '0';

  bool get rememberMe => _rememberMe;
  String get address => _address;
  String get userName => _userName;
  String get userRoleIndex => _userRoleIndex;
  String get phoneNumber => _phoneNumber;
  String get password => _password;
  String get authtoken => _authtoken;
  String get deviceToken => _deviceToken;
  String get uid => _uid;
  String get profileImage => _profileImage;
  String get userCredit => _userCredit;
  String get userPoints => _userPoints;

  Future<void> loadRememberMe() async {
    final prefs = await SharedPreferences.getInstance();
    _rememberMe = true;//prefs.getBool('rememberMe') ?? false;
    if (_rememberMe) {
      _userName = prefs.getString('saveduserName') ?? '';
      _userRoleIndex = prefs.getString('savedUserRoleIndex') ?? '';
      _address = prefs.getString('savedAddress') ?? '';
      _phoneNumber = prefs.getString('savedPhone') ?? '';
      _password = prefs.getString('savedPassword') ?? '';
      _authtoken = prefs.getString('savedAuthToken') ?? '';
      _deviceToken = prefs.getString('deviceToken') ?? '';
      _uid = prefs.getString('saveduid') ?? '';
      _profileImage = prefs.getString('profileImage') ?? '';
      _userCredit = prefs.getString('userCredit') ?? '0';
      _userPoints = prefs.getString('userPoints') ?? '0';
    }
    notifyListeners();
  }

  Future<void> setRememberMe(bool rememberMe) async {
    _rememberMe = rememberMe;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', rememberMe);
  }

  Future<void> saveUserData(String userName,String userRoleIndex,String address,String phoneNumber, String password,String authtoken,String uid,String profileImage,String deviceToken,String userCredit,String userPoints) async {
    _userName = userName;
    _userRoleIndex = userRoleIndex;
    _address = address;
    _phoneNumber = phoneNumber;
    _password = password;
    _authtoken = authtoken;
    _deviceToken = deviceToken;
    _uid = uid;
    _profileImage = profileImage;
    _userCredit = userCredit;
    _userPoints = userPoints;

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('saveduserName', userName);
    prefs.setString('savedUserRoleIndex', userRoleIndex);
    prefs.setString('savedAddress', address);
    prefs.setString('savedPhone', phoneNumber);
    prefs.setString('savedPassword', password);
    prefs.setString('savedAuthToken', authtoken);
    prefs.setString('saveddeviceToken', deviceToken);
    prefs.setString('saveduid', uid);
    prefs.setString('profileImage', profileImage);
    prefs.setString('userCredit', userCredit);
    prefs.setString('userPoints', userPoints);
    notifyListeners();

  }

  void clearUserData() async {
    _userName = '';
    _userRoleIndex = '';
    _address = '';
    _phoneNumber = '';
    _password = '';
    _authtoken = '';
    _deviceToken = '';
    _uid = '';
    _profileImage = '';
    _userCredit = '0';
    _userPoints = '0';
    setRememberMe(false);
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('saveduserName');
    prefs.remove('savedUserRoleIndex');
    prefs.remove('savedAddress');
    prefs.remove('savedPhone');
    prefs.remove('savedPassword');
    prefs.remove('savedAuthToken');
    prefs.remove('saveddeviceToken');
    prefs.remove('saveduid');
    prefs.remove('profileImage');
    prefs.remove('userCredit');
    prefs.remove('userPoints');
    notifyListeners();
  }


  ///
  Future SignIn(String phone, String password,String deviceToken ,context) async {
    try {
      final response = await post(
        Uri.parse('https://ecommerce.classicgroup.org/api/auth/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'phone': phone,
          'password': password,
          'device_token':deviceToken
        }),
      );

      if (response.statusCode == 200) {

        // Handle successful registration here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Succesfully Logged In'),
          ),
        );

        return jsonDecode(response.body);



      } else if (response.statusCode == 400) {
        final responseData = json.decode(response.body);
        final errorMessages = extractErrorMessages(responseData);

        // Display error messages using a SnackBar
        final errorMessage = errorMessages.isNotEmpty
            ? errorMessages.join('\n')
            : 'Login failed.';

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Your have entered incorrect passord"),
          ),
        );
        return null;
      }else
        {
          print("else.......${response.body}");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("You have not any account with this number"),
            ),
          );
        }
    }

    catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Check your Internet Connectivity'),
        ),
      );
      return null;
    }
  }



  ///saving some other profile data
  String _wishlistlength='';
  String _pendingorderlength='';
  String _orderslength='';
  String get wishlistlength=>_wishlistlength;
  String get pendingorderlength=>_pendingorderlength;
  String get orderslength=>_orderslength;
  saveWishlist(String wishlistlength)
  async {
    _wishlistlength=wishlistlength;
    final pref=await SharedPreferences.getInstance();
    pref.setString("savewishlistlegnth", wishlistlength);
  }
  savePendingOrders(String pendingorderlength)
  async {
    _pendingorderlength=pendingorderlength;
    final pref=await SharedPreferences.getInstance();
    pref.setString("savePendingOrderslegnth", pendingorderlength);
  }
  saveOrders(String orderslength)
  async {
    _orderslength=orderslength;
    final pref=await SharedPreferences.getInstance();
    pref.setString("saveOrderslegnth", orderslength);
  }

  ///load
loadlengths()
async {
  final pref=await SharedPreferences.getInstance();
 _wishlistlength= pref.getString("savewishlistlegnth")??'';
 _pendingorderlength= pref.getString("savePendingOrderslegnth")??'';
 _orderslength= pref.getString("saveOrderslegnth")??'';

}
clearlengths()
async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('savewishlistlegnth');
  prefs.remove('savePendingOrderslegnth');
  prefs.remove('saveOrderslegnth');
}

}
