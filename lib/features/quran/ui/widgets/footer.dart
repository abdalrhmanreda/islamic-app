import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muslim_app/config/themes/font_weight.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Text(
            ArabicNumbers().convert(index),
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.regular,
              fontFamily: 'Amiri',
              color: Colors.black,
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
