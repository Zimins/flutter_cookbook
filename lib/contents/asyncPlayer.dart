import 'package:flutter/material.dart';

import 'contentlist.dart';

class AsyncDemo implements CookItem {
  @override
  String title = "Async";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {}));
  }
}

class _AsyncPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}
