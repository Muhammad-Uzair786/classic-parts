import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return new MyHomePageState();
  }
}
class MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  static final List<String> _listViewData = [
    "Bajarangisoft.com",
    "Flutter",
    "Android",
    "iOS",
    "React Native",
    "Php",
    "Core Java",
    "Laravel",
    "Javascript",
    "Jquery",
    "Python",
  ];

  List<ExpansionTile> _listOfExpansions = List<ExpansionTile>.generate(
      11,
          (i) => ExpansionTile(
        title: Text("Expansion $i",
          style: TextStyle(color: Colors.blue[800]),
        ),
        children: _listViewData
            .map((data) => ListTile(
          leading: Icon(Icons.person),
          title: Text(data),
          subtitle: Text("a subtitle here"),
        ))
            .toList(),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text("ExpansionTile Drawer"),
      ),
      drawer: Container(
        width: 200,
        child: NavigationDrawer(
          children: _listOfExpansions.map((expansionTile) => expansionTile).toList(),

        ),
      ),
      body: Center(
        child: Text('Main Body'),
      ),
    );
  }
}
















// import 'package:flutter/material.dart';
//
// class ExpansionPanelExample extends StatefulWidget {
//   @override
//   _ExpansionPanelExampleState createState() => _ExpansionPanelExampleState();
// }
//
// class _ExpansionPanelExampleState extends State<ExpansionPanelExample> {
//   List<Item> _items = [
//     Item(
//       headerValue: 'Panel 1',
//       expandedValue: 'Panel 1 Content',
//       isExpanded: false,
//     ),
//     Item(
//       headerValue: 'Panel 2',
//       expandedValue: 'Panel 2 Content',
//       isExpanded: false,
//     ),
//     Item(
//       headerValue: 'Panel 3',
//       expandedValue: 'Panel 3 Content',
//       isExpanded: false,
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Expansion Panel Example'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(16.0),
//           child: ExpansionPanelList(
//             elevation: 1,
//             expandedHeaderPadding: EdgeInsets.zero,
//             expansionCallback: (int index, bool isExpanded) {
//               setState(() {
//                 _items[index].isExpanded = !isExpanded;
//               });
//             },
//             children: _items.map<ExpansionPanel>((Item item) {
//               return ExpansionPanel(
//                 headerBuilder: (BuildContext context, bool isExpanded) {
//                   return ListTile(
//                     title: Text(item.headerValue),
//
//                   );
//                 },
//                 body: ListTile(
//                   title: Text(item.expandedValue),
//                 ),
//                 isExpanded: item.isExpanded,
//               );
//             }).toList(),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class Item {
//   Item({
//     required this.headerValue,
//     required this.expandedValue,
//     required this.isExpanded,
//   });
//
//   String headerValue;
//   String expandedValue;
//   bool isExpanded;
// }
