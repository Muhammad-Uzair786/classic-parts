import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';
import '../firebase_options.dart';
import '../main.dart';
import '../separateAppfiles/ApiModels/user_info_model.dart';
import '../separateAppfiles/OrderSetion/ordertabs/order_tabs_screen.dart';
import 'api_provider.dart';
import 'authrememberprovider.dart';
import 'authrememberprovider.dart';
import 'authrememberprovider.dart';
RemoteMessage? backdata;

class NotificationProvider extends ChangeNotifier
{
  // BuildContext context;
  // NotificationProvider(this.context);

  RemoteMessage? foregroundmessage;
  RemoteMessage? data;
  RemoteMessage?  backgroundData;
  datatrans(){
    backgroundData=backdata;
    notifyListeners();
    print("ttttttttt$backgroundData");
  }
  List allnotifications=[];
  Future<void> setupInteractedMessage(context) async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
    try {
      await Provider.of<ApiProvider>(context, listen: false).getUserInfo(context);
    }catch(e)
    {

    }
  }

  void _handleMessage(RemoteMessage message) {
    // if (message.data['type'] == 'chat') {
    //   Navigator.pushNamed(context, '/chat',
    //     arguments: ChatArguments(message),
    //   );
    // }
    data=message;
    print("inuseapp${message.notification?.title}");
    //Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderTabScreen()));
    notifyListeners();
  }

///back


  addandsaveNotification()
  async {
print("addcall");
    Map<String,dynamic> notification={
      "title":"${foregroundmessage!=null?foregroundmessage?.notification?.title:backgroundData?.notification?.title}",
      "body":"${foregroundmessage!=null?foregroundmessage?.notification?.body:backgroundData?.notification?.body}",
    };
    allnotifications.insert(0,notification);
    final prefs = await SharedPreferences.getInstance();

final encodeallnotifications=jsonEncode(allnotifications);
    await prefs.setString("allnotifications", encodeallnotifications);
print("addcallbeforclear${allnotifications}");

allnotifications.clear();
print("addcallafterclear${allnotifications}");

    notifyListeners();
  }
  RetrieveallNotification()
  async {
    final prefs = await SharedPreferences.getInstance();
    final encodedNotifications = prefs.getString("allnotifications");

    if (encodedNotifications != null) {
      ///test

      // Decode the JSON-encoded string back to a list of maps
      List<Map<String, dynamic>> decodedNotifications = List<Map<String, dynamic>>.from(json.decode(encodedNotifications));

      print("rerievedlist${decodedNotifications}");
      // Now, you can work with the decodedNotifications list
      allnotifications=decodedNotifications;
    }

    notifyListeners();
  }
  request()
  async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  ///foreground appopen in use
  mainforgroundMethod(context )
   async {
     FirebaseMessaging.onMessage.listen(foregroundmethod);
     try {
       await Provider.of<ApiProvider>(context, listen: false).getUserInfo(context);
     }catch(e)
     {

     }
   //notifyListeners();
   }

  Future<void> foregroundmethod(RemoteMessage message) async {
  print('Got a message whilst in the foreground!');
  print('Message data: ${message.notification?.title}');

  if (message.notification != null) {
    ///extra
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await setupFlutterNotifications();
  showFlutterNotification(message);
  ///
  print('Message also contained a notification: ${message.notification}');
   // Provider.of<ApiProvider>(context,listen: false).getUserInfo(context);
  foregroundmessage=message;
  await addandsaveNotification();
  await RetrieveallNotification();

  print("insideforeground${foregroundmessage?.notification?.title}");
  ///userupdate

  }
  notifyListeners();
  }

  clearnoti()
  async {
    final prefs = await SharedPreferences.getInstance();
   await prefs.remove("allnotifications");
   allnotifications.clear();
   notifyListeners();
  }
}



//GlobalKey _yourGlobalKey = GlobalKey();


@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //BuildContext? context = _yourGlobalKey.currentContext!;
 // final context = appContext.value;

  ///new
  // Access the context using the global key
  BuildContext? context = navigatorKey.currentContext;



  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  // await Firebase.initializeApp();
  print('type.............${message.notification?.title}');
  backdata=message;
  print("assigning${backdata?.notification?.title}");
 // if(context!=null) {
    ///magic
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await setupFlutterNotifications();
    showFlutterNotification(message);
    ///
    print("insidenull................$message");
  //  await  Provider.of<NotificationProvider>(context).addandsaveNotification();
   //  await  Provider.of<NotificationProvider>(context).RetrieveallNotification();
 // }
  print("Handling a background message: ${message.notification?.title}");
  //notifyListeners();
// Access the ChangeNotifier using the service locator
  await ServiceLocator.setup();
  NotificationProvider? changeNotifier = ServiceLocator.myChangeNotifier;
  ApiProvider? apiProvider = ServiceLocator.apiProvider;
  RememberMeProvider? authProvider = ServiceLocator.authProvider;
  await authProvider?.loadRememberMe();
print("token,,,,${authProvider?.authtoken}");
print("name,,,,${authProvider?.userName}");
print("ponts,,,${authProvider?.userPoints}");
///farig
//   Future<UserInfoModel> getUserInfo() async {
//
//     final response = await get(
//         Uri.parse(ApiEndPoints.BaseUri + ApiEndPoints.UserInfoUri),
//         headers: {
//           'Authorization': 'Bearer ${authProvider
//               ?.authtoken}',
//           // Assuming Bearer token authentication
//           'Content-Type': 'application/json',
//           // Add other headers as needed
//         });
//     final jsonResponse = json.decode(response.body);
//     print('userinfo$jsonResponse');
//     final remeberprovider=authProvider;
//
//     if (response.statusCode == 200) {
//       print('userinfo${UserInfoModel.fromJson(jsonResponse)}');
//       print('userinfo${UserInfoModel.fromJson(jsonResponse).userinfo?.userPoints}');
//       final userInfoModelValue=UserInfoModel.fromJson(jsonResponse).userinfo;
//       await authProvider?.saveUserData(userInfoModelValue!.name.toString(), userInfoModelValue.address.toString(), userInfoModelValue!.phone.toString(), remeberprovider!.password, remeberprovider.authtoken, remeberprovider.uid, userInfoModelValue.imagePath.toString(), userInfoModelValue.deviceToken.toString(), userInfoModelValue.userCredit.toString(), userInfoModelValue.userPoints.toString());
//
//       return UserInfoModel.fromJson(jsonResponse);
//
//     } else {
//
//       return UserInfoModel.fromJson(jsonResponse);
//
//       // print(response.body);
//     }
//
//   }
  await apiProvider?.getUserInfo2();

  ///
  changeNotifier?.backgroundData=message;

  await changeNotifier?.addandsaveNotification();
 await changeNotifier?.RetrieveallNotification();
 print("yes done");

}

///
class ServiceLocator {
  static NotificationProvider? myChangeNotifier;
  static ApiProvider? apiProvider;
  static RememberMeProvider? authProvider;

  static  setup() async {
    myChangeNotifier = NotificationProvider();
    apiProvider = ApiProvider();
    authProvider = await RememberMeProvider();
  }

}




