import 'package:com.classic.classicparts/Providers/network_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NetworkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2E3192), Color(0xFF1B1464)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.cloud_off,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                "Network Unavailable",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Please check your internet connection and try again.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to retry connecting to the network.
                  // Retry button action
                  if (Provider.of<NetworkProvider>(context,listen: false).isConnected) {
                    // If the network is restored, navigate back to the previous screen or your desired destination.
                    Provider.of<AppNavigator>(context,listen: false).pop();
                  } else {
                    // Handle retry when the network is still unavailable, show a message, or take appropriate action.
                    // For example, you can display a message to the user indicating that the network is still unavailable.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Network is still unavailable."),
                      ),
                    );
                  }
                },
                child: Text(
                  "Retry",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

