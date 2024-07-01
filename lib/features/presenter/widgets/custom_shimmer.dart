import 'package:flutter/material.dart';

class CustomShimmer extends StatelessWidget {
  final Widget child;

  const CustomShimmer({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: child,
      ),
    );
  }
}