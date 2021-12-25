import 'package:flutter/material.dart';

class PlusButton extends StatefulWidget {
  final VoidCallback onPressed;
  const PlusButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  _PlusButtonState createState() => _PlusButtonState();
}

class _PlusButtonState extends State<PlusButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: const Text("+"),
      onPressed: () {
        widget.onPressed();
      },
    );
  }
}
