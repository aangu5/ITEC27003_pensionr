import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences _preferences;
  String userID;
  bool loggedIn = false;

  void init() async {
    _preferences = await SharedPreferences.getInstance();
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