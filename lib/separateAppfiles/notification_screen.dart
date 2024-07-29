import 'dart:convert';

import 'package:com.classic.classicparts/Providers/notification_provider.dart';
import 'package:com.classic.classicparts/constants.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/encashments_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/OrderSetion/ordertabs/order_tabs_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationItem {
  final String imageUrl;
  final String text;
  final String time;
  final bool isNew;

  NotificationItem({
    required this.imageUrl,
    required this.text,
    required this.time,
    this.isNew = false,
  });
}

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  backgroundmsghandler(context)
  async {
    if(backdata!=null) {
      print("backdatamain................$backdata");
      Provider.of<NotificationProvider>(context).backgroundData=backdata;
      await  Provider.of<NotificationProvider>(context).addandsaveNotification();
      await  Provider.of<NotificationProvider>(context).RetrieveallNotification();
    }
  }


  // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  // String notificationMessage = '';
  // Future<void> retrieveNotificationData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final savedNotificationData = prefs.getString('notificationDataKey');
  //
  //   if (savedNotificationData != null) {
  //     setState(() {
  //       notificationMessage = savedNotificationData;
  //     });
  //   }
  // }



@override
  void initState() {
  print("back$backdata");
backgroundmsghandler(context);
 print("notiscreenforeground${Provider.of<NotificationProvider>(context,listen: false).foregroundmessage?.notification?.title}");
 print("notiscreenfbackground${Provider.of<NotificationProvider>(context,listen: false).backgroundData?.notification?.title}");
 print("notiscreenallnoti${Provider.of<NotificationProvider>(context,listen: false).allnotifications}");
 //  Provider.of<NotificationProvider>(context,listen: false).mainforgroundMethod();

 super.initState();
  }
  // @override
  // void initState() {
  //   super.initState();
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     Map<String, dynamic> data = message.data;
  //
  //
  //     print('The user ${data} liked your picture "!');
  //   });
  // }
  final List<NotificationItem> notifications = [
    NotificationItem(
      imageUrl: 'https://via.placeholder.com/50',
      text: 'New message received',
      time: '10:30 AM',
      isNew: true,
    ),
    // NotificationItem(
    //   imageUrl: 'https://via.placeholder.com/50',
    //   text: 'Task completed',
    //   time: 'Yesterday',
    // ),
    // NotificationItem(
    //   imageUrl: 'https://via.placeholder.com/50',
    //   text: 'Payment received',
    //   time: '2 days ago',
    // ),
  ];

  @override
  Widget build(BuildContext context) {
  //  Provider.of<NotificationProvider>(context,listen: false).mainforgroundMethod();

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
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CustomColor.TextFieldColor,
                    gradient:CustomColor.GradientColor),
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
            GestureDetector(
              onTap: (){
                Provider.of<NotificationProvider>(context,listen: false).clearnoti();
              },
              child: Text(
                'Notification',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CustomColor.BlackColor),
              ),
            ),
            SizedBox(),
          ],
        ),
      ),
      body:Consumer<NotificationProvider>(

        builder: (BuildContext context, value, Widget? child) {
          return value.allnotifications.isEmpty?Center(child:Text("No Notification",style: TextStyle(color: CustomColor.BlackColor),)):
            ListView.builder(
            itemCount:value.allnotifications?.length,
            itemBuilder: (context, index) {
              final noti= value.allnotifications?[index];
              print('notilegth${value.allnotifications?.length}');
              print('noti${noti["title"]}');
              print('noti${noti}');
              print('allnoti${value.allnotifications}');
              return NotificationListItem(notification: noti);
            },
          );

        },
      ),





      ///
      // StreamBuilder(
      //   stream: FirebaseMessaging.onMessage, // Listen for foreground messages
      //   builder: (BuildContext context, AsyncSnapshot<RemoteMessage> snapshot) {
      //     if(!snapshot.hasData)
      //       return Center(child: Text('No notification'));
      //     if(snapshot.connectionState==ConnectionState.waiting)
      //       return Center(child: CircularProgressIndicator(),);
      //     return NotificationListItem(notification: snapshot.data?.notification);
      //
      //     //   ListView.builder(
      //     //   itemCount: snapshot.data?.length,
      //     //   itemBuilder: (context, index) {
      //     //     final notification = notifications[index];
      //     //     return NotificationListItem(notification: notification);
      //     //   },
      //     // );
      //
      //   },
      // ),
      ///





    );
  }
}
///ui
// class NotificationListItem extends StatelessWidget {
//   final NotificationItem notification;
//
//   NotificationListItem({required this.notification});
//
//   @override
//   Widget build(BuildContext context) {
//     Color? itemColor = notification.isNew
//         ? Colors.blue[50]
//         : Colors.white; // Change the colors as needed
//
//     return Consumer<NotificationProvider>(
//       builder: (BuildContext context, value, Widget? child) {
//         return ListTile(
//           tileColor: itemColor,
//           leading: CircleAvatar(
//             radius: 25,
//             backgroundImage: NetworkImage(notification.imageUrl),
//           ),
//           title: Text(value.backgroundData!.notification!.title!, style: CustomColor.StyleBlackbold),
//           subtitle:
//               Text(value.backgroundData!.notification!.body!, style: CustomColor.StyleBlacknormal),
//           trailing: notification.isNew
//               ? Container(
//                   decoration: BoxDecoration(
//                       gradient: CustomColor.GradientColor,
//                       shape: BoxShape.circle),
//                   child: Icon(
//                     Icons.circle,
//                     size: 10,
//                     color: Colors.transparent,
//                   ),
//                 )
//               : SizedBox.shrink(),
//         );
//       },
//     );
//   }
// }


class NotificationListItem extends StatelessWidget {
  final notification;

  NotificationListItem({required this.notification});

  @override
  Widget build(BuildContext context) {
    // Color? itemColor = notification.isNew
    //     ? Colors.blue[50]
    //     : Colors.white; // Change the colors as needed

    return ListTile(
      // tileColor: itemColor,
      leading: CircleAvatar(
        radius: 25,
        child: Icon(Icons.circle_notifications_rounded,color: CustomColor.BlackColor,),
      ),
      title: Text(notification['title'].toString(), style: TextStyle(fontWeight: FontWeight.bold,color: CustomColor.BlackColor)),
      subtitle:
      Text("${notification['body']}", style: TextStyle(fontWeight: FontWeight.bold,color: CustomColor.BlackColor)),
      // trailing: notification.isNew
      //     ? Container(
      //         decoration: BoxDecoration(
      //             gradient: CustomColor.GradientColor,
      //             shape: BoxShape.circle),
      //         child: Icon(
      //           Icons.circle,
      //           size: 10,
      //           color: Colors.transparent,
      //         ),
      //       )
      //     : SizedBox.shrink(),
    );
  }
}



/// new ui

// class NotificationScreen extends StatelessWidget {
//    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseMessaging.onMessage, // Listen for foreground messages
//       builder: (context, AsyncSnapshot<RemoteMessage> snapshot) {
//         if (snapshot.hasData) {
//           final message = snapshot.data;
//           // Update your UI with the notification message data
//           return Text("noti");
//         }
//         return Text("default"); // If no notification is present
//       },
//     );
//   }
// }



// ///
// ListTile(
// tileColor: itemColor,
// leading: CircleAvatar(
// radius: 25,
// backgroundImage: NetworkImage(notification.imageUrl),
// ),
// title: Text(notification.text, style: CustomColor.StyleBlackbold),
// subtitle:
// Text(notification.time, style: CustomColor.StyleBlacknormal),
// trailing: notification.isNew
// ? Container(
// decoration: BoxDecoration(
// gradient: CustomColor.GradientColor,
// shape: BoxShape.circle),
// child: Icon(
// Icons.circle,
// size: 10,
// color: Colors.transparent,
// ),
// )
//     : SizedBox.shrink(),
// );