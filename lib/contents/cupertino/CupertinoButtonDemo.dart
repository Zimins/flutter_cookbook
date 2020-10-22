import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';

import '../../webLauncher.dart';

class CupertinoActionSheetItem extends CookItem {
  @override
  String get title => "Action Sheet";
  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return _CupertinoActionSheetPage();
    }));
  }
}

class _CupertinoActionSheetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Cupertino",
        middle: Text("Action sheet"),
        trailing: GestureDetector(
          child: Image.asset("assets/ic_github.png"),
          onTap: () async {
            await showGithub("contents/cupertino/CupertinoButtonDemo.dart");
          },
        ),
      ),
      child: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CupertinoButton(
                child: Text("Show action sheet"),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          title: Text("This is Action sheet"),
                          message: Text(
                              "You can use Cupetino Action sheet on flutter.\nWithout onPressed, button will be disabled"),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text("cancel"),
                            ),
                            CupertinoDialogAction(
                              child: Text("confirm"),
                            ),
                          ],
                        );
                      });
                },
              ),
              CupertinoButton.filled(
                child: Text("Show customized sheet"),
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoActionSheet(
                          title: Icon(Icons.account_balance),
                          message: Column(
                            children: <Widget>[
                              Text("Yes, everything is widget"),
                              Image.asset(
                                "assets/jerry_and_bird.gif",
                                width: 100,
                                height: 100,
                              ),
                            ],
                          ),
                          actions: <Widget>[
                            CupertinoDialogAction(
                              child: Text("close"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            CupertinoDialogAction(
                              child: Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
