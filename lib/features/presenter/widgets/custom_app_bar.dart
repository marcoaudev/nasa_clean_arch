import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  final Size preferredSize;

  final String title; 
  const CustomAppBar({super.key, required this.title}) : preferredSize = const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title
      ),
      backgroundColor: const Color(0xFF233C5C),
    );
  }
}