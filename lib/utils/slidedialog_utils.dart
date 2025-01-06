import 'package:flutter/material.dart';

class SlideDialog {
  static slideFromBottom(
      {required BuildContext context, required Widget child}) async {
    await Future.delayed(Duration.zero).then((value) => showGeneralDialog(
          transitionDuration: const Duration(milliseconds: 500),
          context: context,
          pageBuilder: (context, anim1, anim2) => child,
          transitionBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
                .animate(animation),
            child: child,
          ),
        ));
  }
}
