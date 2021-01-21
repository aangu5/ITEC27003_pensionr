import 'package:firebase_demo/screens/login.dart';
import 'package:firebase_demo/widgets/appbar.dart';
import 'package:flutter/material.dart';

import '../storage/database.dart';
import 'first_name.dart';

class WelcomeScreen extends StatelessWidget {
  Database database = Database();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PensionrAppBar("Welcome to Pensionr!"),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
                colorFilter: ColorFilter.linearToSrgbGamma(),
                image: NetworkImage(
                    "https://i.pinimg.com/originals/b0/2d/f8/b02df84d857694d12b99838601f9805e.jpg"))),
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                    child: Text(
                  "Are you ready to fall in love?",
                  style: TextStyle(fontSize: 24, color: Colors.black),
                  textAlign: TextAlign.center,
                )),
              ),
              Spacer(
                flex: 98,
              ),
              // Login Button
              Padding(
                padding: const EdgeInsets.all(20),
                child: new RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  textColor: Colors.black,
                  color: Color(0xAAFF66F5).withOpacity(0.50),
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 32, right: 32),
                  child: Text('Login', style: TextStyle(fontSize: 40)),
                ),
              ),
              // Register Button
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RaisedButton(
                  textColor: Colors.black,
                  color: Color(0xAAFF66F5).withOpacity(0.50),
                  padding: const EdgeInsets.only(
                      top: 16.0, bottom: 16.0, left: 32, right: 32),
                  child: Text('Register', style: TextStyle(fontSize: 40)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                FirstNameScreen()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
