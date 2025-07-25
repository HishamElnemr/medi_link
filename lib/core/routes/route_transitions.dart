import 'package:flutter/material.dart';

Route fadeRoute(Widget page, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

Route fadeScaleRoute(Widget page, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) {
      final curved = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      return FadeTransition(
        opacity: curved,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.98, end: 1.0).animate(curved),
          child: child,
        ),
      );
    },
  );
}




Route slideFromRightRoute(Widget page, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    pageBuilder: (_, __, ___) => page,
    transitionsBuilder: (_, animation, __, child) {
      final offsetAnimation = Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(animation);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
