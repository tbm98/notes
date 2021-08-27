import 'package:flutter/material.dart';

/// in Flutter stable 2.2.3, AnimatedSize required vsync, so I want to wrap it
/// into my widget  for easier to use
class MyAnimatedSize extends StatefulWidget {
  const MyAnimatedSize({
    Key? key,
    required this.child,
    required this.duration,
    this.curve = Curves.linear,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final Curve curve;

  @override
  _MyAnimatedSizeState createState() => _MyAnimatedSizeState();
}

class _MyAnimatedSizeState extends State<MyAnimatedSize>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: widget.duration,
      vsync: this,
      curve: widget.curve,
      child: widget.child,
    );
  }
}
