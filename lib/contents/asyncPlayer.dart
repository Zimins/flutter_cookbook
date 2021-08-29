import 'package:flutter/material.dart';

import 'contentlist.dart';

class AsyncDemo implements CookItem {
  @override
  String title = "Async";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Container();
    }));
  }
}
