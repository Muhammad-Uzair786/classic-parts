import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class NetworkProvider extends ChangeNotifier {
  ConnectivityResult _connectivityResult = ConnectivityResult.none;

  ConnectivityStatus() {
    Connectivity().onConnectivityChanged.listen((result) {
      _connectivityResult = result;
      notifyListeners();
    });
    // Future<bool> ConnectivityStatus() async {
    //   final connectivityResult = await Connectivity().checkConnectivity();
    //   return connectivityResult != ConnectivityResult.none;
    // }
  }

  bool get isConnected => _connectivityResult != ConnectivityResult.none;
}


class AppNavigator extends ChangeNotifier {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void pop() {
    navigatorKey.currentState?.pop();
  }

  void push(Widget page) {
    navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => page));
  }
}
