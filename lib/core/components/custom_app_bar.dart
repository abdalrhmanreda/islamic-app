import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.color,
    this.isCenter,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? color;
  final bool? isCenter;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: color,
      title: title,
      actions: actions,
      leading: leading,
      centerTitle: isCenter ?? false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
