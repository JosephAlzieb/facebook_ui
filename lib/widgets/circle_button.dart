import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const CircleButton(
    this.icon,
    this.onPressed,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: ()=>onPressed,
        icon: Icon(
          icon,
          color: Colors.black,
          size: 35,
        ),
      ),
    );
  }
}
