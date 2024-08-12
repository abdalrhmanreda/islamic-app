import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final VoidCallback onTap;
  final IconData leadingIcon;
  final String title;

  const CustomListTile({
    super.key,
    required this.onTap,
    required this.leadingIcon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(leadingIcon),
      title: Text(title),
    );
  }
}
