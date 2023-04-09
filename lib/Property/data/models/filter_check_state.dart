import 'package:flutter/cupertino.dart';

class FilterCheckState {
  final IconData? icon;
  final String title;
  bool value;

  FilterCheckState({
     this.icon,
    required this.title,
    this.value = false,
  });
}
