import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:flutter_cookbook/githubWidget.dart';

class ButtonsDemo implements CookItem {
  @override
  String title = "Buttons";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _ButtonsPage();
    }));
  }
}

class _ButtonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Varius buttons"),
      ),
      floatingActionButton: GithubLink(link: "contents/buttons.dart"),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Raised Button"),
              onPressed: () {},
            ),
            FlatButton(
              child: Text("Flat Button"),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("Outline Button"),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.adb),
              onPressed: () {},
            ),
            PopupMenuButton(
              child: Text("PopupMenu Button"),
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Text("child 1"),
                  ),
                  PopupMenuItem(
                    child: Text("child 2"),
                  ),
                  PopupMenuItem(
                    child: Text("child 3"),
                  ),
                ];
              },
            ),
            CupertinoButton(
              child: Text("Cupertino Button"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
