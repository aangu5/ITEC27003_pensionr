import 'dart:async';

import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_demo/objects/user.dart';
import 'package:firebase_demo/screens/chat_lists.dart';
import 'package:firebase_demo/screens/swipe.dart';
import 'package:firebase_demo/storage/database.dart';
import 'package:firebase_demo/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class DateOfBirthScreen extends StatefulWidget {
  User user;

  DateOfBirthScreen(this.user);

  @override
  _DateOfBirthScreenState createState() => _DateOfBirthScreenState(user);
}

class _DateOfBirthScreenState extends State<DateOfBirthScreen> {
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 18250));
  Database database = Database();
  User currentUser;
  var format = DateFormat("dd/MM/yyyy");

  _DateOfBirthScreenState(this.currentUser);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now().subtract(Duration(days: 18250)));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PensionrAppBar("Don't be offended"),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "When were you born?", style: TextStyle(fontSize: 32),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                format.format(selectedDate), style: TextStyle(fontSize: 32),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              child: Center(child: Text('Confirm date of birth')),
              onPressed: () {
                currentUser.dateOfBirth = selectedDate;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                      (Route<dynamic> route) => false,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
