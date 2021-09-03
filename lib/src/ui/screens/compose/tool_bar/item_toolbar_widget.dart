import 'package:flutter/material.dart';

class ItemToolBar extends StatelessWidget {
  const ItemToolBar({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);
  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(width: 48, height: 48, child: child),
      onTap: onTap,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
