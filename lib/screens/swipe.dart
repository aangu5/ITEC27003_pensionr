import 'package:firebase_demo/generators/profile.dart';
import 'package:firebase_demo/objects/user.dart';
import 'package:firebase_demo/screens/match.dart';
import 'package:firebase_demo/storage/local_storage.dart';
import 'package:firebase_demo/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class SwipingScreen extends StatefulWidget {
  @override
  _SwipingScreenState createState() => _SwipingScreenState();
}

class _SwipingScreenState extends State<SwipingScreen>
    with TickerProviderStateMixin {
  List<User> users;

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.
    LocalStorage storage = LocalStorage();
    storage.init();
    return new Scaffold(
      appBar: PensionrAppBar("Find matches"),
      body: new Center(
        child: FutureBuilder<List<User>>(
            future: getUsers(),
            builder:
                (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  child: Text("loading"),
                );
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: new TinderSwapCard(
                    swipeUp: true,
                    swipeDown: true,
                    orientation: AmassOrientation.BOTTOM,
                    totalNum: snapshot.data.length,
                    stackNum: 3,
                    swipeEdge: 4.0,
                    maxWidth: MediaQuery.of(context).size.width * 0.9,
                    maxHeight: MediaQuery.of(context).size.width * 0.9,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    minHeight: MediaQuery.of(context).size.width * 0.8,
                    cardBuilder: (context, index) => Card(
                      child: Container(
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    snapshot.data[index].firstName + ", " + snapshot.data[index].age.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 32,
                                    ),
                                  ),
                                  Text('${snapshot.data[index].bio}', style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,

                                  ),)
                                ],
                              ),
                            ),
                          ),
                        ),
                        decoration: new BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.transparent, Colors.transparent ,Colors.black],
                          ),

                          image: DecorationImage(
                            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              '${snapshot.data[index].imageURL}',
                            ),
                          ),
                        ),
                      ),
                    ),
                    cardController: controller = CardController(),
                    swipeUpdateCallback:
                        (DragUpdateDetails details, Alignment align) {
                      /// Get swiping card's alignment
                      if (align.x < 0) {
                        //Card is LEFT swiping
                      } else if (align.x > 0) {
                        //Card is RIGHT swiping
                      }
                    },
                    swipeCompleteCallback:
                        (CardSwipeOrientation orientation, int index) {
                      if (orientation == CardSwipeOrientation.RIGHT) {
                        //Card is LEFT swiping
                        if (DateTime.now().second.toString().endsWith("5")) {
                          LocalStorage.matches.add(snapshot.data[index]);
                          showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  MatchPopUpScreen(snapshot.data[index]));
                        }
                      }
                    },
                  ),
                );
              }
            }),
      ),
    );
  }
}
