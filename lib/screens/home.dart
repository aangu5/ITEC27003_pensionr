import 'package:firebase_demo/screens/chat_lists.dart';
import 'package:firebase_demo/screens/settings.dart';
import 'package:firebase_demo/screens/swipe.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  String userID;

  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final Set<Widget> _children = {
    SwipingScreen(),
    ChatListScreen(),
    SettingsScreen(),
  };

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTabTapped,
        fixedColor: Colors.pink[200],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Swipe",),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
