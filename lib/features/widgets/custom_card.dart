import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final Widget widget;
  const CustomCard({
    super.key,
    required this.widget,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: widget.widget,
    );
  }
}
