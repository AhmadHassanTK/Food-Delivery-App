import 'package:flutter/material.dart';

class MyAppIcon extends StatelessWidget {
  const MyAppIcon({
    super.key,
    required this.icon,
    this.size = 40,
    this.iconColor = const Color(0xFF756d54),
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.iconsize = 16,
  });
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconsize,
      ),
    );
  }
}
