import 'package:flutter/material.dart';

class DrawerListviewImage extends StatelessWidget {
  const DrawerListviewImage({
    super.key,
    required this.icon,
    required this.onPressed, required this.title,
  });
  final void Function()? onPressed;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          IconButton(onPressed: onPressed, icon: Icon(icon)),
          Text(title),
        ],
      ),
    );
  }
}
