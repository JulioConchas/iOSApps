import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final IconData? iconData;
  final Function()? onPress;

  RoundIconButton({this.iconData, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
            width: 50.0,
            height: 50.0
        ),
        child: Icon(iconData),
        onPressed: onPress
    );
  }
}