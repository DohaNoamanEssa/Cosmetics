import 'dart:async';

import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();

void goTo(Widget page, {bool canPop = false, int? delayInSeconds}) {
  void action() {
    Navigator.pushAndRemoveUntil(
      navKey.currentContext!,
      MaterialPageRoute(builder: (context) => page),
      (route) => canPop,
    );
  }

  if (delayInSeconds != null) {
    Timer(Duration(seconds: delayInSeconds), () {
      action();
    });
  } else {
    action();
  }
}

void showMsg(String? msg, {bool isError = false}) {
  if (msg != null && msg.isNotEmpty) {
    ScaffoldMessenger.of(navKey.currentContext!).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 3),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }
}


