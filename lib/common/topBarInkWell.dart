import 'package:flutter/material.dart';

class TopBarInkWell extends StatelessWidget {
  const TopBarInkWell({
    this.onHover,
    this.text,
    this.isHovering,
    this.ontap,
  });

  final ValueChanged<bool> onHover;
  final String text;
  final bool isHovering;
  final GestureTapCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: onHover,
      onTap: ontap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: isHovering ? Colors.blue[200] : Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: isHovering,
            child: Container(
              height: 2,
              width: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
