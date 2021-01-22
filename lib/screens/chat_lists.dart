import 'package:firebase_demo/objects/user.dart';
import 'package:firebase_demo/screens/chat.dart';
import 'package:firebase_demo/storage/local_storage.dart';
import 'package:firebase_demo/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  List<User> matches = new List<User>();

  @override
  Widget build(BuildContext context) {
    matches = LocalStorage.matches;
    int length;
    if (matches == null) {
      length = 0;
    } else {
      length = matches.length;
    }
    return Scaffold(
        appBar: PensionrAppBar("Chat"),
        body: length != 0 ? ListView.builder(
            itemCount: length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(matches[index].imageURL),
                ),
                title: Text(matches[index].firstName),
                subtitle: Text(matches[index].bio),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ChatScreen(user: matches[index])));
                },
              );
            }) : Center(child: Text("There's no messages yet....")));
  }
}
