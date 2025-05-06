import 'package:angelina/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlaceOrderTextField extends StatefulWidget {
  PlaceOrderTextField({
    super.key,
    this.hintText,
    required this.onChange,
    required this.validator,
    this.obscure = false,
    this.icon,
    this.keyboardType=TextInputType.name
  });

  String? hintText;
  Function(String) onChange;
  String? Function(String?)? validator;
  bool obscure;
  Widget? icon;
  TextInputType? keyboardType;
  @override
  State<PlaceOrderTextField> createState() => _PlaceOrderTextFieldState();
}

class _PlaceOrderTextFieldState extends State<PlaceOrderTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        // focusNode: _focusNode,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscure,
        validator: widget.validator,
        onChanged: widget.onChange,
        cursorColor: Colors.black,
        cursorHeight: 20,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          suffixIcon: widget.icon,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey),
          errorStyle: const TextStyle(
            color: kGreenColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          filled: true,
          fillColor: Colors.grey.shade300,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
