import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_demo/objects/users.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatelessWidget {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  final ChatUser user;
  final List<ChatMessage> messages;

  ChatScreen({Key key, @required this.user, @required this.messages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: DashChat(
        key: _chatViewKey,
        inverted: false,
        sendOnEnter: true,
        textInputAction: TextInputAction.send,
        user: me,
        inputDecoration: InputDecoration.collapsed(hintText: "Send message"),
        dateFormat: DateFormat('yyyy-MMM-dd'),
        timeFormat: DateFormat('HH:mm'),
        messages: messages,
        showUserAvatar: false,
        showAvatarForEveryMessage: false,
        scrollToBottom: false,
        onPressAvatar: (ChatUser user) {
          print("OnPressAvatar: ${user.name}");
        },
        onLongPressAvatar: (ChatUser user) {
          print("OnLongPressAvatar: ${user.name}");
        },
        messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
        alwaysShowSend: true,
        inputTextStyle: TextStyle(fontSize: 16.0),
        inputContainerStyle: BoxDecoration(
          border: Border.all(width: 0.0),
          color: Colors.white,
        ),
        onLoadEarlier: () {
          print("loading...");
        },
        onSend: (ChatMessage c) {
          print(c);
        },
      ),
    );
  }
}