import 'package:firebase_demo/widgets/appbar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PensionrAppBar("Settings"),
      body: Text("Insert some settings here..."),
    );
  }
}
