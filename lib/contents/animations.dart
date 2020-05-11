import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:flutter_cookbook/githubWidget.dart';

class AnimationsDemo implements CookItem {
  @override
  String title = "Animations 📺";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _AnimationsPage();
    }));
  }
}

class _AnimationsPage extends StatefulWidget {
  @override
  __AnimationsPageState createState() => __AnimationsPageState();
}

class __AnimationsPageState extends State<_AnimationsPage>
    with TickerProviderStateMixin {
  AnimationController titleController;
  AnimationController logoBoxController;
  AnimationController oneSecondController;

  Animation<double> titleAnimation;
  Animation<Decoration> logoBoxAnimation;
  Animation<Offset> movingLogoAnimation;
  Animation<AlignmentGeometry> textAnimation;

  @override
  void initState() {
    super.initState();
    titleController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    logoBoxController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    oneSecondController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    titleAnimation = Tween(begin: 0.8, end: 1.2).animate(
      titleController.drive(
        CurveTween(
          curve: Curves.elasticInOut,
        ),
      ),
    );

    logoBoxAnimation = DecorationTween(
      begin: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(60)),
        boxShadow: kElevationToShadow[8],
      ),
      end: BoxDecoration(
        color: Colors.white,
      ),
    ).animate(logoBoxController);

    movingLogoAnimation = Tween(begin: Offset(0, 0), end: Offset(2, 0)).animate(
        oneSecondController.drive(CurveTween(curve: Curves.elasticIn)));

    textAnimation = Tween<AlignmentGeometry>(
      begin: AlignmentDirectional.topCenter,
      end: AlignmentDirectional.bottomCenter,
    ).animate(oneSecondController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ScaleTransition(
              scale: titleAnimation, child: Text("Use Animations!")),
        ),
        floatingActionButton: GithubLink(
          link: "contents/animations.dart",
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "You can implement animation easly.\n"
                    "This one is DecoratedBoxTransitionWidget",
                    textAlign: TextAlign.center,
                  ),
                ),
                DecoratedBoxTransition(
                  decoration: logoBoxAnimation,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlutterLogo(
                      size: 120,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                  child: Text("SlideTransition + Curves.elasticIn"),
                ),
                SlideTransition(
                  position: movingLogoAnimation,
                  child: FlutterLogo(
                    size: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text("Size Transition(clips child by size)"),
                ),
                SizeTransition(
                  axis: Axis.horizontal,
                  sizeFactor: oneSecondController,
                  axisAlignment: 0.5,
                  child: FlutterLogo(
                    size: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text("Scale Transition."),
                ),
                ScaleTransition(
                  scale: oneSecondController,
                  child: FlutterLogo(
                    size: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                  child: Text("Scale Transition with curve"),
                ),
                ScaleTransition(
                  scale: oneSecondController
                      .drive(CurveTween(curve: Curves.elasticInOut)),
                  child: FlutterLogo(
                    size: 100,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    oneSecondController.dispose();
    super.dispose();
  }
}
