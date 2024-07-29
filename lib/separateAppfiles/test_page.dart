import 'package:flutter/material.dart';



class TestPage extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController(text: "Initial Text");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Editable TextField'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Edit me',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
