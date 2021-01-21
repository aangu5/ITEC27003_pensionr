import 'package:cloud_firestore/cloud_firestore.dart';
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
        User user = User();
        user.firstName = element.data["name"];
        user.surname = element.data["surname"];
        user.dateOfBirth = element.data["dateOfBirth"];
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
