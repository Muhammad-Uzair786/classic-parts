// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:sensors_plus/sensors_plus.dart';
// import 'dart:async';
// import 'dart:math';
//
// class QiblaDirectionFinderApp extends StatefulWidget {
//   @override
//   State<QiblaDirectionFinderApp> createState() => _QiblaDirectionFinderAppState();
// }
//
// class _QiblaDirectionFinderAppState extends State<QiblaDirectionFinderApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Qibla Direction Finder',
//       home: QiblaDirectionScreen(),
//     );
//   }
// }
//
// class QiblaDirectionScreen extends StatefulWidget {
//   @override
//   _QiblaDirectionScreenState createState() => _QiblaDirectionScreenState();
// }
//
// class _QiblaDirectionScreenState extends State<QiblaDirectionScreen> {
//   GoogleMapController? _mapController;
//   double qiblaDirection = 0;
//   double userDirection = 0;
//   late StreamSubscription<dynamic> _subscription;
//   late Position userPosition;
//   String error = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _getQiblaDirection();
//     _listenToUserDirection();
//   }
//
//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }
//
//   Future<void> _getQiblaDirection() async {
//     LocationPermission permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       setState(() {
//         error = 'Location permission denied.';
//       });
//       return;
//     }
//
//     userPosition = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.best,
//     );
//
//     double kaabaLatitude = 21.4225;
//     double kaabaLongitude = 39.8262;
//
//     double userLat = userPosition.latitude;
//     double userLon = userPosition.longitude;
//
//     double deltaLon = kaabaLongitude - userLon;
//
//     double y = sin(deltaLon) * cos(kaabaLatitude);
//     double x = cos(userLat) * sin(kaabaLatitude) - sin(userLat) * cos(kaabaLatitude) * cos(deltaLon);
//     double angle = atan2(y, x);
//
//     setState(() {
//       qiblaDirection = (angle * (180 / pi) + 360) % 360;
//     });
//   }
//
//   void _listenToUserDirection() {
//     _subscription = accelerometerEvents.listen((AccelerometerEvent event) {
//       double azimuth = atan2(event.y, event.x);
//       double rotation = -azimuth;
//
//       setState(() {
//         userDirection = (rotation * (180 / pi) + 360) % 360;
//       });
//     });
//   }
//
//
//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       _mapController = controller;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Qibla Direction Finder'),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: LatLng(userPosition.latitude, userPosition.longitude),
//               zoom: 15,
//             ),
//           ),
//           if (_mapController != null)
//             Positioned(
//               top: 16,
//               right: 16,
//               child: Column(
//                 children: [
//                   Text(
//                     'Qibla Direction:',
//                     style: TextStyle(fontSize: 24),
//                   ),
//                   SizedBox(height: 8),
//                   Transform.rotate(
//                     angle: (360 - qiblaDirection + userDirection) * pi / 180,
//                     child: Icon(
//                       Icons.arrow_upward,
//                       size: 40,
//                       color: Colors.red,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }


///




///
// import 'dart:math'; 
// import 'package:flutter/material.dart';
// import 'package:flutter_qiblah/flutter_qiblah.dart';
//
//
// class QiblahScreen extends StatefulWidget {
//   @override
//   _QiblahScreenState createState() => _QiblahScreenState();
// }
//
// class _QiblahScreenState extends State<QiblahScreen> with SingleTickerProviderStateMixin {
//   Animation<double>? animation;
//   AnimationController? _animationController;
//
//   @override
//   void initState() {
//     _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
//     animation = Tween(begin: 0.0, end: 1.0).animate(_animationController!);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _animationController!.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 48, 48, 48),
//         body: StreamBuilder<QiblahDirection>(
//           stream: FlutterQiblah.qiblahStream,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Container(alignment: Alignment.center, child: const CircularProgressIndicator(color: Colors.white));
//             }
//             if (!snapshot.hasData) {
//               return Container(alignment: Alignment.center, child: const CircularProgressIndicator(color: Colors.white));
//             }
//
//             final qiblahDirection = snapshot.data!;
//             double qiblahAngle = qiblahDirection.qiblah * (pi / 180) * -1;
//
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "${qiblahDirection.direction.toInt()}°",
//                     style: const TextStyle(color: Colors.white, fontSize: 24),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   RotationTransition(
//                     turns: animation!,
//                     child: Image.asset('asset/qibla.png'),
//                   ),
//                 ],
//
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

///

import 'package:com.classic.classicparts/separateAppfiles/QiblaFinder/qiblah_compass.dart';
import 'package:com.classic.classicparts/separateAppfiles/QiblaFinder/qiblah_maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

import '../../constants.dart';
import 'loading_indicator.dart';






class QiblaFinder extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<QiblaFinder> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: CustomColor.WhiteColor,
      // Set the background color of the AppBar
      elevation: 0,
      // Set the elevation to 0 to remove the shadow
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
            Navigator.pop(context);

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
            'Find Qibla Direction',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
          ),
          SizedBox(),
        ],
      ),
    ),

        body: FutureBuilder(
          future: _deviceSupport,
          builder: (_, AsyncSnapshot<bool?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingIndicator();
            if (snapshot.hasError)
              return Center(
                child: Text("Error: ${snapshot.error.toString()}"),
              );
            //
            // if (snapshot.data!)
            //   return QiblahCompass();
            // else
              return QiblahMaps();
          },
        ),
      );

  }
}