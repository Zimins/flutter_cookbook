import 'package:flutter/cupertino.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';

class CupertinoContextMenuDemo extends CookItem {
  @override
  String get title => "Context menu 📚";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return _CupertinoContextMenuDemoPage();
    }));
  }
}

class _CupertinoContextMenuDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("CupertinoContextMenu"),
        ),
        child: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                    style: CupertinoTheme.of(context).textTheme.textStyle,
                    child: Text("Try long press!")),
                CupertinoContextMenu(
                  child: Image.asset("assets/ic_github.png"),
                  actions: [
                    CupertinoContextMenuAction(
                        child: Text("This is context menu.")),
                    CupertinoContextMenuAction(
                        child: Text("View code on github")),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
