import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cookbook/contents/contentlist.dart';
import 'package:flutter_cookbook/webLauncher.dart';

class CupertinoDatePickerItem extends CookItem {
  @override
  String get title => "Date Picker 📅";

  @override
  void onSelect(BuildContext context) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) {
      return CupertinoDatePickerPage();
    }));
  }
}

class CupertinoDatePickerPage extends StatefulWidget {
  @override
  _CupertinoDatePickerPageState createState() =>
      _CupertinoDatePickerPageState();
}

class _CupertinoDatePickerPageState extends State<CupertinoDatePickerPage> {
  String dateString = "";
  String timeString = "";
  String dateTimeString = "";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Cupertino",
        middle: Text("Date picker"),
        trailing: GestureDetector(
          child: Image.asset("assets/ic_github.png"),
          onTap: () async {
            await showGithub("contents/cupertino/CupertinoDatePickerItem.dart");
          },
        ),
      ),
      child: SafeArea(
        child: DefaultTextStyle(
          style: CupertinoTheme.of(context).textTheme.textStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Test Date/Time pickers.",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("selectedDate : $dateString"),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoButton.filled(
                  child: Text("Show Date picker"),
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 200,
                            child: CupertinoDatePicker(
                              backgroundColor: Colors.white,
                              mode: CupertinoDatePickerMode.date,
                              onDateTimeChanged: (dateTime) {
                                setState(() {
                                  dateString = dateTime.toString();
                                });
                              },
                            ),
                          );
                        });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Selected time : $timeString"),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoButton.filled(
                  child: Text("Show Time picker"),
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 200,
                            child: CupertinoDatePicker(
                              backgroundColor: Colors.white,
                              mode: CupertinoDatePickerMode.time,
                              onDateTimeChanged: (time) {
                                setState(() {
                                  timeString = time.toString();
                                });
                              },
                            ),
                          );
                        });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Selected date/time : $dateTimeString"),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoButton.filled(
                  child: Text("Show Date/Time picker"),
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 200,
                            child: CupertinoDatePicker(
                              backgroundColor: Colors.white,
                              mode: CupertinoDatePickerMode.dateAndTime,
                              onDateTimeChanged: (dateTime) {
                                setState(() {
                                  dateTimeString = dateTime.toString();
                                });
                              },
                            ),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
