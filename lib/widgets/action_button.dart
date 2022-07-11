// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:measurely/constants/constants.dart';

class ActionButton extends StatelessWidget {
  ActionButton({Key? key, this.iconData, this.text}) : super(key: key);
  IconData? iconData;
  String? text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.2,
      height: size.height * 0.05,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: MeasureTheme.bgColor.withOpacity(0.3)),
      child: Center(
        child: iconData!=null ?  Icon(
          iconData,
          color: MeasureTheme.disableColor,
          size: 35,
        ) : Text(text!, style: const TextStyle(color: MeasureTheme.disableColor,fontSize: 18),),
      ),
    );
  }
}
