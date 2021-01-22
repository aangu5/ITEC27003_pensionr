import 'package:firebase_demo/generators/profile.dart';
import 'package:firebase_demo/objects/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences _preferences;
  String userID;
  bool loggedIn = false;

  List<User> users;
  static List<User> matches = [];

  void init() async {
    _preferences = await SharedPreferences.getInstance();
    users = await getUsers();
    print("preferences ready");
  }

  void onLoad() async {
    _preferences = await SharedPreferences.getInstance();
    if (_preferences.containsKey("userID")) {
      userID = _preferences.getString("userID");
      print(userID);
      loggedIn = true;
    }
  }

  void saveUserID(String userID) async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.setString("userID", userID);
  }
}