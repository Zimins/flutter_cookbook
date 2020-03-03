import 'dart:math';

import 'package:flutter/material.dart';

import 'contentlist.dart';

class SliderDemo implements CookItem {
  @override
  String title = "Slider";

  @override
  void onSelect(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _SliderPage(),
      );
    }));
  }
}

class _SliderPage extends StatefulWidget {
  @override
  State createState() {
    return _SliderPageState();
  }
}

class _SliderPageState extends State<_SliderPage> {
  var linearSliderValue = 0.0;
  var dividedSliderValue = 0.0;
  var tooltipSliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Linear Slider: $linearSliderValue"),
          ],
        ),
        Transform.rotate(angle: pi * 2 * linearSliderValue, child: Text("😀")),
        Slider.adaptive(
          value: linearSliderValue,
          onChanged: (value) {
            setState(() {
              linearSliderValue = value;
            });
          },
        ),
        Text("Divided Slider"),
        Slider.adaptive(
          value: dividedSliderValue,
          divisions: 10,
          onChanged: (value) {
            setState(() {
              dividedSliderValue = value;
            });
          },
        ),
        Text("have label"),
        Slider(
          label: "${tooltipSliderValue * 10}",
          value: tooltipSliderValue,
          divisions: 10,
          onChanged: (value) {
            setState(() {
              tooltipSliderValue = value;
            });
          },
        ),
      ],
    );
  }
}
