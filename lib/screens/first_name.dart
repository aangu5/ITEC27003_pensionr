import 'package:firebase_demo/objects/user.dart';
import 'package:flutter/material.dart';

import 'last_name.dart';

class FirstNameScreen extends StatefulWidget {
  FirstNameScreen();

  @override
  _FirstNameScreenState createState() => _FirstNameScreenState();
}

class _FirstNameScreenState extends State<FirstNameScreen> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  Widget build(BuildContext context) {
    User user = User();

    return Scaffold(
      appBar: AppBar(
        title: Text('Firstname'),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: _controller,
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Firstname'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              child: Center(child: Text('Submit')),
              onPressed: () {
                user.firstName = _controller.value.text;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LastNameScreen(user)));
              },
            ),
          )
        ],
      ),
    );
  }
}
