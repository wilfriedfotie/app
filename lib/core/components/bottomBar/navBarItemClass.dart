import 'package:flutter/material.dart';

class NavBarItem {
  final int id;
  final String? svg;
  final IconData? icon;
  final Function onSelected;

  NavBarItem({required this.id, this.svg, required this.onSelected, this.icon});
}
