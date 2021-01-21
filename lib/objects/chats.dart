import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_demo/objects/users.dart';

List<ChatMessage> margaretChats = [
  ChatMessage(
    text: "I haven’t felt a man’s touch in years",
    user: margaret.toChatUser(),
    createdAt: DateTime.now(),
  ),
  ChatMessage(
    text: "aa",
    user: margaret.toChatUser(),
    createdAt: DateTime.now(),
  ),
  ChatMessage(
    text: "omg same",
    user: me.toChatUser(),
    createdAt: DateTime.now(),
  )
];