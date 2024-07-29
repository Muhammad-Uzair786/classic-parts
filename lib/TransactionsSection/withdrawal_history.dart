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
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/encashments_model.dart';
import 'package:com.classic.classicparts/separateAppfiles/ApiModels/transactions_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Auth/sign_up_Screen.dart';
import '../constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WithdrawalHistoryScreen extends StatefulWidget {
  @override
  _WithdrawalHistoryScreenState createState() =>
      _WithdrawalHistoryScreenState();
}

class _WithdrawalHistoryScreenState extends State<WithdrawalHistoryScreen> {
  // List<Transaction> transactions = [
  //   Transaction(receiverName: 'John Doe', transactionDate: 'Wednesday,Aug-2-2023', amount: 100.0, receiverMobile: '03214444521'),
  //   Transaction(receiverName: 'Jane Smith', transactionDate: 'Tuesday,Aug-1-2023', amount: 50.0, receiverMobile: '0345667789'),
  //   Transaction(receiverName: 'Alice Johnson', transactionDate: 'Tuesday,Aug-1-2023', amount: 75.0, receiverMobile: '032122345'),
  //   // Add more transaction data here...
  // ];
  //
  // List<Transaction> filteredTransactions = [];
  // Map<String, List<Transaction>> groupedTransactions = {};
  //
  TextEditingController searchController = TextEditingController();

  //
  // @override
  // void initState() {
  //   super.initState();
  //   filteredTransactions = transactions;
  //   searchController.addListener(filterTransactions);
  //   groupTransactionsByDate();
  // }
  //
  // void groupTransactionsByDate() {
  //   groupedTransactions.clear();
  //   for (var transaction in transactions) {
  //     String date = transaction.transactionDate;
  //     if (groupedTransactions[date] == null) {
  //       groupedTransactions[date] = [];
  //     }
  //     groupedTransactions[date]!.add(transaction);
  //   }
  // }
  //
  // void filterTransactions() {
  //   String query = searchController.text.toLowerCase();
  //   setState(() {
  //     filteredTransactions = transactions.where((transaction) {
  //       return transaction.receiverName.toLowerCase().contains(query);
  //     }).toList();
  //   });
  // }
// Convert role label to role index
  int selectedRoleIndex = 4; // Default to Wholesaler role index

  int labelToRoleIndex(String label) {
    switch (label) {
      case 'Pending':
        return 4;
      case 'Completed':
        return 3;
      case 'Rejected':
        return 2;
      default:
        return 4; // Default to Wholesaler
    }
  }

  // Convert role index to label
  String selectedRoleIndexToLabel(int index) {
    switch (index) {
      case 4:
        return 'Pending';
      case 3:
        return 'Completed';
      case 2:
        return 'Rejected';
      default:
        return 'Pending';
    }
  }

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ///seachfield if need
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 16),
          //   margin: EdgeInsets.symmetric(horizontal: 16),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[50],
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: TextField(
          //           controller: searchController,
          //           // onSubmitted: _onSearchSubmitted,
          //           cursorColor: CustomColor.BlackColor,
          //           decoration: InputDecoration(
          //             hintText: "Search your product",
          //
          //             hintStyle: TextStyle(color: CustomColor.TextGreyColor,fontSize: 15),
          //             border: InputBorder.none,
          //
          //           ),
          //         ),
          //       ),
          //       IconButton(
          //         icon: Icon(Icons.search,color: Colors.grey,),
          //         onPressed: () {
          //           // _onSearchSubmitted(_searchController.text);
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(height: 20,),

          Expanded(
            child: FutureBuilder<EncashmentsModel>(
                future: Provider.of<ApiProvider>(context, listen: false)
                    .WithdrawalHistory(context),
                builder: (context, AsyncSnapshot<EncashmentsModel> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset("asset/applogo.png")));
                  }
                  if (snapshot.data?.encashments == 'null') {
                    return Center(child: Text("${tr.no_transactions}"));
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        StatusButtons(
                          selectedRole:
                              selectedRoleIndexToLabel(selectedRoleIndex),
                          onChanged: (label) {
                            setState(() {
                              selectedRoleIndex = labelToRoleIndex(label);
                            });
                          },
                        ),
                        // ExtractedListView(itemCount: snapshot.data?.encashments?.pendingEncashments?.length, EncashmentlistItem: snapshot.data?.encashments?.pendingEncashments,)
                        selectedRoleIndex == 4 &&snapshot.data?.encashments?.pendingEncashments!=null
                            ? Flexible(
                                child: ListView.builder(
                                  itemCount: snapshot.data?.encashments
                                      ?.pendingEncashments?.length,
                                  itemBuilder: (context, index) {
                                    final list=snapshot.data?.encashments
                                        ?.pendingEncashments?.reversed.toList();
                                    PendingEncashments? EncashmentItem =list?[index];
                                        // snapshot.data?.encashments
                                        //     ?.pendingEncashments?[index];
                                    DateTime dateTime = DateTime.parse(
                                        EncashmentItem!.createdAt.toString());
                                    String formattedDateTime =
                                        DateFormat('MMMM d, y - hh:mm a')
                                            .format(dateTime);

                                    print(
                                        'Formatted DateTime: $formattedDateTime');

                                    return Column(
                                      children: [
                                        TransactionDateCard(
                                            date: formattedDateTime.toString()),
                                        TransactionCard(
                                          name: EncashmentItem.accountName,
                                          phone: EncashmentItem.phoneNumber,
                                          amount: EncashmentItem.amount,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ):selectedRoleIndex == 4 &&snapshot.data?.encashments?.pendingEncashments==null?Center(child: Text("No Pending request"),)
                            : selectedRoleIndex == 3 && snapshot.data?.encashments?.successfulEncashments!=null
                                ? Flexible(
                                    child: ListView.builder(
                                      itemCount: snapshot.data?.encashments
                                          ?.successfulEncashments?.length,
                                      itemBuilder: (context, index) {
                                       final list= snapshot.data?.encashments
                                            ?.successfulEncashments?.reversed.toList();
                                        SuccessfulEncashments? EncashmentItem =list?[index];
                                            // snapshot.data?.encashments
                                            //     ?.successfulEncashments?[index];
                                        DateTime dateTime = DateTime.parse(
                                            EncashmentItem!.createdAt
                                                .toString());
                                        String formattedDateTime =
                                            DateFormat('MMMM d, y - hh:mm a')
                                                .format(dateTime);

                                        print(
                                            'Formatted DateTime: $formattedDateTime');

                                        return Column(
                                          children: [
                                            TransactionDateCard(
                                                date: formattedDateTime
                                                    .toString()),
                                            TransactionCard(
                                              name: EncashmentItem.accountName,
                                              phone: EncashmentItem.phoneNumber,
                                              amount: EncashmentItem.amount,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ):selectedRoleIndex == 3 && snapshot.data?.encashments?.successfulEncashments==null?Center(child: Text("${tr.no_completed_request}"),)
                                :selectedRoleIndex == 2 && snapshot.data?.encashments?.rejectedEncashments!=null? Flexible(

                                    child: ListView.builder(
                                      itemCount: snapshot.data?.encashments
                                          ?.rejectedEncashments?.length,
                                      itemBuilder: (context, index) {
                                       final list= snapshot.data?.encashments
                                            ?.rejectedEncashments?.reversed.toList();
                                        RejectedEncashments? EncashmentItem =list?[index];
                                        //above string reversed for filter
                                            // snapshot.data?.encashments
                                            //     ?.rejectedEncashments?[index];
                                        DateTime dateTime = DateTime.parse(
                                            EncashmentItem!.createdAt
                                                .toString());
                                        String formattedDateTime =
                                            DateFormat('MMMM d, y - hh:mm a')
                                                .format(dateTime);

                                        print(
                                            'Formatted DateTime: $formattedDateTime');

                                        return Column(
                                          children: [
                                            TransactionDateCard(
                                                date: formattedDateTime
                                                    .toString()),
                                            TransactionCard(
                                              name: EncashmentItem.accountName,
                                              phone: EncashmentItem.phoneNumber,
                                              amount: EncashmentItem.amount,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ):Center(child: Text("${tr.no_rejected_request}"),),
                      ],
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

///
// class ExtractedListView extends StatelessWidget {
//   int? itemCount;
//   List<PendingEncashments>? pendingEncashments;
//   List<SuccessfulEncashments>? successfulEncashments;
//   List<RejectedEncashments>? rejectedEncashments;
//
//   ExtractedListView(
//       {required this.itemCount,
//       this.pendingEncashments,
//       this.successfulEncashments,
//       this.rejectedEncashments});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 150,
//       child: ListView.builder(
//         itemCount: snapshot.data?.encashments?.pendingEncashments?.length,
//         itemBuilder: (context, index) {
//           PendingEncashments? EncashmentItem = snapshot.data
//               ?.encashments?.pendingEncashments?[index];
//           DateTime dateTime = DateTime.parse(
//               EncashmentItem!.createdAt.toString());
//           String formattedDateTime =
//           DateFormat('MMMM d, y - hh:mm a')
//               .format(dateTime);
//
//           print('Formatted DateTime: $formattedDateTime');
//
//           return Column(
//             children: [
//               TransactionDateCard(
//                   date: formattedDateTime.toString()),
//               TransactionCard(
//                 name: EncashmentItem.accountName,
//                 phone: EncashmentItem.phoneNumber,
//                 amount: EncashmentItem.amount,
//                 boolvalue: true,
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

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
  final phone;
  final amount;
  bool? boolvalue;
  final statusValue;

  TransactionCard(
      {this.name,
      required this.phone,
      required this.amount,
      this.boolvalue,
      this.statusValue});

  @override
  Widget build(BuildContext context) {
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
          contentPadding:EdgeInsets.only(right: 8,left: 8),
          leading: CircleAvatar(
            backgroundColor: CustomColor.BlueColor,
            child: Icon(Icons.paid, color: Colors.white),
          ),
          title: SizedBox(
            child: Text(
              name,maxLines: 2,overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          ),
          subtitle:
              Text(phone, style: TextStyle(color: Colors.white)),
          trailing: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   boolvalue == true
                //       ? 'Sent'
                //       : boolvalue == false
                //       ? 'Received'
                //       : '',
                //   style: TextStyle(
                //       fontSize: 18,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.white),
                // ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.34,

                  child: Text(
                    'Rs:${amount}',maxLines: 1,overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.BlackColor,

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///
class StatusButtons extends StatefulWidget {
  final String selectedRole;
  final ValueChanged<String> onChanged;

  StatusButtons({required this.selectedRole, required this.onChanged});

  @override
  _StatusButtonsState createState() => _StatusButtonsState();
}

class _StatusButtonsState extends State<StatusButtons> {

  @override
  Widget build(BuildContext context) {
    var tr= AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildButton('${tr.pending}', 'Pending'),
              _buildButton('${tr.completed}', 'Completed'),
              _buildButton('${tr.rejected}', 'Rejected'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String label, String role) {
    bool isSelected = widget.selectedRole == role;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: () {
          widget.onChanged(role);
        },
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: isSelected ? CustomColor.GradientColor : null,
            color: isSelected ? null : Colors.grey[300],
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
