import 'package:flutter/material.dart';
import 'constants.dart';

class pinkBar extends StatelessWidget {
  pinkBar({this.title, this.tapFunc});

  final Function tapFunc;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Text(
        title,
        style: largeTextStyle,
      ),
      fillColor: Color(0xFFEB1555),
      constraints: BoxConstraints.tightFor(
        height: 80,
      ),
      onPressed: tapFunc,
    );
  }
}
