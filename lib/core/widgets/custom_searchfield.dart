import 'package:flutter/material.dart';
import 'package:remainder_app/core/constants/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final double widthSize;

  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const CustomSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    this.widthSize = double.infinity,

    this.onChanged,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextField(
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        readOnly: false,
        cursorColor: Colors.black,
        controller: controller,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
          hintText: hintText,
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search, color: AppColors.primaryColor),

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
