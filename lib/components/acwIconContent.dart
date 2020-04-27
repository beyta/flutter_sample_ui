import 'package:flutter/material.dart';
import 'package:fluttersampleui/styles/main_style.dart';

class AcwIconContent extends StatelessWidget {
  AcwIconContent({this.icon, this.label, this.iconSize, this.iconHeight});

  final IconData icon;
  final String label;
  final double iconSize;
  final double iconHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: iconHeight,
        ),
        Text(
          label,
          style: myAcwCardDarkLabel,
        )
      ],
    );
  }
}
