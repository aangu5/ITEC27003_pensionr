import 'dart:async';

import 'package:firebase_demo/objects/user.dart';
import 'package:firebase_demo/screens/chat_lists.dart';
import 'package:firebase_demo/storage/database.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class DateOfBirthScreen extends StatefulWidget {
  User user;
  DateOfBirthScreen(this.user);

  @override
  _DateOfBirthScreenState createState() => _DateOfBirthScreenState(user);
}

class _DateOfBirthScreenState extends State<DateOfBirthScreen> {
  DateTime selectedDate = DateTime.now();
  Database database = Database();
  User currentUser;

  _DateOfBirthScreenState(this.currentUser);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Date of Birth"),
        centerTitle: true,
        backgroundColor: Colors.pink[200],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),
            RaisedButton(
                child: Text("Confirm Date of Birth"),
                onPressed: () {
                  currentUser.dateOfBirth = selectedDate;
                  database.saveUser(currentUser);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ChatListScreen()));
                  //registeringUser.setDate(selectedDate) or equivalent
                }),
          ],
        ),
      ),
    );
  }
}
