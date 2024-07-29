import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../constants.dart';


class PrayerTimesScreen extends StatefulWidget {
  @override
  _PrayerTimesScreenState createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  DateTime _firstDay = DateTime.now().subtract(Duration(days: 365));
  DateTime _lastDay = DateTime.now().add(Duration(days: 365));
  Map<DateTime, List<String>> _prayerTimes = {};

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initializeLocalNotifications();
    fetchPrayerTimes(_selectedDay);
  }

  Future<void> initializeLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid, iOS: null);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> fetchPrayerTimes(DateTime date) async {
    final response = await http.get(
        Uri.parse(
          'https://api.aladhan.com/v1/calendarByAddress/2017/4?address=Sultanahmet%20Mosque,%20Istanbul,%20Turkey&method=2'
        ),
        headers: {
          'Content-Type': 'application/json',
        });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print("aliiiiii");
      final timings = data['data'][0]['timings'];
      _prayerTimes[date] = timings.values.cast<String>().toList();
      setState(() {});
    } else {
      throw Exception('Failed to load prayer times');
    }
  }

  Future<void> _showPrayerTimeNotification(String prayerName) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'channel_id', 'channel_name',// 'channel_description',
        importance: Importance.max, priority: Priority.high);

    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Prayer Time Reminder',
      'It\'s time for $prayerName prayer!',
      platformChannelSpecifics,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff2e286e), Color(0xff2799d5)], // Replace with your desired colors
                  ),                ),
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
              'Prayer Time Calender',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox()
          ],
        ),
      ),

      body: Column(
        children: [
          TableCalendar(
            calendarFormat: _calendarFormat,
            focusedDay: _focusedDay,
            firstDay: _firstDay,
            lastDay: _lastDay,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            availableGestures: AvailableGestures.horizontalSwipe,
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(fontSize: 20),
            ),

            onDaySelected: (date, events,) {
              setState(() {
                _selectedDay = date;
              });
              fetchPrayerTimes(date);
            },
          ),          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _prayerTimes[_selectedDay]?.length ?? 0,

              itemBuilder: (context, index) {
                print(_prayerTimes[_selectedDay]?.length);
                final prayerName = ['Fajr','Dhuhr','Asr','Maghrib','Isha','Fajr','Dhuhr','Asr','Maghrib','Isha','Fajr','Dhuhr','Asr','Maghrib','Isha',][index];
                final prayerTime = _prayerTimes[_selectedDay]![index];
                return ListTile(
                  title: Text('$prayerName Prayer'),
                  subtitle: Text(prayerTime),
                  trailing: IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      _showPrayerTimeNotification(prayerName);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
