import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../config/themes/font_weight.dart';
import '../../logic/home_cubit.dart';

class CountdownText extends StatefulWidget {
  final DateTime targetTime;

  const CountdownText({required this.targetTime, super.key});

  @override
  _CountdownTextState createState() => _CountdownTextState();
}

class _CountdownTextState extends State<CountdownText> {
  late Timer _timer;
  Duration _difference = Duration.zero;

  @override
  void initState() {
    super.initState();
    _updateDifference();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateDifference();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateDifference() {
    final now = DateTime.now();
    if (widget.targetTime.isAfter(now)) {
      setState(() {
        _difference = widget.targetTime.difference(now);
      });
    } else {
      setState(() {
        _difference = Duration.zero;
      });
      context.read<HomeCubit>().getPrayerTimes();
      _timer.cancel(); // Stop the timer if target time has passed
    }
  }

  @override
  Widget build(BuildContext context) {
    int hours = _difference.inHours;
    int minutes = _difference.inMinutes.remainder(60);
    int seconds = _difference.inSeconds.remainder(60);

    return Text(
      '${AppLocalizations.of(context)!.stillInTime} ${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: AppColors.kWhiteColor,
        fontWeight: FontWeightHelper.regular,
        fontSize: 17.sp,
      ),
    );
  }
}
