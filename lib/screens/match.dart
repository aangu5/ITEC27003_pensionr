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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: Text("Woohoo!"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
