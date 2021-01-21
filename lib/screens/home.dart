import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  String userID;

  Home(this.userID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Home" + userID),
    );
  }
}
