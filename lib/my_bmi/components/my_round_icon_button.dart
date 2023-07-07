import 'package:flutter/material.dart';

class MyRoundIconButton extends StatelessWidget {
  const MyRoundIconButton(
      {super.key, required this.onPressed, required this.icon});
  final Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 5,
      constraints: const BoxConstraints.tightFor(height: 56, width: 56),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon),
    );
  }
}
