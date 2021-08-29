import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:flutter_cookbook/githubWidget.dart';

class AlertDialogDemo implements CookItem {
  @override
  String title = "AlertDialog ⚠️";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _AlertDialogShowcase();
    }));
  }
}

class _AlertDialogShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Try alert Dialog"),
      ),
      floatingActionButton: GithubLink(
        link: "contents/dialogShowcase.dart",
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Show material dialog"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Demo materialDialog"),
                          content: Text("You can use Wiget as content."),
                          actions: <Widget>[
                            FlatButton(
                                child: Text("Confirm"),
                                onPressed: () {
                                  Navigator.pop(context, null);
                                }),
                          ],
                        );
                      });
                },
              ),
              RaisedButton(
                child: Text("Show Cupertino Dialog"),
                onPressed: () {
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text("iOS Dialog"),
                          content: Text("How about this?"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("Close"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );
                      });
                },
              ),
            ],
          )),
    );
  }
}
