import 'package:flutter/material.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:flutter_cookbook/contents/dialogShowcase.dart';
import 'package:flutter_cookbook/contents/image.dart';
import 'package:flutter_cookbook/contents/snackbar.dart';
import 'package:flutter_cookbook/webLauncher.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contents/slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<CookItem> cooks = [
    SliderDemo(),
    ImageDemo(),
    SnacbarDemo(),
    AlertDialogDemo()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color.fromARGB(255, 15, 76, 129),
          padding: EdgeInsets.only(left: 20, right: 20),
          child: ListView.builder(
              itemCount: cooks.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ListTitle();
                } else if (index == cooks.length + 1) {
                  return ListFooter();
                } else {
                  return CookContent(item: cooks[index - 1]);
                }
              })),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ListTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60, bottom: 20),
      child: Text(
        "Flutter cookbook🍳",
        style: TextStyle(
            fontSize: Theme.of(context).textTheme.display2.fontSize,
            color: Colors.white),
      ),
    );
  }
}

class ListFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Text(
            "🔨Working Now!✏️",
            style: Theme.of(context).textTheme.display1,
          ),
          GestureDetector(
            onTap: () async {
              await showBrowser(
                  "https://www.github.com/wlals822/flutter_cookbook");
            },
            child: Text(
              "or request by github",
              style: Theme.of(context).textTheme.subtitle,
            ),
          )
        ],
      ),
    );
  }
}

class CookContent extends StatelessWidget {
  final CookItem item;

  CookContent({this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        item.onSelect(context);
      },
      child: Card(
        elevation: 0,
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
          child: Text(
            item.title,
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
    );
  }
}
