import 'package:flutter/material.dart';

class ButtonSize extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  const ButtonSize({
    Key? key,
    required this.child,
    required this.onPressed,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellow)),
      ),
    );
  }
}
