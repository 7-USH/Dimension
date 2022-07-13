// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_print, prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';
import 'package:measurely/constants/constants.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:math' as math;

class LevelPage extends StatefulWidget {
  LevelPage({Key? key}) : super(key: key);

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> with TickerProviderStateMixin {
  double x = 0, y = 0, z = 0;
  int x_angle = 0;
  int y_angle = 0;
  int z_angle = 0;
  int angle = 0;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    accelerometerEvents.listen((event) {
      double norm_Of_g =
          math.sqrt(event.x * event.x + event.y * event.y + event.z * event.z);

      x = event.x / norm_Of_g;
      y = event.y / norm_Of_g;
      z = event.z / norm_Of_g;

      double x_inclination = -(math.asin(x) * (180 / math.pi));
      double y_inclination = (math.acos(y) * (180 / math.pi)) - 90;
      double z_inclination = -(math.atan(z) * (180 / math.pi)) + 45;

      x_angle = x_inclination.truncate();
      y_angle = y_inclination.truncate();
      z_angle = z_inclination.truncate();

      if (y_angle < -49) {
        angle = x_angle;
      } else {
        angle = y_angle;
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isTap = false;
  Color color = MeasureTheme.blackColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (angle == 0 || angle == 1) {
      color = MeasureTheme.greenColor;
    } else if (isTap) {
      color = MeasureTheme.redColor;
    } else {
      color = MeasureTheme.blackColor;
    }

    return Scaffold(
      backgroundColor: color,
      body: GestureDetector(
        onTap: () {
          setState(() {
            isTap = !isTap;
          });
        },
        child: Stack(children: [
          y_angle < -49
              ? Positioned.fill(
                  bottom: MediaQuery.of(context).size.height * 0.6,
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(angle.toDouble() / 360),
                    child: SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: MeasureTheme.whiteColor,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: MeasureTheme.whiteColor,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : Container(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                y_angle < -49
                    ? Container(
                        height: 2,
                        width: size.width * 0.1,
                        color: Colors.white,
                      )
                    : Container(),
                Text(
                  angle.toString() + "",
                  style: TextStyle(
                      color: MeasureTheme.whiteColor,
                      fontSize: 60,
                      fontWeight: FontWeight.w300),
                ),
                y_angle < -49
                    ? Container(
                        height: 2,
                        width: size.width * 0.1,
                        color: MeasureTheme.whiteColor)
                    : Container(),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
