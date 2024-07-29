///with static filter
// import 'package:flutter/material.dart';
//
// import '../constants.dart';
//
// class Transaction {
//   final String receiverName;
//   final String receiverMobile;
//   final String transactionDate;
//   final double amount;
//
//   Transaction({required this.receiverName,required this.receiverMobile, required this.transactionDate, required this.amount});
// }
//
// class Historyi extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TransactionHistoryScreen(),
//     );
//   }
// }
//
// class TransactionHistoryScreen extends StatefulWidget {
//   @override
//   _TransactionHistoryScreenState createState() => _TransactionHistoryScreenState();
// }
//
// class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
//   List<Transaction> transactions = [
//     Transaction(receiverName: 'John Doe', transactionDate: 'Wednesday,Aug-2-2023', amount: 100.0, receiverMobile: '03214444521'),
//     Transaction(receiverName: 'Jane Smith', transactionDate: 'Tuesday,Aug-1-2023', amount: 50.0, receiverMobile: '0345667789'),
//     Transaction(receiverName: 'Alice Johnson', transactionDate: 'Tuesday,Aug-1-2023', amount: 75.0, receiverMobile: '032122345'),
//     // Add more transaction data here...
//   ];
//
//   List<Transaction> filteredTransactions = [];
//   Map<String, List<Transaction>> groupedTransactions = {};
//
//   TextEditingController searchController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     filteredTransactions = transactions;
//     searchController.addListener(filterTransactions);
//     groupTransactionsByDate();
//   }
//
//   void groupTransactionsByDate() {
//     groupedTransactions.clear();
//     for (var transaction in transactions) {
//       String date = transaction.transactionDate;
//       if (groupedTransactions[date] == null) {
//         groupedTransactions[date] = [];
//       }
//       groupedTransactions[date]!.add(transaction);
//     }
//   }
//
//   void filterTransactions() {
//     String query = searchController.text.toLowerCase();
//     setState(() {
//       filteredTransactions = transactions.where((transaction) {
//         return transaction.receiverName.toLowerCase().contains(query);
//       }).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: CustomColor.WhiteColor,
//         // Set the background color of the AppBar
//         elevation: 0,
//         // Set the elevation to 0 to remove the shadow
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 padding: EdgeInsets.only(left: 8, right: 6, top: 8, bottom: 8),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(5),
//                   color: CustomColor.TextFieldColor,
//                     gradient: CustomColor.GradientColor
//                 ),
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Icon(
//                     Icons.arrow_back_ios,
//                     size: 12,
//                     color: Colors.white, // Icon color
//                   ),
//                 ),
//               ),
//             ),
//             Text(
//               'Transactions',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
//             ),
//             SizedBox(),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             margin: EdgeInsets.symmetric(horizontal: 16),
//             decoration: BoxDecoration(
//               color: Colors.grey[50],
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: searchController,
//                    // onSubmitted: _onSearchSubmitted,
//                     cursorColor: CustomColor.BlackColor,
//                     decoration: InputDecoration(
//                       hintText: "Search your product",
//
//                       hintStyle: TextStyle(color: CustomColor.TextGreyColor,fontSize: 15),
//                       border: InputBorder.none,
//
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.search,color: Colors.grey,),
//                   onPressed: () {
//                    // _onSearchSubmitted(_searchController.text);
//                   },
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 20,),
//
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredTransactions.length,
//               itemBuilder: (context, index) {
//                 return Column(
//                   children: [
//                     if (index == 0 ||
//                         filteredTransactions[index].transactionDate !=
//                             filteredTransactions[index - 1].transactionDate)
//                       TransactionDateCard(date: filteredTransactions[index].transactionDate),
//                     TransactionCard(transaction: filteredTransactions[index]),
//                   ],
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class TransactionDateCard extends StatelessWidget {
//   final String date;
//
//   TransactionDateCard({required this.date});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//        // color:Color(0xff2e286e) ,
//
//       ),
//       child: Text(
//         date,
//         style: TextStyle(fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }
//
// class TransactionCard extends StatelessWidget {
//   final Transaction transaction;
//
//   TransactionCard({required this.transaction});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.0),
//           gradient: CustomColor.GradientColor
//           // gradient: LinearGradient(
//           //   begin: Alignment.topLeft,
//           //   end: Alignment.bottomCenter
//           //   ,
//           //   colors: [Color(0xff2e286e), Color(0xff2799d5)], // Replace with your desired colors
//           // ),
//           // boxShadow: [
//           //   BoxShadow(
//           //     color: Colors.grey.withOpacity(0.5),
//           //     spreadRadius: 2,
//           //     blurRadius: 5,
//           //     offset: Offset(0, 3),
//           //   ),
//           // ],
//         ),
//         child: ListTile(
//           leading: CircleAvatar(
//             backgroundColor: Colors.blue,
//             child: Icon(Icons.paid, color: Colors.white),
//           ),
//           title: Text(transaction.receiverName,style: TextStyle(color: CustomColor.WhiteColor),),
//           subtitle: Text(transaction.receiverMobile,style: TextStyle(color: CustomColor.WhiteColor)),
//           trailing: Text(
//             '\$${transaction.amount.toStringAsFixed(2)}',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
//           ),
//         ),
//       ),
//     );
//   }
// }
///updating
import 'package:com.classic.classicparts/Providers/api_provider.dart';
import 'package:com.classic.classicparts/Providers/authrememberprovider.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/transactions_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class TransactionHistoryScreen extends StatefulWidget {
  @override
  _TransactionHistoryScreenState createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {

  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [


          Expanded(
            child: FutureBuilder<Iterable<Transactions>?>(
              future: Provider.of<ApiProvider>(context,listen: false).TransactionHistory(context),
              builder: (context,AsyncSnapshot<Iterable<Transactions>?>snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting)
                {
                   return Center(child: SizedBox(
                       height: 100,
                       width: 100,
                       child: Image.asset("asset/applogo.png")));
                }
                else if(snapshot.data==null)
                  {
                    return Center(child: Text("${tr.no_transactions}"));
                  }else
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    print("length${snapshot.data}");
                    final historyItem=snapshot.data?.toList()[index];
                    DateTime dateTime = DateTime.parse(historyItem!.createdAt.toString());
                    String formattedDateTime = DateFormat('MMMM d, y - hh:mm a').format(dateTime);

                    print('Formatted DateTime: $formattedDateTime');

                    print("sender${historyItem?.senderId}recieverid${historyItem?.receiverId}");
                    print("uid${Provider.of<RememberMeProvider>(context,listen: false).uid}");
                    return Column(
                      children: [
                        // if (index == 0 ||
                        //     filteredTransactions[index].transactionDate !=
                        //         filteredTransactions[index - 1].transactionDate)
                          TransactionDateCard(date:formattedDateTime.toString() ),
                        if(Provider.of<RememberMeProvider>(context,listen: false).uid==historyItem.senderId.toString())
                          TransactionCard(name: historyItem.receivers?.name, phone: historyItem.receivers?.phone, amount: historyItem.amount, boolvalue: true,),
                        if(Provider.of<RememberMeProvider>(context,listen: false).uid==historyItem.receiverId.toString())
                          TransactionCard(name: historyItem.receivers?.name, phone: historyItem.receivers?.phone, amount: historyItem.amount,),



                      ],
                    );
                  },
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionDateCard extends StatelessWidget {
  final String date;

  TransactionDateCard({required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color:Color(0xff2e286e) ,

      ),
      child: Text(
        date,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class TransactionCard extends StatelessWidget {
  final name;
  final  phone;
  final  amount;
  bool boolvalue;

  TransactionCard({this.name, required this.phone, required this.amount,this.boolvalue=false});

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: CustomColor.GradientColor
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomCenter
          //   ,
          //   colors: [Color(0xff2e286e), Color(0xff2799d5)], // Replace with your desired colors
          // ),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: Offset(0, 3),
          //   ),
          // ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: CustomColor.BlueColor,
            child: Icon(Icons.paid, color: Colors.white),
          ),
          title: Text(name,style: TextStyle(color: Colors.white),),
          subtitle: Text(phone,style: TextStyle(color: Colors.white)),
          trailing: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text(
                 boolvalue? '${tr.sent}':'${tr.received}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  'Rs:${amount.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: CustomColor.BlackColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
