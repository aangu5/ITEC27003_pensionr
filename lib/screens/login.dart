import 'package:firebase_demo/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PensionrAppBar("Logging in"),
      body: Column(
        children: [
          Text("Please enter your email address"),
          TextFormField(),
          Text("Please enter your password"),
          TextFormField(),
          RaisedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Home()),
            );
          })
        ],
      ),
    );
  }
}
