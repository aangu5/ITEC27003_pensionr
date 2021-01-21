import 'package:firebase_demo/objects/user.dart';
import 'package:flutter/material.dart';

import '../storage/database.dart';
import 'first_name.dart';

class WelcomeScreen extends StatelessWidget {
  Database database = Database();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Pensionr",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
      ),
      body: Center(
        child: Column(
          children: [
            // Login Button
            Padding(
              padding: const EdgeInsets.all(20),
              child: new RaisedButton(
                onPressed: () {},
                textColor: Colors.white,
                color: Color(0xAAFF66F5),
                padding: const EdgeInsets.only(
                    top: 16.0, bottom: 16.0, left: 32, right: 32),
                child: Text('Login', style: TextStyle(fontSize: 40)),
              ),
            ),
            // Register Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                textColor: Colors.white,
                color: Color(0xAAFF66F5),
                padding: const EdgeInsets.only(
                    top: 16.0, bottom: 16.0, left: 32, right: 32),
                child: Text('Register', style: TextStyle(fontSize: 40)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              FirstNameScreen())); //bev do you love me?
                },
              ),
            ),
            RaisedButton(
                child: Text("Angus' test button"),
                onPressed: () {
                  User user = User();
                  user.firstName = "userName";
                  user.surname = "surName";
                  user.dateOfBirth = DateTime.now();
                  database.saveUser(user);
                }),
          ],
        ),
      ),
    );
  }
}
