import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:flutter_cookbook/githubWidget.dart';
import 'package:rive/rive.dart';

class RiveItem extends CookItem {
  @override
  String get title => "Rive2";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _RiveDemoPage();
    }));
  }
}

class _RiveDemoPage extends StatefulWidget {
  @override
  __RiveDemoPageState createState() => __RiveDemoPageState();
}

class __RiveDemoPageState extends State<_RiveDemoPage> {
  final riveFileName = 'rivefile/rocketdemo.riv';
  var isRocketDoorOpen = false;
  var isFireActivate = false;
  SimpleAnimation _openDoorController;
  SimpleAnimation _closeDoorController;
  SimpleAnimation _fireController;

  Artboard _artboard;
  @override
  void initState() {
    super.initState();
    _loadRiveFile();
  }

  // loads a Rive file
  void _loadRiveFile() async {
    final bytes = await rootBundle.load(riveFileName);
    final file = RiveFile();

    if (file.import(bytes)) {
      // Select an animation by its name
      setState(() => _artboard = file.mainArtboard
        ..addController(
          SimpleAnimation('runBackground'),
        ));
    }
  }

  void _openDoor(bool open) {
    if (_openDoorController == null) {
      _artboard.addController(
        _openDoorController = SimpleAnimation('openDoor'),
      );
    }
    setState(() {
      _openDoorController.instance.time = 0;
      _openDoorController.isActive = true;
    });
  }

  void _closeDoor(bool open) {
    if (_closeDoorController == null) {
      _artboard.addController(
        _closeDoorController = SimpleAnimation('closeDoor'),
      );
    }
    setState(() {
      _closeDoorController.instance.time = 0;
      _closeDoorController.isActive = true;
    });
  }

  void _activeFire() {
    if (_fireController == null) {
      _artboard.addController(
        _fireController = SimpleAnimation('launchFire'),
      );
    }
    setState(() {
      if (!isFireActivate) {
        isFireActivate = true;
        _fireController.isActive = true;
      } else {
        isFireActivate = false;
        _fireController.isActive = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation by Rive2!"),
      ),
      floatingActionButton: GithubLink(link: "contents/advanced/riveDemo.dart"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                "With Rive2, you can run animation on Flutter by single file."),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Visit here: https://beta.rive.app"),
          ),
          Expanded(
            child: Container(
                child: _artboard != null
                    ? Rive(
                        artboard: _artboard,
                        fit: BoxFit.fitWidth,
                      )
                    : Container()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Try this buttons!"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                if (!isRocketDoorOpen) {
                  _openDoor(true);
                  isRocketDoorOpen = true;
                } else {
                  _closeDoor(true);
                  isRocketDoorOpen = false;
                }
              },
              child: isRocketDoorOpen == false
                  ? Text("Open Door")
                  : Text("Close Door"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(
              onPressed: () {
                _activeFire();
              },
              child: isFireActivate == false
                  ? Text("Active Fire")
                  : Text("Deactivate Fire"),
            ),
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
