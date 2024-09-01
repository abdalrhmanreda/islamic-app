import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/font_weight.dart';

class CustomExpandable extends StatefulWidget {
  final String title;
  final Widget content;

  const CustomExpandable({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  _CustomExpandableState createState() => _CustomExpandableState();
}

class _CustomExpandableState extends State<CustomExpandable>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _iconRotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Animation for rotating the arrow icon.
    _iconRotation = Tween<double>(begin: 0.0, end: 0.5).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpand,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeightHelper.regular,
                  ),
                ),
                RotationTransition(
                  turns: _iconRotation,
                  child: const Icon(Icons.expand_more),
                ),
              ],
            ),
          ),
        ),
        // AnimatedSize automatically handles the size change animation
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: _isExpanded
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: widget.content,
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
