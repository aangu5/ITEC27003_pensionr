import 'package:firebase_demo/objects/user.dart';
import 'package:firebase_demo/objects/users.dart';
import 'package:firebase_demo/screens/match.dart';
import 'package:firebase_demo/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class SwipingScreen extends StatefulWidget {
  @override
  _SwipingScreenState createState() => _SwipingScreenState();
}

class _SwipingScreenState extends State<SwipingScreen>
    with TickerProviderStateMixin {
  List<User> users = [margaret, elizabeth, judeth];

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return new Scaffold(
      appBar: PensionrAppBar("Find matches"),
      body: new Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: new TinderSwapCard(
            swipeUp: true,
            swipeDown: true,
            orientation: AmassOrientation.BOTTOM,
            totalNum: users.length,
            stackNum: 3,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width * 0.9,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.width * 0.8,
            cardBuilder: (context, index) => Card(
              child: Container(
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${users[index].firstName}' +
                          ", " +
                          users[index].age.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
                decoration: new BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      '${users[index].imageURL}',
                    ),
                  ),
                ),
              ),
            ),
            cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
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
                if (DateTime.now().second.toString().startsWith("3") ||
                    1 == 1) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          MatchPopUpScreen(users[index]));
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
