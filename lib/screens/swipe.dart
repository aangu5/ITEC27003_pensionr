import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class SwipingScreen extends StatefulWidget {
  @override
  _SwipingScreenState createState() => _SwipingScreenState();
}

class _SwipingScreenState extends State<SwipingScreen>
    with TickerProviderStateMixin {
  List<String> welcomeImages = [
    "https://www.endeavorhomecare.com/wp-content/uploads/2018/05/bigstock-Happy-old-senior-woman-smiling-152547344-1030x687.jpg",
    "https://norwaytoday.info/wp-content/uploads/2017/03/Old-woman.jpg",
    "https://images.theweek.com/sites/default/files/styles/tw_image_9_4/public/iStock-163159409.jpg?itok=J656lyHR&resize=450x200",
    "https://www.endeavorhomecare.com/wp-content/uploads/2018/05/bigstock-Happy-old-senior-woman-smiling-152547344-1030x687.jpg",
    "https://thechive.com/wp-content/uploads/2020/03/old-person-things-lead.jpg?quality=85&strip=info",
    "https://www.endeavorhomecare.com/wp-content/uploads/2018/05/bigstock-Happy-old-senior-woman-smiling-152547344-1030x687.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return new Scaffold(
      body: new Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: new TinderSwapCard(
            swipeUp: true,
            swipeDown: true,
            orientation: AmassOrientation.BOTTOM,
            totalNum: welcomeImages.length,
            stackNum: 3,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width * 0.9,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.width * 0.8,
            cardBuilder: (context, index) => Card(
              child: Image.network('${welcomeImages[index]}'),
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
              /// Get orientation & index of swiped card!
            },
          ),
        ),
      ),
    );
  }
}