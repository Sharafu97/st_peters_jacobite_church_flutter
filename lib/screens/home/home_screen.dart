import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [],
      ),
    );
  }

  // Widget menuIcons(String icon, String label) {
  //   return Row(
  //     children: [
  //       SvgPicture.asset(icon, height: 24),
  //       Text(label),
  //     ],
  //   );
  // }

  menuIcons(double angle, {String? icon, String? label}) {
    final double rad = vector_math_64.radians(angle);
    return Transform(
        transform: Matrix4.identity()..translate(cos(rad), sin(rad)),
        child: IconButton(
          icon: SvgPicture.asset(icon ?? '', height: 24),
          onPressed: () {},
        ));
  }
}
