import 'package:com.classic.classicparts/separateAppfiles/OrderSetion/ordertabs/running_order_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../MainBottomNavigationPage.dart';
import 'order_history_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderTabScreen extends StatefulWidget {
  const OrderTabScreen({super.key});

  @override
  State<OrderTabScreen> createState() => _OrderTabScreenState();
}

class _OrderTabScreenState extends State<OrderTabScreen> {
  @override
  Widget build(BuildContext context) {
   var tr= AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: TabBar(
              indicatorColor: CustomColor.BlackColor,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: CustomColor.BlackColor ,
              tabs: [
                Tab(text: '${tr?.running}',),
                Tab(text: '${tr?.history}',),
              ],

            ),
            backgroundColor: CustomColor.WhiteColor,
            // Set the background color of the AppBar
            elevation: 0,
            // Set the elevation to 0 to remove the shadow
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                   // Navigator.pop(context);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainBottomNavigationPage()));

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
                  '${tr?.my_orders}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: CustomColor.BlackColor),
                ),
                SizedBox(),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              RunningOrderPage(),
              OrderHistoryPage()
            ],

          )
      ),
    );
  }
}
