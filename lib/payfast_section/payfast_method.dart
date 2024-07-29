//
//
//
// // import 'package:com.classic.classicparts/Providers/methods_provider.dart';
// // import 'package:com.classic.classicparts/constants.dart';
// // import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// //
// // import '../Providers/authrememberprovider.dart';
// // import '../Providers/language_provider.dart';
// // import '../TransactionsSection/transaction_tabs.dart';
// // import '../separateAppfiles/TransactionScreens/cash_withdraw_screen.dart';
// // import '../separateAppfiles/TransactionScreens/cashtransfer_screen.dart';
// // import '../separateAppfiles/home_screen.dart';
// //
// // class AnimationTest extends StatefulWidget {
// //   const AnimationTest({super.key});
// //
// //   @override
// //   State<AnimationTest> createState() => _AnimationTestState();
// // }
// //
// // class _AnimationTestState extends State<AnimationTest> {
// //   bool selectedIndex=false;
// //   ScrollController _scrollController = ScrollController();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     _scrollController.addListener(() {
// //       Provider.of<MethodsProvider>(context, listen: false).scrollOffset =
// //           _scrollController.offset;
// //     });
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //   final screenHeight=MediaQuery.of(context).size.height;
// //   final screenWidth=MediaQuery.of(context).size.width;
// //   final scrolloffset=Provider.of<MethodsProvider>(context,listen: false).scrollOffset;
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         controller: _scrollController,
// //         child: Column(
// //           children: [
// //             Center(
// //               child: GestureDetector(
// //                 onTap: () {
// //                   setState(() {
// //                     selectedIndex = !selectedIndex;
// //                   });
// //                 },
// //                 child: AnimatedContainer(
// //                   duration: Duration(milliseconds: 900),
// //                   curve: Curves.easeInOut,
// //                   padding: const EdgeInsets.only(top: 5),
// //                   margin: const EdgeInsets.all(10),
// //                   height: selectedIndex?100:200,
// //                   width: selectedIndex? 300 : 300, // Enlarge selected container
// //                   decoration: BoxDecoration(
// //                     //color: selectedIndex == index ? Colors.white : Colors.grey,
// //                     borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15),
// //                       topLeft: Radius.circular(10),topRight: Radius.circular(10),
// //
// //                     ),
// //                     //gradient: CustomColor.bluishGradient,
// //
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Color(0xff8282821C).withOpacity(.2),
// //                         blurRadius: 10.0,
// //                         offset: const Offset(0.0, 0.0),
// //                       ),
// //                     ],
// //                   ),
// //                   child: Card(
// //                     elevation: 4,
// //                     color: CustomColor.DarkBlueColor,
// //                     shape: RoundedRectangleBorder(
// //                       borderRadius: BorderRadius.circular(20),
// //                     ),
// //                     child: Container(
// //                      // width: 320,
// //                       // padding: EdgeInsets.all(16),
// //                       decoration: BoxDecoration(
// //                         gradient: CustomColor.GradientColor,
// //                         shape: BoxShape.rectangle,
// //                         borderRadius: BorderRadius.circular(20),
// //                       ),
// //                       child: Stack(
// //
// //                         children: [
// //                           // GestureDetector(
// //                           //   onTap: () {
// //                           //     Navigator.of(context).push(MaterialPageRoute(
// //                           //         builder: (context) => TransactionTabsScreen()));
// //                           //   },
// //                           //   child: Align(
// //                           //     alignment: Alignment.topRight,
// //                           //     child: Card(
// //                           //       elevation: 4,
// //                           //       color: CustomColor.WhiteColor,
// //                           //       shape: RoundedRectangleBorder(
// //                           //         borderRadius: BorderRadius.circular(10),
// //                           //       ),
// //                           //       child: Container(
// //                           //         decoration: BoxDecoration(
// //                           //           borderRadius: BorderRadius.circular(10),
// //                           //           color: CustomColor.WhiteColor,
// //                           //         ),
// //                           //         padding: EdgeInsets.all(5),
// //                           //         child: Column(
// //                           //           mainAxisAlignment: MainAxisAlignment.center,
// //                           //           children: [
// //                           //             Icon(Icons.receipt, color: CustomColor.BlackColor),
// //                           //             SizedBox(height: 3),
// //                           //             Text(
// //                           //               "History",
// //                           //               style: TextStyle(color: CustomColor.BlackColor,fontSize: 10),
// //                           //             ),
// //                           //           ],
// //                           //         ),
// //                           //       ),
// //                           //     )
// //                           //   ),
// //                           // ),
// //                           Consumer<LanguageProvider>(builder: (context, provider, child) {
// //                             return GestureDetector(
// //                                 onTap: () {
// //
// //                                 },
// //                                 child: Text(
// //                                   'Cash Wallet',
// //                                   style: TextStyle(
// //                                       fontSize: 20,
// //                                       fontWeight: FontWeight.bold,
// //                                       color: Colors.white),
// //                                 ));
// //                           }),
// //                           SizedBox(height: 10),
// //                           Consumer<RememberMeProvider>(
// //                             builder: (BuildContext context, value, Widget? child) {
// //                               return Text(
// //                                 'Rs ${value.userCredit=='null'?'0':value.userCredit}',
// //                                 style: TextStyle(
// //                                     fontSize: 24,
// //                                     fontWeight: FontWeight.bold,
// //                                     color: Colors.white),
// //                               );
// //                             },
// //
// //                           ),
// //                           SizedBox(height: 20),
// //
// //                           if(selectedIndex==false)
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                             children: [
// //                               SizedBox(),
// //                               GestureDetector(
// //                                   onTap: () {
// //                                     Navigator.of(context).push(MaterialPageRoute(
// //                                         builder: (context) => CashWithdrawScreen()));
// //                                   },
// //                                   child: SmallCard(
// //                                       icon: Icons.credit_card,
// //                                       text: 'Withdraw')),
// //                               GestureDetector(
// //                                   onTap: () {
// //                                     Navigator.of(context).push(MaterialPageRoute(
// //                                         builder: (context) => TransactionTabsScreen()));
// //                                   },
// //                                   child: SmallCard(
// //                                       icon: Icons.receipt,
// //                                       text: 'History')),
// //                             ],
// //                           ),
// //                           AnimatedPositioned(
// //                             duration: Duration(seconds: 1),
// //                             left: selectedIndex?200:10,
// //                             bottom: 10,
// //                             child: GestureDetector(
// //                                 onTap: () {
// //                                   Navigator.of(context).push(MaterialPageRoute(
// //                                       builder: (context) => CashTransactionScreen()));
// //                                 },
// //                                 child: SmallCard(
// //                                     icon: Icons.send,
// //                                     text: 'send')),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             Container(
// //               height: 800,
// //               color: Colors.red,
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// ///big test
// import 'package:com.classic.classicparts/Providers/methods_provider.dart';
// import 'package:com.classic.classicparts/constants.dart';
// import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../Providers/authrememberprovider.dart';
// import '../Providers/language_provider.dart';
// import '../TransactionsSection/transaction_tabs.dart';
// import '../separateAppfiles/TransactionScreens/cash_withdraw_screen.dart';
// import '../separateAppfiles/TransactionScreens/cashtransfer_screen.dart';
// import '../separateAppfiles/home_screen.dart';
//
// class AnimationTest extends StatefulWidget {
//   const AnimationTest({super.key});
//
//   @override
//   State<AnimationTest> createState() => _AnimationTestState();
// }
//
// class _AnimationTestState extends State<AnimationTest> {
//   bool selectedIndex=false;
//   ScrollController _scrollController = ScrollController();
//   double scrollOffset=10;
//   double scrollOffset2=0;
//   double newPosition=0;
//   double reversedValue=200;
//   double reversedValuePadding=90;
//   @override
//   void initState() {
//     super.initState();
//
//     // Listen to scroll events
//     _scrollController.addListener(() {
//       // Access the current scroll position
//
//       setState(() {
//         scrollOffset = //_scrollController.offset;
//         _scrollController.offset.clamp(0.0, 100.0);
//         scrollOffset2 = //_scrollController.offset;
//         _scrollController.offset.clamp(10.0, 90.0);
//       });
//       // Your logic to determine position based on scrolling
//      newPosition = calculateNewPosition(scrollOffset);
//
//       // Print the current scroll offset and the calculated position
//       print('Scroll Offset: $scrollOffset, New Position: $newPosition');
//       // Calculate reversed value from 200 to 100
//        reversedValue = 200.0 - scrollOffset;
//        reversedValuePadding = 100.0 - scrollOffset2;
//      // reversedValuePadding = reversedValuePadding.clamp(90, 200.0);
//
//       // Ensure the reversed value is within the desired range
//       reversedValue = reversedValue.clamp(100.0, 200.0);
//
//       print('Reversed Value: $reversedValue');
//     });
//   }
//
//   double calculateNewPosition(double scrollOffset) {
//     // Your logic to determine the new position based on scrolling
//     // Replace this with your own calculations
//     return scrollOffset*2; // Adjust as needed
//   }
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight=MediaQuery.of(context).size.height;
//     final screenWidth=MediaQuery.of(context).size.width;
//    // final scrolloffset=Provider.of<MethodsProvider>(context,listen: false).scrollOffset;
//     return Scaffold(
//       body: Column(
//         children: [
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedIndex = !selectedIndex;
//               });
//             },
//             child: AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//              // curve: Curves.easeInOut,
//               padding: const EdgeInsets.only(top: 5),
//               margin: const EdgeInsets.all(10),
//               height: reversedValue,
//               width: selectedIndex? 300 : 300, // Enlarge selected container
//               decoration: BoxDecoration(
//                 //color: selectedIndex == index ? Colors.white : Colors.grey,
//                 borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15),
//                   topLeft: Radius.circular(10),topRight: Radius.circular(10),
//
//                 ),
//                 //gradient: CustomColor.bluishGradient,
//
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color(0xff8282821C).withOpacity(.2),
//                     blurRadius: 10.0,
//                     offset: const Offset(0.0, 0.0),
//                   ),
//                 ],
//               ),
//               child: Card(
//                 elevation: 4,
//                 color: CustomColor.DarkBlueColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Container(
//                   // width: 320,
//                   // padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     gradient: CustomColor.GradientColor,
//                     shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Stack(
//
//                     children: [
//                       // GestureDetector(
//                       //   onTap: () {
//                       //     Navigator.of(context).push(MaterialPageRoute(
//                       //         builder: (context) => TransactionTabsScreen()));
//                       //   },
//                       //   child: Align(
//                       //     alignment: Alignment.topRight,
//                       //     child: Card(
//                       //       elevation: 4,
//                       //       color: CustomColor.WhiteColor,
//                       //       shape: RoundedRectangleBorder(
//                       //         borderRadius: BorderRadius.circular(10),
//                       //       ),
//                       //       child: Container(
//                       //         decoration: BoxDecoration(
//                       //           borderRadius: BorderRadius.circular(10),
//                       //           color: CustomColor.WhiteColor,
//                       //         ),
//                       //         padding: EdgeInsets.all(5),
//                       //         child: Column(
//                       //           mainAxisAlignment: MainAxisAlignment.center,
//                       //           children: [
//                       //             Icon(Icons.receipt, color: CustomColor.BlackColor),
//                       //             SizedBox(height: 3),
//                       //             Text(
//                       //               "History",
//                       //               style: TextStyle(color: CustomColor.BlackColor,fontSize: 10),
//                       //             ),
//                       //           ],
//                       //         ),
//                       //       ),
//                       //     )
//                       //   ),
//                       // ),
//                       Positioned(
//                         left: reversedValuePadding,
//                         top: 20,
//                         child: Consumer<LanguageProvider>(builder: (context, provider, child) {
//                           return GestureDetector(
//                               onTap: () {
//
//                               },
//                               child: Text(
//                                 'Cash Wallet',
//                                 style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white),
//                               ));
//                         }),
//                       ),
//                       SizedBox(height: 10),
//                       Positioned(
//                         left: reversedValuePadding,
//                         top: 50,
//                         child: Consumer<RememberMeProvider>(
//                           builder: (BuildContext context, value, Widget? child) {
//                             return Text(
//                               'Rs ${value.userCredit=='null'?'0':value.userCredit}',
//                               style: TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                             );
//                           },
//
//                         ),
//                       ),
//                       SizedBox(height: 20),
//
//                       if(scrollOffset<30)
//                         Positioned(
//                           bottom: 10,
//                           right: 10,
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               SizedBox(),
//                               GestureDetector(
//                                   onTap: () {
//                                     Navigator.of(context).push(MaterialPageRoute(
//                                         builder: (context) => CashWithdrawScreen()));
//                                   },
//                                   child: SmallCard(
//                                       icon: Icons.credit_card,
//                                       text: 'Withdraw'),
//                               ),
//                               GestureDetector(
//                                   onTap: () {
//                                     Navigator.of(context).push(MaterialPageRoute(
//                                         builder: (context) => TransactionTabsScreen()));
//                                   },
//                                   child: SmallCard(
//                                       icon: Icons.receipt,
//                                       text: 'History')),
//                             ],
//                           ),
//                         ),
//                       AnimatedPositioned(
//                         duration: Duration(milliseconds: 300),
//                         left: newPosition,
//                         bottom:10,// scrollOffset,
//                         child: GestureDetector(
//                             onTap: () {
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (context) => CashTransactionScreen()));
//                             },
//                             child: SmallCard(
//                                 icon: Icons.send,
//                                 text: 'send')),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               controller: _scrollController,
//               child: Column(
//                 children: [
//                   Container(
//                     height: 700,
//                     color: Colors.red,
//                   ),
//                   Container(
//                     height: 700,
//                     color: Colors.blue,
//                   ),
//                   Container(
//                     height: 700,
//                     color: Colors.green,
//                   ),
//
//
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// ///small test
//
// // import 'package:flutter/material.dart';
// //
// //
// //
// // class AnimationTest extends StatefulWidget {
// //   @override
// //   _AnimationTestState createState() => _AnimationTestState();
// // }
// //
// // class _AnimationTestState extends State<AnimationTest> {
// //   ScrollController _scrollController = ScrollController();
// //   double scrollOffset=30;
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     // Listen to scroll events
// //     _scrollController.addListener(() {
// //       // Access the current scroll position
// //
// // setState(() {
// //   scrollOffset = //_scrollController.offset;
// //   _scrollController.offset.clamp(30.0, 100.0);
// // });
// //       // Your logic to determine position based on scrolling
// //       double newPosition = calculateNewPosition(scrollOffset);
// //
// //       // Print the current scroll offset and the calculated position
// //       print('Scroll Offset: $scrollOffset, New Position: $newPosition');
// //     });
// //   }
// //
// //   double calculateNewPosition(double scrollOffset) {
// //     // Your logic to determine the new position based on scrolling
// //     // Replace this with your own calculations
// //     return scrollOffset; // Adjust as needed
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Scrolling Example'),
// //       ),
// //       body: ListView.builder(
// //         controller: _scrollController,
// //         itemCount: 50,
// //         itemBuilder: (context, index) {
// //           return SizedBox(
// //             height: scrollOffset,
// //             child: ListTile(
// //               title: Text('Item $index'),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
