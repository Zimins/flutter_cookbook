import 'package:flutter/material.dart';

abstract class CookItem {
  String title;

  void onSelect(BuildContext context);
}
