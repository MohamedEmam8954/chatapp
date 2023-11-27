import 'package:flutter/material.dart';

class Customtextformfield extends StatelessWidget {
  const Customtextformfield({
    super.key,
    required this.validator,
    required this.icon,
    this.suffixicon,
    required this.onsubmit,
    required this.hinttext,
    required this.inputType,
    this.obscuretext = false,
    this.ontap,
  });
  final String? Function(String? value) validator;
  final IconData icon;
  final IconData? suffixicon;
  final Function(String value) onsubmit;
  final String hinttext;
  final TextInputType inputType;
  final bool obscuretext;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      onFieldSubmitted: onsubmit,
      validator: validator,
      obscureText: obscuretext,
      decoration: InputDecoration(
        hintText: hinttext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        suffixIcon: GestureDetector(
          onTap: ontap,
          child: Icon(
            suffixicon,
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
