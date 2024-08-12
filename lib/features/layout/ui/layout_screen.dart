import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [];

  final List<CustomNavigationBarItem> _items = [
    CustomNavigationBarItem(
      icon: const Icon(Iconsax.home_outline),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Iconsax.radio_outline),
    ),
    CustomNavigationBarItem(
      icon: const Icon(Iconsax.info_circle_outline),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: Text('Hello World'),
      ),
      // body: _screens[_currentIndex],
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: CustomNavigationBar(
      //     borderRadius: Radius.circular(15.r),
      //     currentIndex: _currentIndex,
      //     selectedColor: AppColors.kPrimaryColor,
      //     strokeColor: AppColors.kPrimaryColor,
      //     iconSize: 25.sp,
      //     onTap: _onTap,
      //     items: _items,
      //   ),
      // ),
    );
  }
}
