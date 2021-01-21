import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';

class User {
  String userID;
  String firstName;
  String lastName;
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

  User.all({this.firstName, this.lastName, this.dateOfBirth, this.imageURL, this.age, this.bio}) {
    age = nextInt(55, 100);
  }

  User.name({this.userID, this.dateOfBirth,
      this.reference, this.age});

  Map<String, dynamic > toMap() {
    return {};
  }

  ChatUser toChatUser() {
    return new ChatUser(
      uid: userID,
      firstName: firstName,
      lastName: lastName,
      avatar: imageURL,
    );
  }

}
