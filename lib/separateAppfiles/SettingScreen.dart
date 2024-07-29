import 'dart:io';

import 'package:com.classic.classicparts/Providers/methods_provider.dart';
import 'package:com.classic.classicparts/separateAppfiles/MainBottomNavigationPage.dart';
import 'package:com.classic.classicparts/separateAppfiles/User/edit_profile_screen.dart';
import 'package:com.classic.classicparts/separateAppfiles/User/privacy_policy.dart';
import 'package:com.classic.classicparts/separateAppfiles/User/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Auth/login_screen.dart';
import '../Auth/update_password_screen.dart';
import '../Providers/api_provider.dart';
import '../Providers/authrememberprovider.dart';
import '../Providers/cart_provider.dart';
import '../Providers/language_provider.dart';
import '../Providers/theme_provider.dart';
import '../constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isUrdu = false;
  bool isDarkMode = false;
  ImageProvider<Object>? backgroundImage;
  @override
  void initState() {
    super.initState();
    loadSwitchValue();
  }

  void loadSwitchValue() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = pref.getBool('darkmode') ?? false;
      isUrdu = pref.getBool('urdu') ?? false;
    });
  }
  @override
  Widget build(BuildContext context) {
    final remembermeprovider =
        Provider.of<RememberMeProvider>(context, listen: false);
    var tr=AppLocalizations.of(context);
    // if (remembermeprovider.profileImage.startsWith('http')) {
    //   backgroundImage=NetworkImage('${remembermeprovider.profileImage}');
    // }else if(remembermeprovider.profileImage=='null')
    // {
    // backgroundImage=AssetImage("asset/user.png");
    // }
    // else {
    //   backgroundImage=
    //   FileImage(File(remembermeprovider.profileImage));
    // }

    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,
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
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainBottomNavigationPage()));
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
              '${tr?.setting}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
            ),
            SizedBox(),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // First Field
          buildSettingField(
            leftIcon: Icons.person,
            middleText: "${remembermeprovider.userName}",
            rightIcon: Icons.edit,
            profilefield: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                          userName: '${remembermeprovider.userName}',
                          phoneNumber: '${remembermeprovider.phoneNumber}',
                          address: '${remembermeprovider.address}',
                        )),
              );
            },
          ),
          SizedBox(
            height: 40,
          ),
          // Second Field
          // buildNotiIcon(
          //     onSwitchChanged: (value) {
          //       setState(() {
          //         isSwitched = value;
          //       });
          //     },
          //     Switchvalue: isSwitched,
          //     text: "Notifications",
          //     icon: Icons.notifications),
          buildSettingField(
            leftIcon: Icons.lock,
            middleText: "${tr?.change_password}",
            rightIcon: Icons.arrow_forward_ios,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UpdatePasswordScreen(
                        authtoken: remembermeprovider.authtoken)),
              );
            },
          ),
          // // Third Field
          // buildSettingField(
          //   leftIcon: Icons.language,
          //   middleText: "Language",
          //   rightIcon: Icons.arrow_forward_ios,
          //   onTap: () {},
          // ),
          buildNotiIcon(
            onSwitchChanged: (value) async {
              SharedPreferences pref =await SharedPreferences.getInstance();
              pref.setBool('urdu', value);
              setState(()  {
               // Provider.of<ThemeProvider>(context,listen: false).switchTheme(value);
                isUrdu=value;
                Provider.of<LanguageProvider>(context,listen: false).changelocaletype(Locale(isUrdu?"ur":"en"));
               // Provider.of<ThemeProvider>(context,listen: false).loadcolors();

                // isDarkMode =pref.getBool('darkmode')!;
                print("isUrdu$isUrdu");
              });
            },
            Switchvalue: isUrdu,
            text: "${tr?.urdu}",
            icon: Icons.language,
          ),
          buildNotiIcon(
            onSwitchChanged: (value) async {
              SharedPreferences pref =await SharedPreferences.getInstance();
              pref.setBool('darkmode', value);
              setState(()  {
                Provider.of<ThemeProvider>(context,listen: false).switchTheme(value);
                isDarkMode=value;
                 Provider.of<ThemeProvider>(context,listen: false).loadcolors();

                // isDarkMode =pref.getBool('darkmode')!;
                print("darkkkkk$isDarkMode");
              });
            },
            Switchvalue: isDarkMode,
            text: "${tr?.dark_mode}",
            icon: Icons.dark_mode_outlined,
          ),
          // Fourth Field
          buildSettingField(
            leftIcon: Icons.security,
            middleText: "${tr?.privacy}",
            rightIcon: Icons.arrow_forward_ios,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PrivacyPolicy()));
            },
          ),
          // Fifth Field
          // buildSettingField(
          //   leftIcon: Icons.help,
          //   middleText: "Help & Support",
          //   rightIcon: Icons.arrow_forward_ios,
          //   onTap: () {},
          // ),
          // Sixth Field
          buildSettingField(
            leftIcon: Icons.exit_to_app,
            middleText: "${tr?.log_out}",
            rightIcon: Icons.power_settings_new,
            onTap: () {
             // Navigator.pop(context);
              _showLogoutDialog(context); // Close the dialog
            },
          ),
        ],
      ),
    );
  }

  Widget buildSettingField({
    required IconData leftIcon,
    required String middleText,
    required IconData rightIcon,
    required VoidCallback onTap,
    bool profilefield = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            gradient: CustomColor.GradientColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (profilefield == true)
              Consumer<MethodsProvider>(
                builder: (BuildContext context,value, Widget? child) {
                  return CircleAvatar(
                      radius: 30,
                      backgroundImage: value.ImageType()
                  );
                },

              )
            else
              // Left Icon
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CustomColor.WhiteColor,
                ),
                child: Icon(
                  leftIcon,
                  size: 20,
                  color: CustomColor.BlackColor,
                ),
              ),
            // Middle Text
            profilefield
                ? Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            middleText,
                            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                          // Text(
                          //   'developer',
                          //   style: TextStyle(fontSize: 18, color: Colors.grey),
                          // ),
                        ],
                      ),
                    ),
                  )
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        middleText,
                        style: TextStyle(fontSize: 18,color: Colors.white),
                      ),
                    ),
                  ),
            // Right Icon
            if (profilefield == true)
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CustomColor.WhiteColor,
                ),
                child: Icon(
                  rightIcon,
                  size: 20,
                  color: CustomColor.BlackColor,
                ),
              )
            else
              Icon(
                rightIcon,
                size: 20,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }

  Widget buildNotiIcon({
    required final onSwitchChanged,
    required final Switchvalue,
    required final text,
    required final icon,
  }) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10,right: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          gradient: CustomColor.GradientColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
// Left Icon
          Container(
           // margin: EdgeInsets.only(right: 10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColor.WhiteColor,
            ),
            child: Icon(
              icon,
              size: 20,
              color: CustomColor.BlackColor,
            ),
          ),
// Middle Text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                '$text',
                style: TextStyle(fontSize: 18,color: Colors.white),
              ),
            ),
          ),
// Right Icon
          Transform.scale(
            scale: 0.5, // Adjust the value to resize the switch
            child: Switch(
              value: Switchvalue,
              activeTrackColor: CustomColor.BlackColor,
              inactiveTrackColor: CustomColor.WhiteColor,
              inactiveThumbColor: CustomColor.BlackColor,
              onChanged: onSwitchChanged,
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    var tr=AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        final _apiprovider = Provider.of<ApiProvider>(context, listen: false);
        final _remembermeprovider =
            Provider.of<RememberMeProvider>(context, listen: false);

        return AlertDialog(
          title: Text('${tr?.log_out}'),
          content: Text('${tr?.logout_tag}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('${tr?.cancel}'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Perform logout action here
                final _response = await _apiprovider.fetchLogoutApi(
                    _remembermeprovider.authtoken, context);
                _remembermeprovider.clearUserData();
                print("result ${_response}");
                Navigator.pop(context); // Close the dialog
                if (_response == 'tokenerror') {
                  var snackBar =
                      SnackBar(content: Text('${_response['error']}'));
                  ScaffoldMessenger.of(context).showSnackBar(
                    snackBar,
                  );
                } else if (_response != null && _response != 'tokenerror') {
                  var snackBar =
                      SnackBar(content: Text('${_response['message']}'));
                  Provider.of<RememberMeProvider>(context, listen: false)
                      .clearUserData();
                  Provider.of<CartProvider>(context, listen: false)
                      .clearCartItems();
                  ScaffoldMessenger.of(context).showSnackBar(
                    snackBar,
                  );
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                }
              },
              child: Text('${tr?.log_out}'),
            ),
          ],
        );
      },
    );
  }
}
