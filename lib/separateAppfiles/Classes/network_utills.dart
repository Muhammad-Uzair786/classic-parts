import 'package:com.classic.classicparts/Providers/network_provider.dart';
import 'package:com.classic.classicparts/separateAppfiles/nework_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkUtils {
  static void checkAndNavigateIfNetworkUnavailable(BuildContext context) {
   Provider.of<NetworkProvider>(context, listen: false).ConnectivityStatus();
    final appNavigator = Provider.of<AppNavigator>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!Provider.of<NetworkProvider>(context, listen: false).isConnected) {
        appNavigator.push(NetworkScreen());
      }
      //Navigator.of(context).push(MaterialPageRoute(builder: (context) => YourScreen()));
    });
  }
}
