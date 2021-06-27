import 'package:flutter/material.dart';

class LightBox extends StatelessWidget {
  LightBox({this.rang, this.cardChild});
  final Color rang;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      decoration: BoxDecoration(
        color: rang,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(15),
    );
  }
}
