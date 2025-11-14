import 'package:flutter/material.dart';
import 'package:remainder_app/core/constants/app_colors.dart';

class CustomTextfield extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController controller;
  final VoidCallback? ontap;
  final bool isReadOnly;
  final bool isSuffix;
  final bool isPrefix;
  final bool isPassword;
  final IconData? prefix;
  final IconData? suffix;
  CustomTextfield({
    super.key,
    required this.title,
    required this.hint,
    required this.controller,
    this.ontap,
    this.isReadOnly = false,
    this.isSuffix = false,
    this.isPrefix = false,
    this.prefix,
    this.suffix,
    this.isPassword = false,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool isObscureText = false;

  @override
  void initState() {
    isObscureText = widget.isPassword;
    super.initState();
  }

  _togglePasswordVisibility() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        TextField(
          obscureText: isObscureText,
          readOnly: widget.isReadOnly,
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: widget.isSuffix == true && widget.suffix == null
                ? GestureDetector(
                    onTap: _togglePasswordVisibility,
                    child: widget.isPassword == true && isObscureText == true
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  )
                : widget.isSuffix == true && widget.suffix != null
                ? Icon(widget.suffix)
                : null,
            prefixIcon: widget.isPrefix == true ? Icon(widget.prefix) : null,
            // fillColor: Colors.black,
            // filled: true,
            hint: Text(widget.hint),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color:Colors.black)
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color:Colors.black)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color:Colors.black)
            ),
          ),
        ),
      ],
    );
  }
}
