import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/api_provider.dart';
import '../separateAppfiles/OrderSetion/ordertabs/order_tabs_screen.dart';

class HelperClass
{
  showCancelOrderConfirmationDialog(BuildContext context,String orderTrackingId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cancel Order'),
          content: Text('Are you sure you want to cancel this order?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                // Perform the cancel order action here.
                await Provider.of<ApiProvider>(context,listen: false).CancelOrderApi(context,orderTrackingId);
                Navigator.of(context).pop();// Close the dialog.
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OrderTabScreen()));

              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog.
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }
}

