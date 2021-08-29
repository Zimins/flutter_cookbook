import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:provider/provider.dart';

class BottomNavbarDemo implements CookItem {
  @override
  String title = "BottomNavigation";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _BottomNavigationPage();
    }));
  }
}

class NavigationBarSetting extends ChangeNotifier {
  var _showUnSelectedTitle = false;
  var _hasFixedSize = false;
  var _currentIndex = 0;

  get showUnSelected => _showUnSelectedTitle;
  set showUnSelected(bool showUnSelected) {
    _showUnSelectedTitle = showUnSelected;
    notifyListeners();
  }

  get hasFixedSize => _hasFixedSize;
  set hasFixedSize(bool hasFixedSize) {
    _hasFixedSize = hasFixedSize;
    notifyListeners();
  }

  get currentIndex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}

class _BottomNavigationPage extends StatefulWidget {
  @override
  __BottomNavigationPageState createState() => __BottomNavigationPageState();
}

class __BottomNavigationPageState extends State<_BottomNavigationPage> {
  var currentTapIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NavigationBarSetting(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bottom navigation"),
        ),
        body: _NavigationControls(),
        bottomNavigationBar: CustomNavigationBar(currentTapIndex: 0),
      ),
    );
  }
}

class CustomNavigationBar extends StatelessWidget {
  final currentTapIndex;
  final ValueChanged<int> onTap;

  CustomNavigationBar({this.currentTapIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationBarSetting>(
      builder: (context, value, child) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "time"),
            BottomNavigationBarItem(icon: Icon(Icons.memory), label: "memory"),
            BottomNavigationBarItem(
                icon: Icon(Icons.move_to_inbox), label: "Inbox"),
          ],
          showUnselectedLabels: value.showUnSelected,
          currentIndex: value.currentIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.red,
          type: value.hasFixedSize
              ? BottomNavigationBarType.fixed
              : BottomNavigationBarType.shifting,
          onTap: (value) {
            Provider.of<NavigationBarSetting>(context, listen: false)
                .currentIndex = value;
          },
        );
      },
    );
  }
}

class _NavigationControls extends StatefulWidget {
  @override
  _NavigationControlsState createState() => _NavigationControlsState();
}

class _NavigationControlsState extends State<_NavigationControls> {
  var showUnSelected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Text("Show unselected title"),
              Consumer<NavigationBarSetting>(
                builder: (context, value, child) {
                  return Switch(
                    value: value.showUnSelected,
                    onChanged: (value) {
                      setState(() {
                        Provider.of<NavigationBarSetting>(context,
                                listen: false)
                            .showUnSelected = value;
                      });
                    },
                  );
                },
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Text("Has fixed size"),
              Consumer<NavigationBarSetting>(
                builder: (context, value, child) {
                  return Switch(
                    value: value.hasFixedSize,
                    onChanged: (value) {
                      setState(() {
                        Provider.of<NavigationBarSetting>(context,
                                listen: false)
                            .hasFixedSize = value;
                      });
                    },
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
