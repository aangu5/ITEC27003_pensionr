import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_demo/objects/user.dart';
import 'package:flutter/material.dart';

class MatchPopUpScreen extends StatelessWidget {
  User user;

  MatchPopUpScreen(this.user);

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      content: Text("It's a match! Why not message ${user.firstName} and see how you get on?"),
      actions: [
        RaisedButton(
          child: Text("Message"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        RaisedButton(
          child: Text("Dismiss"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
