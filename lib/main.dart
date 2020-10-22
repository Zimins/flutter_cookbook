import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cookbook/contents/animations.dart';
import 'package:flutter_cookbook/contents/bottomNavbar.dart';
import 'package:flutter_cookbook/contents/bottomSheet.dart';
import 'package:flutter_cookbook/contents/buttons.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:flutter_cookbook/contents/cupertino/CupertinoButtonDemo.dart';
import 'package:flutter_cookbook/contents/dialogShowcase.dart';
import 'package:flutter_cookbook/contents/image.dart';
import 'package:flutter_cookbook/contents/navigationRail.dart';
import 'package:flutter_cookbook/contents/placeholder.dart';
import 'package:flutter_cookbook/contents/provider.dart';
import 'package:flutter_cookbook/contents/snackbar.dart';
import 'package:flutter_cookbook/contents/stepper.dart';
import 'package:flutter_cookbook/contents/texts.dart';
import 'package:flutter_cookbook/webLauncher.dart';

import 'contents/navigationRail.dart';
import 'contents/slider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  runApp(MyApp());
}

String getInterstitialAdUnitId() {
  if (Platform.isIOS) {
    return null;
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-6763874036478749~6108629695';
  }
  return null;
}

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

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int tabIndex = 0;

  AdmobInterstitial interstitialAd;

  @override
  void initState() {
    super.initState();
    interstitialAd = AdmobInterstitial(adUnitId: getInterstitialAdUnitId());
    interstitialAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color.fromARGB(255, 15, 76, 129),
          child: tabIndex == 0 ? MaterialList() : CupertinoList()),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (position) {
          setState(() {
            if (position == 2) {
              showAboutDialog(
                  context: context,
                  applicationName: "Flutter Cookbook",
                  applicationVersion: "1.0.6",
                  applicationLegalese: "Project for flutter learners",
                  children: [
                    OutlineButton(
                      child: Text("Donate by Ads"),
                      onPressed: () {
                        interstitialAd.show();
                      },
                    )
                  ]);
            } else {
              tabIndex = position;
            }
          });
        },
        currentIndex: tabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            title: Text("Material"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            title: Text("Cupertio"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications),
            title: Text("About"),
          ),
        ],
      ),
    );
  }
}

class MaterialList extends StatelessWidget {
  final List<CookItem> cooks = [
    TextDemo(),
    ButtonsDemo(),
    SliderDemo(),
    AnimationsDemo(),
    ImageDemo(),
    SnacbarDemo(),
    AlertDialogDemo(),
    NavigationRailDemo(),
    BottomSheetDemo(),
    BottomNavbarDemo(),
    StepperDemo(),
    PlaceHolderDemo(),
    ProviderDemo()
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cooks.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTitle(),
            );
          } else if (index == cooks.length + 1) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListFooter(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: CookContent(item: cooks[index - 1]),
            );
          }
        });
  }
}

class CupertinoList extends StatelessWidget {
  final List<CookItem> cooks = [
    CupertinoActionSheetItem(),
    // ButtonsDemo(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cooks.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTitle(),
            );
          } else if (index == cooks.length + 1) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListFooter(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: CookContent(item: cooks[index - 1]),
            );
          }
        });
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
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            Text(
              "🔨Working Now!✏️",
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.headline4.fontSize,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () async {
                await showBrowser(
                    "https://www.github.com/wlals822/flutter_cookbook");
              },
              child: Text(
                "or request by github",
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
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
