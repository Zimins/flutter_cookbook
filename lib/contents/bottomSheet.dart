import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:flutter_cookbook/githubWidget.dart';
import 'package:flutter_cookbook/mockData.dart';

class BottomSheetDemo extends CookItem {
  @override
  String title = "Bottom Sheet 📰";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _BottomSheetPage();
    }));
  }
}

class _BottomSheetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom sheets"),
      ),
      floatingActionButton: GithubLink(
        link: "contents/bottomSheet.dart",
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Builder(
              builder: (context) {
                return OutlineButton(
                  child: Text("Show Persistance bottom sheet"),
                  onPressed: () {
                    showBottomSheet(
                        context: context,
                        elevation: 16,
                        builder: (context) {
                          return Wrap(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    "Persistance Bottom sheet",
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(loremIpsumText),
                                  ),
                                ],
                              ),
                            ],
                          );
                        });
                  },
                );
              },
            ),
            OutlineButton(
              child: Text("Show Modal bottom sheet"),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    builder: (context) {
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Modal BottomSheet",
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(loremIpsumText),
                          )
                        ],
                      );
                    });
              },
            ),
            OutlineButton(
              child: Text("Show Modal bottom sheet, Circle border"),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    shape: CircleBorder(),
                    builder: (context) {
                      return Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Modal BottomSheet",
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(loremIpsumText),
                          )
                        ],
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
