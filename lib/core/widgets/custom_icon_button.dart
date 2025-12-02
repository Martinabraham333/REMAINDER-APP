import 'package:flutter/material.dart';
import 'package:remainder_app/core/constants/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Function() onTap;
  const CustomIconButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: onTap,
        child: Icon(icon, color: Colors.red),
      ),
    );
  }
}
