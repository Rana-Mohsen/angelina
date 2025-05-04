import 'package:angelina/models/home/product_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({super.key, required this.attributes});
  final List<Attribute> attributes;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  List<dynamic> optionsList() {
    for (var item in widget.attributes.reversed) {
      if (item.id == 13) {
        return item.options;
      }
    }
    return [];
  }

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.arrow_drop_down),
        contentPadding: EdgeInsets.zero,
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.3, color: Colors.black.withAlpha(20)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.3, color: Colors.black.withAlpha(20)),
        ),
      ),
      icon: SizedBox.shrink(),
      hint: Text(
        selectedValue ?? "تحديد احد الخيارات",
        style: TextStyle(fontSize: 3.w),
        textDirection: TextDirection.rtl,
      ),
      menuMaxHeight: 22.h,
      items:
          optionsList().map((category) {
            return DropdownMenuItem(value: category, child: Text(category));
          }).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedValue = newValue!.toString(); // Update selected value
        });
      },
    );
  }
}
