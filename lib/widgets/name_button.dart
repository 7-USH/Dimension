// ignore_for_file: prefer_const_constructors_in_immutables, must_be_immutable
import 'package:flutter/material.dart';

class NamedButton extends StatefulWidget {
  NamedButton({Key? key, required this.iconData, required this.name, required this.color})
      : super(key: key);
  IconData iconData;
  String name;
  Color color;

  @override
  State<NamedButton> createState() => _NamedButtonState();
}

class _NamedButtonState extends State<NamedButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          widget.iconData,
          color: widget.color,
        ),
        Text(
          widget.name,
          style: TextStyle(color: widget.color, fontSize: 12),
        )
      ],
    );
  }
}
