import 'package:flutter/material.dart';
import 'package:flutter_cookbook/webLauncher.dart';

class GithubLink extends StatelessWidget {
  final String link;

  GithubLink({this.link});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Image.asset("assets/ic_github.png"),
      onPressed: () async {
        await showGithub(link);
      },
    );
  }
}
