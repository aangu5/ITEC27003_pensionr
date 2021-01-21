import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_demo/storage/local_storage.dart';

import '../objects/user.dart';

final databaseReference = Firestore.instance;

class Database {
  LocalStorage localStorage = LocalStorage();

  void saveUser(User user) async {
    DocumentReference ref =
        await databaseReference.collection("users").add(user.toMap());
    localStorage.init();
    localStorage.saveUserID(ref.toString());
    print(ref.toString());
  }

  Future<List<User>> getAllUsers() async {
    List<User> output = [];
    databaseReference.collection("users").getDocuments().then((snapshot) {
      snapshot.documents.forEach((element) {
        User user = User.all(
          firstName: element.data["name"],
          lastName: element.data["surname"],
          dateOfBirth: element.data["dateOfBirth"],
        );
        output.add(user);
      });
    });
    return output;
}

  Future<User> getUserByID(String userID) async {
    for (User user in await getAllUsers()) {
      if (user.userID == userID) {
        return user;
      }
    }
    return null;
  }
}
