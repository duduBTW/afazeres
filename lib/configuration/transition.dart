import 'package:flutter/material.dart';

PageRouteBuilder slidePageTransition(Widget pageItem) {
  return PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        return SlideTransition(
            child: child,
            position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                .animate(animation));
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return pageItem;
      },
      transitionDuration: const Duration(milliseconds: 300));
}

PageRouteBuilder slideUpPageTransition(Widget pageItem) {
  return PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        return SlideTransition(
            child: child,
            position: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
                .animate(animation));
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return pageItem;
      },
      transitionDuration: const Duration(milliseconds: 300));
}
