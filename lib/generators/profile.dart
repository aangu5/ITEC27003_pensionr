import 'dart:convert';

import 'package:dash_chat/dash_chat.dart';
import 'package:firebase_demo/objects/user.dart';
import 'package:flutter/services.dart';

Future<String> getFileData(String path) async {
  return await rootBundle.loadString(path);
}

String replace(String original, List<String> list, String searchTerm) {
  String str = original;
  while (str.contains(searchTerm)) {
    str = str.replaceFirst(searchTerm, (list.toList()..shuffle()).first);
  }

  return str;
}

Future<List<User>> getUsers() async {
  LineSplitter ls = new LineSplitter();

  List<User> users = [];

  List<String> bios = ls.convert(await getFileData("content/bios.txt"));
  List<String> sports = ls.convert(await getFileData("content/sports.txt"));
  List<String> names = ls.convert(await getFileData("content/names.txt"));
  List<String> cities = ls.convert(await getFileData("content/cities.txt"));
  List<String> images = ls.convert(await getFileData("content/images.txt"));

  bios.forEach((element) {
    String withSports = replace(element, sports, "_SPORT_");
    String withNames = replace(withSports, names, "_NAME_");
    String bio = replace(withNames, cities, "_PLACE_");

    User user = User.all(
      firstName: (names.toList()..shuffle()).first,
      imageURL: (images.toList()..shuffle()).first,
      bio: bio,

    );


    users.add(user);
  });

  return users..shuffle();
}
