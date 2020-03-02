import 'package:flutter/material.dart';

import 'contentlist.dart';

class Seekbar implements CookItem {
  @override
  String title = "Seekbar";

  @override
  void onSelect(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
      );
    }));
  }
}
