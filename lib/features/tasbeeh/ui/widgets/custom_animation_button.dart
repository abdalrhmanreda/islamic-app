import 'package:flutter/material.dart';

class CustomAnimationButton extends StatefulWidget {
  final GestureTapCallback onPressed;
  final double height;
  final double width;
  final Widget child;
  final Decoration? decoration;

  const CustomAnimationButton({
    super.key,
    required this.onPressed,
    this.height = 64,
    this.width = 200,
    required this.child,
    this.decoration,
  });

  @override
  _CustomAnimationButtonState createState() => _CustomAnimationButtonState();
}

class _CustomAnimationButtonState extends State<CustomAnimationButton> {
  static const Curve _curve = Curves.easeIn;
  static const double _shadowHeight = 4;
  double _position = 0;

  @override
  Widget build(BuildContext context) {
    final double _height = widget.height - _shadowHeight;

    return GestureDetector(
      onTapDown: _pressed,
      onTapUp: _unPressedOnTapUp,
      onTapCancel: _unPressed,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: AnimatedContainer(
          curve: _curve,
          duration: const Duration(milliseconds: 70),
          margin: EdgeInsets.only(bottom: _position),
          width: widget.width,
          height: _height,
          decoration: widget.decoration ??
              BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
          child: Center(
            child: widget.child,
          ),
        ),
      ),
    );
  }

  void _pressed(_) {
    setState(() {
      _position = 4;
    });
  }

  void _unPressedOnTapUp(_) => _unPressed();

  void _unPressed() {
    setState(() {
      _position = 0;
    });
    widget.onPressed();
  }
}
