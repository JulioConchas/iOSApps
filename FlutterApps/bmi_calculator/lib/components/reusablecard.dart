import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';


class ReusableCard extends StatelessWidget {
  final Color customColor;
  final Widget cardChild;
  final Function()? onPress;

  ReusableCard({this.customColor = kDefaultInactiveColor,this.cardChild = defaultChild, this.onPress });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: customColor, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}

class ReusableChild extends StatelessWidget {
  final IconData customIcon;
  final String customText;

  ReusableChild({this.customIcon = defaultIcon, this.customText = defaultText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          customIcon,
          size: 70.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          customText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
