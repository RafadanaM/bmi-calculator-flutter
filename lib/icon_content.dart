import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  final String label;
  final IconData icon;

  IconContent({this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Flex(
      direction: isPortrait ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: Icon(
            icon,
            size: isPortrait ? 80.0 : 50.0,
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(label, style: kLabelTextStyle)
      ],
    );
  }
}
