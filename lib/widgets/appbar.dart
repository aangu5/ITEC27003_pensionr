import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

class PensionrAppBar extends StatelessWidget implements PreferredSizeWidget {
  String _title;
  TextStyle style = TextStyle(color: Colors.pink[200]);
  @override
  Widget build(BuildContext context) {
    Text text = Text(_title, style: style,);
    return AppBar(
      title: text,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.pink[200]),
    );
  }

  PensionrAppBar(this._title) {
    preferredSize = Size.fromHeight(kToolbarHeight);
  }

  @override
  Size preferredSize;

}
