import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:flutter_cookbook/mockData.dart';

class TextDemo implements CookItem {
  @override
  String title = "Text";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _TextsDemoPage();
    }));
  }
}

class _TextsDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Texts"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("This is normal text."),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Spanned text",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text.rich(TextSpan(
              children: [
                TextSpan(
                    text: "You can use ",
                    style: Theme.of(context).textTheme.display1),
                TextSpan(
                    text: "Multiple ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                    text: "Text ",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.green,
                    )),
                TextSpan(
                    text: "Spans",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.yellow,
                    )),
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Ellipsized text",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              loremIpsumText,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Faded text",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              loremIpsumText,
              overflow: TextOverflow.fade,
              maxLines: 3,
            ),
            Text(
              "Hello Flutter",
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            Text(
              "Nice!",
              style: TextStyle(letterSpacing: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class LoremIpsum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt dolor ac tincidunt dapibus. Ut sit amet blandit dui, nec fermentum massa. Donec semper velit id ex lacinia, vel scelerisque ligula cursus. Phasellus finibus lacus sed ultrices ultricies. Phasellus ornare libero augue, id aliquam purus eleifend eu. Aenean ut pretium est. Nam mi elit, tempus non euismod ut, bibendum at mauris. Sed sodales pharetra massa placerat ultrices.");
  }
}
