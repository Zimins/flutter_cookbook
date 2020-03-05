import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:flutter_cookbook/githubWidget.dart';

class PlaceHolderDemo implements CookItem {
  @override
  String title = "PlaceHolder";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _PlaceHolderPage();
    }));
  }
}

class _PlaceHolderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PlaceHolder"),
      ),
      floatingActionButton: GithubLink(
        link: "contents/placeholder.dart",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Draw future layout with PlaceHolder",
                style: Theme.of(context).textTheme.display2,
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Placeholder(
                    color: Colors.green,
                    fallbackWidth: 50,
                    fallbackHeight: 50,
                  ),
                ),
                Text("Title"),
              ],
            ),
            Text("Might be image"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Placeholder(
                color: Colors.green,
                fallbackHeight: 100,
                fallbackWidth: 100,
              ),
            ),
            Text("You can set Color"),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Placeholder(
                      color: Colors.blue,
                      fallbackHeight: 300,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Placeholder(
                      color: Colors.red,
                      fallbackHeight: 300,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Placeholder(
                      color: Colors.yellow,
                      fallbackHeight: 300,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Placeholder(
                      color: Colors.black,
                      fallbackHeight: 300,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
