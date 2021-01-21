import 'package:firebase_demo/screens/welcome.dart';
import 'package:firebase_demo/widgets/appbar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PensionrAppBar("Settings"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomeScreen()),
                          (Route<dynamic> route) => false,
                    );
                  },
                  color: Colors.red[200],
                  child: Text("Logoff"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
