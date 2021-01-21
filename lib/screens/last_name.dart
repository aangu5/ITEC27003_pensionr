import 'package:firebase_demo/objects/user.dart';
import 'package:firebase_demo/screens/date_of_birth.dart';
import 'package:flutter/material.dart';

class LastNameScreen extends StatefulWidget {
  User user;

  LastNameScreen(this.user) : super();

  @override
  _LastNameScreenState createState() => _LastNameScreenState(user);
}

class _LastNameScreenState extends State<LastNameScreen> {
  TextEditingController _controller;
  User user;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  _LastNameScreenState(this.user);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lastname'),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
      ),
      body: Column(
        children: [
          Center(
            child: TextField(
              controller: _controller,
              autofocus: true,
              autocorrect: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Lastname'),
            ),
          ),
          RaisedButton(
            child: Center(child: Text('Submit')),
            onPressed: () {
              user.surname = _controller.value.text;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DateOfBirthScreen(user)));
            },
          )
        ],
      ),
    );
  }
}
