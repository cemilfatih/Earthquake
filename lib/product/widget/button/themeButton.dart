import 'package:flutter/material.dart';

class iconButton extends StatelessWidget {
  const iconButton({Key? key, this.onPressed, required this.icon}) : super(key: key);

  final VoidCallback? onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: icon);
  }
}
