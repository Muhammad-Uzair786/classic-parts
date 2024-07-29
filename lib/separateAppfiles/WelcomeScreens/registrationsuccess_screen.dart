import 'package:com.classic.classicparts/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:com.classic.classicparts/constants.dart';

import '../MainBottomNavigationPage.dart';
import '../home_screen.dart';

class OnRegisterationSuccess extends StatefulWidget {
  @override
  _OnRegisterationSuccessState createState() => _OnRegisterationSuccessState();
}

class _OnRegisterationSuccessState extends State<OnRegisterationSuccess> {
  bool _shouldExitApp = false; // Flag to control app exit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.WhiteColor,
        body: SafeArea(
          child: WillPopScope(
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
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
               // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Page(color: CustomColor.WhiteColor, text: 'You have successfully registered in our app and can start working in it'),
                  SizedBox(height: 30,),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _shouldExitApp = true;
                      });
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: CustomColor.GradientColor,
                      ),
                      child: Text('Start Shopping', style: CustomColor.StyleWhitebold, textAlign: TextAlign.center,),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
}

class Page extends StatelessWidget {
  final Color color;
  final String text;

  const Page({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        color: color,
        child: Column( 
          children: [
            Container(
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage('https://ejbilling.com/images/register_success_2.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Text("Successful!!", style: CustomColor.StyleBlackbold.copyWith(fontSize: 25),),
            SizedBox(height: 20,),

            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: CustomColor.BlackColor, fontFamily: 'Poppins'),
            ),
          ],
        ),
      ),
    );
  }
}