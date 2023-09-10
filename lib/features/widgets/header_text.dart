import 'package:flutter/material.dart';

class HeaderText extends StatefulWidget {
  final String text;
  const HeaderText({super.key, required this.text});

  @override
  State<HeaderText> createState() => _HeaderTextState();
}

class _HeaderTextState extends State<HeaderText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
