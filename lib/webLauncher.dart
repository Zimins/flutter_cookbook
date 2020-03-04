import 'package:url_launcher/url_launcher.dart';

final _githubBaseUrl = "https://www.github.com/wlals822/flutter_cookbook/";

final _githubMainSourceUrl = _githubBaseUrl + "/blob/master/lib/";

Future<void> showBrowser(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> showGithub(String filePath) async {
  final url = _githubMainSourceUrl + filePath;

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
