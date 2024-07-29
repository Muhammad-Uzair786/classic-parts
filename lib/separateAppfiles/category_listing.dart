import 'package:flutter/material.dart';

import '../constants.dart';

class CategoryListingScreen extends StatefulWidget {
  final profilefield;

  CategoryListingScreen({this.profilefield});

  @override
  State<CategoryListingScreen> createState() => _CategoryListingScreenState();
}

class _CategoryListingScreenState extends State<CategoryListingScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.WhiteColor,
      appBar: AppBar(
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
                  color: CustomColor.TextFieldColor,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 12,
                    color: Colors.black, // Icon color
                  ),
                ),
              ),
            ),
            Text(
              'Main Category',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: CustomColor.TextFieldColor,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.notification_add_outlined,
                    size: 12,
                    color: Colors.black, // Icon color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: CustomColor.TextFieldColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search,color: Colors.grey,),
                  onPressed: () {
                    //_onSearchSubmitted(_searchController.text);
                  },
                ),

                Expanded(
                  child: TextField(
                   // controller: _searchController,
                   // onSubmitted: _onSearchSubmitted,
                    cursorColor: CustomColor.BlackColor,
                    decoration: InputDecoration(
                      hintText: "Search Category...",

                      hintStyle: TextStyle(color: CustomColor.TextGreyColor,fontSize: 15),
                      border: InputBorder.none,

                    ),
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 20,),
          // Fourth Field
          buildSettingField(
            leftIcon: Icons.bike_scooter,
            middleText: "Two Wheeler", rightText: '102',

          ),
          // Fifth Field
          buildSettingField(
            leftIcon: Icons.electric_rickshaw,
            middleText: "Three Wheeler",
             rightText: '33',
          ),
          // Sixth Field
          buildSettingField(
            leftIcon: Icons.format_paint_outlined,
            middleText: "Paint",
           rightText: '333',
          ),
          buildSettingField(
            leftIcon: Icons.lock_reset,
            middleText: "WireLocK",
            rightText: '254',
          ),

        ],
      ),
    );
  }

  Widget buildSettingField({
    required IconData leftIcon,
    required String middleText,
    required String rightText,
    bool profilefield = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: CustomColor.BlackColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (profilefield == true)
            CircleAvatar(
                radius: 30, backgroundImage: AssetImage('asset/user.png'))
          else
          // Left Icon
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CustomColor.BlackColor,
              ),
              child: Icon(
                leftIcon,
                size: 20,
                color: Colors.white,
              ),
            ),
          // Middle Text
          profilefield
              ? Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    middleText,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'developer',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
              : Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                middleText,
                style: TextStyle(fontSize: 18,color: CustomColor.WhiteColor),
              ),
            ),
          ),
          // Right Icon
            Text(
              '$rightText Products',style: TextStyle(color: Colors.white),
            ),
        ],
      ),
    );
  }

  Widget buildNotiIcon({
    required final onSwitchChanged,
    required final Switchvalue,
  }) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: CustomColor.TextFieldColor,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
// Left Icon
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColor.BlackColor,
            ),
            child: Icon(
              Icons.notifications,
              size: 20,
              color: Colors.white,
            ),
          ),
// Middle Text
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Notifications',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
// Right Icon
          Transform.scale(
            scale: 0.5, // Adjust the value to resize the switch
            child: Switch(
              value: Switchvalue,
              activeTrackColor: CustomColor.BlackColor,
              inactiveTrackColor: CustomColor.WhiteColor,
              inactiveThumbColor: CustomColor.BlackColor,
              onChanged: onSwitchChanged,
            ),
          ),
        ],
      ),
    );
  }
}
