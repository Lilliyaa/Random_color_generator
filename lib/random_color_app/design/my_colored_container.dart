import 'package:flutter/material.dart';


class MyColoredContainer extends StatelessWidget {
  final Color color;

  const MyColoredContainer({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      width: 9,
      height: 9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: color,
      ),
    );
  }
}