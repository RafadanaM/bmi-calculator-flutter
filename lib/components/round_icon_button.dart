import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData child;
  final Function onPressed;
  final Function onLongPress;
  final Function onLongPressUp;

  RoundIconButton(
      {@required this.child,
      @required this.onPressed,
      this.onLongPress,
      this.onLongPressUp});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onLongPressUp: onLongPressUp,
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Icon(child),
        elevation: 3.0,
        constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
      ),
    );
  }
}
