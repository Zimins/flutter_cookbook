import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:flutter_cookbook/githubWidget.dart';

class NavigationRailDemo implements CookItem {
  @override
  String title = "Navigation Rail 🚊";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NavigationRailPage();
    }));
  }
}

class NavigationRailPage extends StatefulWidget {
  @override
  _NavigationRailPageState createState() => _NavigationRailPageState();
}

class _NavigationRailPageState extends State<NavigationRailPage> {
  var selectedIndex = 0;
  var isRailExtended = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation rail"),
      ),
      floatingActionButton: GithubLink(
        link: "contents/navigationRail.dart",
      ),
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            extended: isRailExtended,
            elevation: 10,
            leading: Text("You can add\n widget on leading"),
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.ac_unit), label: Text("Ice flake")),
              NavigationRailDestination(
                  icon: Icon(Icons.access_time), label: Text("Main time")),
              NavigationRailDestination(
                  icon: Icon(Icons.mic), label: Text("Start record")),
              NavigationRailDestination(
                  icon: Icon(Icons.business_center),
                  label: Text("My Bussiness")),
              NavigationRailDestination(
                  icon: Icon(Icons.photo_camera), label: Text("View camera")),
              NavigationRailDestination(
                  icon: Icon(Icons.book), label: Text("Some audiobook")),
            ],
            trailing: OutlineButton(
              child: Text("Toggle rail"),
              onPressed: () {
                setState(() {
                  isRailExtended = !isRailExtended;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
