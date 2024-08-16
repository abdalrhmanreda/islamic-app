import 'package:flutter/material.dart';

class ArabicQuranOnly extends StatelessWidget {
  const ArabicQuranOnly({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Text(
          'سورة الفاتحة - آية $index',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: 10,
    );
  }
}
