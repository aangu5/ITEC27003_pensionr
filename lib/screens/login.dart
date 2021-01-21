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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Please enter your email address"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              autofocus: true,
              autocorrect: true,
              decoration: InputDecoration(
                  focusColor: Colors.pink[200],
                  border: OutlineInputBorder(),
                  labelText: 'Email address'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Please enter your password"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              autofocus: true,
              autocorrect: true,
              decoration: InputDecoration(
                  focusColor: Colors.pink[200],
                  hoverColor: Colors.pink[200],
                  border: OutlineInputBorder(),
                  labelText: 'Password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
                child: Text("Login"),
                color: Colors.pink[200],
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                        (Route<dynamic> route) => false,
                  );
                }),
          )
        ],
      ),
    );
  }
}
