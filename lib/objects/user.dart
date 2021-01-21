import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String userID;
  String firstName;
  String surname;
  DateTime dateOfBirth;
  DocumentReference reference;

  User();


  @override
  String toString() {
    return 'User{firstName: $firstName, surname: $surname, dateOfBirth: $dateOfBirth}';
  }

  Map<String, dynamic> toMap() {
    return {"name": firstName, "surname": surname, "dateOfBirth": dateOfBirth};
  }


}
