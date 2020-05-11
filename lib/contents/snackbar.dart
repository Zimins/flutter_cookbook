import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:flutter_cookbook/githubWidget.dart';
import 'package:flutter_cookbook/webLauncher.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class SnacbarDemo implements CookItem {
  @override
  String title = "Snackbar 🍪";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _SnackbarPage();
    }));
  }
}

class _SnackbarPage extends StatelessWidget {
  final messageInputController = TextEditingController();

  Color selectedColor = Colors.blue;

  String getInput() {
    if (messageInputController.text.isEmpty) {
      return "There is no input";
    } else {
      return messageInputController.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Try Snackbar!"),
      ),
      floatingActionButton: GithubLink(link: "contents/snackbar.dart"),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: messageInputController,
              decoration: InputDecoration(
                  hintText: "Type something",
                  helperText: "Your input will show in Snackbar"),
            ),
            Builder(
              builder: (context) {
                return FlatButton(
                  child: Text("Show Toast"),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      backgroundColor: selectedColor,
                      content: Text(getInput()),
                    ));
                  },
                );
              },
            ),
            Builder(
              builder: (context) {
                return FlatButton(
                  child: Text("Show Link Toast"),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      backgroundColor: selectedColor,
                      action: SnackBarAction(
                          label: "Go to google",
                          onPressed: () async {
                            await showBrowser("https://www.google.com");
                          }),
                      content: Text(getInput()),
                    ));
                  },
                );
              },
            ),
            RaisedButton(
              child: Text("Change snackbar color"),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Choose color"),
                    content: MaterialColorPicker(
                      onColorChange: (color) {
                        selectedColor = color;
                      },
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text("Confirm"),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Color changed!"),
                            backgroundColor: selectedColor,
                          ));
                        },
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
