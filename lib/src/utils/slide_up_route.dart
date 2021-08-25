import 'package:flutter/material.dart';

class SlideUpRoute extends PageRouteBuilder {
  final Widget child;

  SlideUpRoute({
    required this.child,
    RouteSettings? settings,
  }) : super(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) => child,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation.drive(Tween<Offset>(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.ease))),
              child: child,
            );
          },
        );
}
