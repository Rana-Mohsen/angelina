import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchTextfield extends StatelessWidget {
  final void Function(String)? onChange;
  const SearchTextfield({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.right,
      onChanged: onChange,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 30,
        ),
        hintText: "ابحث",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withAlpha(35), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withAlpha(35), width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        // suffixIconColor: kGrayColor,
        suffixIcon: Icon(Icons.search),
      ),
    );
  }
}
