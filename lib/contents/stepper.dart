import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:flutter_cookbook/githubWidget.dart';

class StepperDemo implements CookItem {
  @override
  String title = "Stepper 👣";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _StepperPage();
    }));
  }
}

class _StepperPage extends StatefulWidget {
  @override
  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<_StepperPage> {
  var currentStep = 0;

  final steps = [
    Step(
        title: Text("Visit flutter.dev"),
        content: Text("Demo content"),
        state: StepState.complete,
        isActive: true),
    Step(
        title: Text("Install flutter by platform"),
        content: Text("Demo content"),
        isActive: true),
    Step(title: Text("Configure Editor"), content: Text("Demo content")),
    Step(title: Text("Make first app"), content: Text("Demo content")),
    Step(title: Text("Run on Device"), content: Text("Demo content")),
    Step(title: Text("Depoly to Store"), content: Text("Demo content")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter learn step"),
        ),
        floatingActionButton: GithubLink(
          link: "contents/stepper.dart",
        ),
        body: _FlutterLearnStepper());
  }
}

class _FlutterLearnStepper extends StatefulWidget {
  @override
  State createState() => _FlutterLeanStepperState();
}

class _FlutterLeanStepperState extends State<_FlutterLearnStepper> {
  var currentStep = 0;

  final states = [
    StepState.indexed,
    StepState.indexed,
    StepState.indexed,
    StepState.indexed,
    StepState.indexed,
    StepState.indexed,
  ];

  final steps = [
    Step(
        title: Text("Visit flutter.dev"),
        content: Text("Demo content"),
        isActive: true),
    Step(
        title: Text("Install flutter by platform"),
        content: Text("Demo content"),
        isActive: true),
    Step(
        title: Text("Configure Editor"),
        content: Text("Demo content"),
        isActive: true),
    Step(
        title: Text("Make first app"),
        content: Text("Demo content"),
        isActive: true),
    Step(
        title: Text("Run on Device"),
        content: Text("Demo content"),
        isActive: true),
    Step(
        title: Text("Depoly to Store"),
        content: Text("Demo content"),
        isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: currentStep,
      onStepContinue: () {
        setState(() {
          if (currentStep < steps.length - 1) {
            currentStep += 1;
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Step Completed!"),
                ),
            );
          }
        });
      },
      onStepTapped: (position) {
        setState(() {
          currentStep = position;
        });
      },
      onStepCancel: () {},
      steps: steps,
    );
  }
}
