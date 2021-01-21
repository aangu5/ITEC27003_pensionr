import 'package:firebase_demo/objects/chats.dart';
import 'package:firebase_demo/objects/users.dart';
import 'package:flutter/material.dart';

import 'chat.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("big brain"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://miro.medium.com/max/2560/1*3t2QJIYXuxKAs6CnX2W9hw.jpeg"),
            ),
            title: Text('Margaret, 85'),
            subtitle: Text("Help, I can’t find my spectacles ..."),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ChatScreen(user: margaret, messages: margaretChats)),
              );
            },
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://lh3.googleusercontent.com/proxy/e7Xg_A9KdtvrWWGdCOwTi4UFLoi16gyxRzwM4lxiNLxxWxSv506QDeTid_8GV4M0iqxg0o4M4l6knoWlfCxu2pD4OvRtPKWQQKCTp9nX3KVfYQ"),
            ),
            title: Text('Elizabeth, 78'),
            subtitle: Text("I haven’t felt a man’s touch in y..."),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/originals/aa/8f/72/aa8f72e966c8b26a1e1d837755bd7f23.jpg"),
            ),
            title: Text('Judeth, 80'),
            subtitle: Text("Those were the days! I miss go..."),
          ),
        ],
      ),
    );
  }
}