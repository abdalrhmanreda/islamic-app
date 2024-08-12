import 'package:flutter/material.dart';

import '../animation/animation_navigate.dart';

extension Navigation on BuildContext {
  Future<dynamic> navigateToWidget(context, widget) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
  Future<dynamic> navigateToWidgetByNamed(context, String routeName,
          {Object? arguments}) =>
      Navigator.pushNamed(context, routeName, arguments: arguments);
  Future<dynamic> navigateAndFinishNyNamed(context, String routeName,
          {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        routeName,
        (Route<dynamic> route) => false,
        arguments: arguments,
      );
  Future<dynamic> navigateAndFinish(context, Widget widget) =>
      Navigator.pushAndRemoveUntil(
        context,
        ScaleTransition1(widget),
        (Route<dynamic> route) => false,
      );

  Future<dynamic> navigateAndReplacement(context, String routeName,
          {Object? arguments}) =>
      Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  void pop(context) => Navigator.pop(context);
}
