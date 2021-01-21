import 'package:firebase_demo/screens/chat_lists.dart';
import 'package:firebase_demo/screens/home.dart';
import 'package:firebase_demo/screens/swipe.dart';
import 'package:firebase_demo/screens/welcome.dart';
import 'package:firebase_demo/storage/database.dart';
import 'package:firebase_demo/storage/local_storage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  String title = "Pensionr";
  LocalStorage storage = LocalStorage();
  Database database = Database();

  @override
  Widget build(BuildContext context) {
    storage.init();
    storage.onLoad();
    database.getUserByID(storage.userID);
    return MaterialApp(
      title: title,
      //home: storage.loggedIn ? Home(storage.userID) : WelcomeScreen(),
      home: WelcomeScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   String title;
//
//   @override
//   _MyHomePageState createState() {
//     return _MyHomePageState(this.title);
//   }
//
//   MyHomePage(String title) {
//     this.title = title;
//   }
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   DateTime selectedDate = DateTime.now();
//   String title;
//   _MyHomePageState(String title) {
//     this.title = title;
//   }
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(title)),
//       body: _buildBody(context),
//     );
//   }
//
//   Widget _buildBody(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: Firestore.instance.collection('baby').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return LinearProgressIndicator();
//
//         return _buildList(context, snapshot.data.documents);
//       },
//     );
//   }
//
//   Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
//     return ListView(
//       padding: const EdgeInsets.only(top: 20.0),
//       children: snapshot.map((data) => _buildListItem(context, data)).toList(),
//     );
//   }
//
//   Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
//     return Padding(
//       key: ValueKey("test"),
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(5.0),
//         ),
//         child: ListTile(
//           title: Text("name"),
//           trailing: Text("votes"),
//           onTap: () => Database().testSave()      ),
//       ),
//     );
//   }
// }
