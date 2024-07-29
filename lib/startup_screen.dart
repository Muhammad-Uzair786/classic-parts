// import 'package:com.classic.classicparts/Auth/login_screen.dart';
// import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//  // Import your provider
//
// class StartupScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final rememberMeProvider = Provider.of<RememberMeProvider>(context, listen: false);
//
//     return FutureBuilder(
//       future: rememberMeProvider.loadRememberMe(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           final savedPassword = rememberMeProvider.saveUserData(Provider.of<RememberMeProvider>(context).phoneNumber, Provider.of<RememberMeProvider>(context).password);
//            print('savedpass$savedPassword');
//           // if (savedPassword!=null) {
//           //   return MainScreen(); // Navigate to the main screen if password is saved
//           // } else {
//           //   return LoginScreen(); // Navigate to the login screen if password is not saved
//           // }
//           return LoginScreen();
//         }
//         return LoginScreen();
//
//
//         // Show loading or splash screen while loading shared preferences
//         //return SplashScreen(); // Implement your SplashScreen widget
//       },
//     );
//   }
// }
