import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:image_picker/image_picker.dart';

import '../githubWidget.dart';

class ImageDemo extends CookItem {
  @override
  String title = "Image 🖼️";

  @override
  void onSelect(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ImagePage();
    }));
  }
}

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  File _selectedDeviceImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Various Images"),
      ),
      floatingActionButton: GithubLink(
        link: "contents/image.dart",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Local Image(you can use gif too!)",
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset(
              "assets/jerry_and_bird.gif",
              width: 150,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                child: Text("Pick image from device"),
                onPressed: () {
                  getImage();
                },
              ),
            ),
            demoImage(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Random network image(search Lorem picsum)",
                textAlign: TextAlign.center,
              ),
            ),
            Image.network(
                "https://picsum.photos/seed/${Random.secure().nextInt(30)}/200/200")
          ],
        ),
      ),
    );
  }

  Widget demoImage() {
    if (_selectedDeviceImage != null) {
      return Image.file(
        _selectedDeviceImage,
        width: 200,
        height: 200,
      );
    } else {
      return Image.asset("");
    }
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _selectedDeviceImage = image;
    });
  }
}
