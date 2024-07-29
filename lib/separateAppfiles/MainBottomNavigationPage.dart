import 'package:com.classic.classicparts/separateAppfiles/qr_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upgrader/upgrader.dart';
import '../Providers/language_provider.dart';
import '../constants.dart';
import 'LoyalityPoints/loyality_point_screen.dart';
import 'OrderSetion/ordertabs/order_tabs_screen.dart';
import 'User/profile_screen.dart';
import 'home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MainBottomNavigationPage extends StatefulWidget {
  // final username;
  // final authtoken;
  // const MainBottomNavigationPage({
  //   this.username, this.authtoken});

  @override
  State<MainBottomNavigationPage> createState() => _MainBottomNavigationPageState();
}

class _MainBottomNavigationPageState extends State<MainBottomNavigationPage> {
  int _currentIndex = 0;
  bool _shouldExitApp = false;
  bool? isUrdu;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _pages = [
    DashboardPage(),
    OrderTabScreen(),
    LoyalityPointScreen(),
    ProfileScreen(),
  ];
  @override
  void initState() {
    //getLocale();

    // Provider.of<LanguageProvider>(context,listen: false).changelocaletype(Locale(isUrdu??false?"ur":"en"));
    print("isurdu...${isUrdu}");
    super.initState();
  }

  getLocale() async {
    SharedPreferences pref =await SharedPreferences.getInstance();
    isUrdu= pref.getBool('urdu')??false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Wrap the entire Scaffold with WillPopScope
      onWillPop: () async {
        if (_shouldExitApp) {
          // If _shouldExitApp is true, exit the app
          return true; // Allow exit
        } else {
          // Show a confirmation dialog and control the exit behavior
          bool exit = await showExitConfirmationDialog(context);
          if (exit) {
            setState(() {
              _shouldExitApp = true;
            });
            return true; // Allow exit
          } else {
            return false; // Prevent exit
          }
        }
      },
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            gradient: CustomColor.GradientColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavBarItem(Icons.home, "${AppLocalizations.of(context)?.home}", 0),
                _buildNavBarItem(Icons.bike_scooter, "${AppLocalizations.of(context)?.orders}", 1),
                SizedBox(height: 20, width: 20),
                _buildNavBarItem(Icons.control_point_sharp, "${AppLocalizations.of(context)?.points}", 2),
                _buildNavBarItem(Icons.person_outline, "${AppLocalizations.of(context)?.profile}", 3),
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            onPressed: () async {
              try {
                PermissionStatus status = await Permission.camera.status;
                print("ttt${status.isGranted}");
                print("ttt${status.isDenied}");
                print("ttt${status.name}");
                if (status.isPermanentlyDenied) {
                  print("first");
                  await _showPermissionDialog();
                } else if (status.isDenied) {
                  await Permission.camera.request();
                  print("notttttttt");
                  status = await Permission.camera.status;
                  if(status.isGranted)
                {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRScannerScreen()));

                }

                } else if(status.isGranted)
                {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRScannerScreen()));

                }


                else {
                  throw Exception();
                }
              }catch(e)
              {
                print("catch");
               await _showPermissionDialog();


              }
            },
            backgroundColor: CustomColor.BlueColor,
            shape: CircleBorder(),
            child:  Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Future<bool> showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you really want to exit the app?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Do not exit
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Exit
              },
              child: Text('Exit'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNavBarItem(IconData icon, String title, int index) {
    return GestureDetector(
      onTap: () {
        _onTabTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _currentIndex == index ? Colors.white : Colors.white54,
          ),
          const SizedBox(height: 2),
          Text(
            title,
            style: TextStyle(
              color: _currentIndex == index ? Colors.white : Colors.white54,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showPermissionDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Permission Required',style: TextStyle(fontSize: 20),),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('To scan QR codes, please allow camera permission'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Go to Settings'),
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }
}
