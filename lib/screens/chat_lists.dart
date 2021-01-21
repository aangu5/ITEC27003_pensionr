import 'package:firebase_demo/objects/chats.dart';
import 'package:firebase_demo/objects/users.dart';
import 'package:firebase_demo/widgets/appbar.dart';
import 'package:flutter/material.dart';

import 'chat.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PensionrAppBar("Chat"),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://miro.medium.com/max/2560/1*3t2QJIYXuxKAs6CnX2W9hw.jpeg"),
            ),
            title: Text('Margaret, 85', style: TextStyle(fontSize: 20),),
            subtitle: Text("Help, I can’t find my spectacles ...", style: TextStyle(fontSize: 16),),
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
                  "https://c8.alamy.com/comp/DEGCMC/87-year-old-adult-female-senior-citizen-smoking-a-cigarette-DEGCMC.jpg"),
            ),
            title: Text('Elizabeth, 78', style: TextStyle(fontSize: 20),),
            subtitle: Text("I haven’t felt a man’s touch in y...", style: TextStyle(fontSize: 16),),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/originals/aa/8f/72/aa8f72e966c8b26a1e1d837755bd7f23.jpg"),
            ),
            title: Text('Judeth, 80', style: TextStyle(fontSize: 20),),
            subtitle: Text("Those were the days! I miss go...", style: TextStyle(fontSize: 16),),
          ),
        ],
      ),
    );
  }
}