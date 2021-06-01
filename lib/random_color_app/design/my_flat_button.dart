import 'package:flutter/material.dart';

import 'my_colored_container.dart';

class MyFlatButton extends StatelessWidget {
  final Color backgroundColor;
  final Function onTap;
  final bool multiColors;

  const MyFlatButton({Key key, this.backgroundColor, this.onTap, this.multiColors = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: multiColors? Column(
        children: [
          Row(
            children: [
              MyColoredContainer(
                  color: Color.fromRGBO(245, 67, 54, 1.0)),
              MyColoredContainer(
                  color: Color.fromRGBO(236, 175, 52, 1.0)),
              MyColoredContainer(
                  color: Color.fromRGBO(110, 255, 153, 1.0)),
            ],
          ),
          Row(
            children: [
              MyColoredContainer(
                  color: Color.fromRGBO(71, 219, 48, 1.0)),
              MyColoredContainer(
                  color: Color.fromRGBO(46, 210, 123, 1.0)),
              MyColoredContainer(
                  color: Color.fromRGBO(44, 194, 202, 1.0)),
            ],
          ),
          Row(
            children: [
              MyColoredContainer(
                  color: Color.fromRGBO(42, 95, 193, 1.0)),
              MyColoredContainer(
                  color: Color.fromRGBO(77, 41, 185, 1.0)),
              MyColoredContainer(
                  color: Color.fromRGBO(155, 39, 176, 1.0)),
            ],
          ),
        ],
      ): Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: backgroundColor,
        ),
      ),
      onPressed: () {
        onTap();
      },
    );
  }
}