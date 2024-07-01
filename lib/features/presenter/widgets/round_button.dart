import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const RoundButton({
    super.key, 
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as Function(),
      child: Container(
        width: 220,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.red,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}