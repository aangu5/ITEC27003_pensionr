import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_demo/objects/users.dart';

class User {
  String firstName;
  DateTime dateOfBirth;
  DocumentReference reference;
  String imageURL;
  int age;
  String bio;

  User();

  Random random = new Random();

  int nextInt(int min, int max) => min + random.nextInt((max + 1) - min);

  User.chatUser() {
     age = nextInt(55, 100);
  }

  User.all({this.firstName, this.dateOfBirth, this.imageURL, this.age, this.bio}) {
    age = nextInt(55, 100);
  }

  User.name({this.dateOfBirth,
      this.reference, this.age});

  Map<String, dynamic > toMap() {
    return {};
  }

  ChatUser toChatUser() {
    return new ChatUser(
      firstName: firstName,
      avatar: imageURL,
      uid: "001",
    );
  }

  List<ChatMessage> getMessages() {
    ChatMessage message = ChatMessage(text: bio, user: new ChatUser(uid: "1", avatar: imageURL));
    List<ChatMessage> messages =[];
    messages.add(message);
    return messages;
  }

}
