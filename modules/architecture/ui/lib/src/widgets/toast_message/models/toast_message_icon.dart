import 'package:flutter/material.dart';

enum ToastMessageIcon {
  info,
}

extension GetToastMessageIconExtension on ToastMessageIcon {
  Widget getIcon() {
    switch (this) {
      case ToastMessageIcon.info:
        return const Icon(Icons.info_outline, color: Colors.blue);
    }
  }
}
