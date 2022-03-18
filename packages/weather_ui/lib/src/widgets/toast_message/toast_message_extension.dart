import 'dart:async';

import 'package:flutter/material.dart';

import 'config/toast_config.dart';
import 'models/toast_message_icon.dart';
import 'widgets/toast.dart';

/// Displays toast message at the top of the screen and disappears.
///
/// Example usage:
/// ```
/// context.showToastMessage(
///    text: LocaleKeys.common_fail.tr(),
///    icon: ToastMessageIcon.fail,
/// );
/// ```
///
/// ![](https://user-images.githubusercontent.com/47568606/130655862-c8034be1-6516-4d9f-8b77-4549de8a796f.png)
extension ToastMessageExtension on BuildContext {
  Future<void> showToastMessage({required String text, ToastMessageIcon? icon}) async {
    await _ToastMessage(context: this, text: text, icon: icon)._show();
  }
}

class _ToastMessage {
  final BuildContext context;
  final String text;
  final ToastMessageIcon? icon;

  _ToastMessage({required this.context, required this.text, this.icon});

  Future<void> _show() async {
    final overlayEntry = OverlayEntry(
      builder: (context) {
        return Toast(text: text, icon: icon ?? ToastMessageIcon.info);
      },
    );
    Navigator.of(context).overlay?.insert(overlayEntry);
    await Future.delayed(Duration(seconds: _removingOverlayDuration()), overlayEntry.remove);
  }

  int _removingOverlayDuration() {
    const convertedAnimation = kDurationAnimation * 0.001;
    const sum = kDisplayDuration + convertedAnimation;
    return sum.ceil();
  }
}
