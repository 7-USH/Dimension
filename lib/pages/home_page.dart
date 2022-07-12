// ignore_for_file: prefer_const_constructors, unused_local_variable, must_be_immutable

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:measurely/common/cutout.dart';
import 'package:measurely/constants/constants.dart';
import 'package:measurely/pages/level_page.dart';
import 'package:measurely/widgets/action_button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.cameras}) : super(key: key);
  List<CameraDescription> cameras;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  late CameraController cameraController;
  

  @override
  void initState() {
    cameraController =
        CameraController(widget.cameras[0], ResolutionPreset.high);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    super.initState();
  }

  void onIndexSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> pages = [measurePage(size), LevelPage()];
    return Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _selectedIndex == 0
            ? Padding(
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
              )
            : SizedBox(),
        bottomNavigationBar: Container(
          height: size.height * 0.1,
          width: size.width,
          color: MeasureTheme.bgColor,
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent
            ),
            child: BottomNavigationBar(
                unselectedItemColor: MeasureTheme.disableColor,
                backgroundColor: MeasureTheme.bgColor,
                currentIndex: _selectedIndex,
                fixedColor: MeasureTheme.whiteColor,
                onTap: onIndexSelect,
                items: const [
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Icon(FontAwesomeIcons.ruler),
                      ), label: "Measure"),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Icon(Icons.linear_scale_outlined),
                      ), label: "level"),
                ]),
          ),
        ),
        body: pages[_selectedIndex]);
  }

  Widget measurePage(Size size) {
    return Stack(
      children: [
        Positioned.fill(
          child: CameraPreview(cameraController),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25.0, right: 15),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: MeasureTheme.whiteColor, width: 3),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent),
              child: Center(
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: MeasureTheme.whiteColor,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: size.height * 0.1, left: size.width * 0.05),
          child: Align(
            alignment: Alignment.topLeft,
            child: ActionButton(
              iconData: Icons.keyboard_arrow_left,
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: size.height * 0.1, right: size.width * 0.05),
          child: Align(
            alignment: Alignment.topRight,
            child: ActionButton(
              text: "Clear",
            ),
          ),
        )
      ],
    );
  }

}
