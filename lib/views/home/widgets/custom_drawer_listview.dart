import 'package:flutter/material.dart';

class DrawerListviewImage extends StatelessWidget {
  const DrawerListviewImage({
    super.key,
    required this.icon,
    required this.view, required this.onPressed,
  });
  final void Function()? onPressed;
  final IconData icon;
  final Widget view;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: IconButton(onPressed: onPressed, icon: Icon(icon)),
    );
  }
}
