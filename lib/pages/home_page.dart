// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:measurely/common/cutout.dart';
import 'package:measurely/constants/constants.dart';
import 'package:measurely/widgets/action_button.dart';
import 'package:measurely/widgets/name_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool tap = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.amber,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(65),
            child: Cutout(
                color: MeasureTheme.whiteColor,
                child: Icon(
                  Icons.add,
                  size: 65,
                  color: MeasureTheme.whiteColor,
                )),
          ),
        ),
        bottomNavigationBar: Container(
          height: size.height * 0.1,
          width: size.width,
          color: MeasureTheme.bgColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    tap = true;
                  });
                },
                child: NamedButton(
                  iconData: Icons.linear_scale_outlined,
                  name: "Measure",
                  color:
                      tap ? MeasureTheme.whiteColor : MeasureTheme.disableColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    tap = false;
                  });
                },
                child: NamedButton(
                  iconData: Icons.abc,
                  name: "Level",
                  color: !tap
                      ? MeasureTheme.whiteColor
                      : MeasureTheme.disableColor,
                ),
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0, right: 15),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: MeasureTheme.whiteColor, width: 3),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.transparent),
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: MeasureTheme.whiteColor,
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                      ),
                ),
                
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height*0.1,left: size.width * 0.05),
              child: Align(
                alignment: Alignment.topLeft,
                child:ActionButton(
                  iconData: Icons.keyboard_arrow_left,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.1, right: size.width * 0.05),
              child: Align(
                alignment: Alignment.topRight,
                child: ActionButton(
                  text: "Clear",
                ),
              ),
            )
          ],
        ));
  }
}
