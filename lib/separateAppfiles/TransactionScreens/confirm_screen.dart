// import 'package:flutter/material.dart';
//
// class CustomCard extends StatelessWidget {
//   final String userName;
//   final String ownerName;
//   final String phoneNumber;
//
//   CustomCard({
//     required this.userName,
//     required this.ownerName,
//     required this.phoneNumber,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             RoundedCard(text: 'jdkfkjdj',),
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//               elevation: 4.0,
//               child: Theme(
//                 data: ThemeData(
//                   dividerColor: Colors.transparent, // Remove the divider line
//                 ),
//                 child: ExpansionTile(
//                   leading: Icon(Icons.person),
//                   title: Text(userName),
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Owner: $ownerName',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               Text('Phone: $phoneNumber'),
//                             ],
//                           ),
//                           Icon(Icons.phone),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CashTransactionScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cash Transaction'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             CustomCard(
//               userName: 'John Doe',
//               ownerName: 'Jane Smith',
//               phoneNumber: '+1234567890',
//             ),
//             SizedBox(height: 16.0),
//             CustomCard(
//               userName: 'Alice Johnson',
//               ownerName: 'Bob Williams',
//               phoneNumber: '+9876543210',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
// class RoundedCard extends StatelessWidget {
//   final String text;
//
//   RoundedCard({required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       elevation: 4.0,
//       child: Container(
//         width: 200,
//         height: 100,
//         alignment: Alignment.center,
//         child: Text(
//           text,
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
//
// class TextWithRoundedCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Text with Rounded Card'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text(
//               'Top Text',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16.0),
//             RoundedCard(
//               text: 'Centered Text',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
