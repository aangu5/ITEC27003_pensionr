import 'package:firebase_demo/objects/user.dart';
import 'package:firebase_demo/screens/date_of_birth.dart';
import 'package:firebase_demo/widgets/appbar.dart';
import 'package:flutter/material.dart';

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
      appBar: PensionrAppBar("What should we call you?"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("What is your first name?", style: TextStyle(fontSize: 32),),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: TextField(
                controller: _controller,
                autofocus: true,
                autocorrect: true,
                decoration: InputDecoration(
                  focusColor: Colors.pink[200],
                    border: OutlineInputBorder(), labelText: 'Firstname'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              child: Center(child: Text('Submit')),
              onPressed: () {
                if (_controller.value.text.isNotEmpty) {
                  user.firstName = _controller.value.text;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DateOfBirthScreen(user)));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
