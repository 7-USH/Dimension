// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class LevelPage extends StatefulWidget {
  LevelPage({Key? key}) : super(key: key);

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  late Stream<GyroscopeEvent> gyroscopeEvents;

  @override
  void initState() {
    super.initState();
    gyroscopeEvents = Stream.empty();
    gyroscopeEvents.listen((event) {
      var x = event.x;
      var y = event.y;
      var z = event.z;
      print('Value from controller: $x $y $z');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
