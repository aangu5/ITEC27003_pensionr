import 'package:firebase_demo/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../storage/database.dart';
import 'first_name.dart';

class WelcomeScreen extends StatelessWidget {
  Database database = Database();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/img/splash.png"))),
        child: Center(
          child: Column(
            children: [
              Spacer(
                flex: 98,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: SvgPicture.asset("assets/img/Pensionr.svg")),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 20),
                child: Center(child: Text("Ready to find love?", style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20, color: Colors.white),)),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: new RaisedButton(
                  textColor: Colors.black,
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 10.0, left: 16, right: 16),
                  child: Text('Sign up for free', style: TextStyle(fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FirstNameScreen()));
                  },
                ),
              ),
              // Login Button
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: new TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    // textColor: Colors.pink[200],
                    // color: Colors.white,
                    // padding: const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 150, right: 150),
                    child: Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              // Register Button
            ],
          ),
        ),
      ),
    );
  }
}
