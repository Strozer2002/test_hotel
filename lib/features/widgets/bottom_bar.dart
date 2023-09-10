import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  final void Function()? onPress;
  final Widget child;
  const CustomBottomBar({
    super.key,
    required this.onPress,
    required this.child,
  });

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 1, color: Color.fromARGB(71, 158, 158, 158)),
        ),
      ),
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 12,
        bottom: 12,
      ),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: widget.onPress,
        child: widget.child,
      ),
    );
  }
}
