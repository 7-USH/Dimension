// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Cutout extends StatelessWidget {
  const Cutout({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcOut,
      shaderCallback: (bounds) =>
          LinearGradient(colors: [color], stops: [0.0]).createShader(bounds),
      child: child,
    );
  }
}
