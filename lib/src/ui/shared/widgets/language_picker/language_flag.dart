import 'package:flutter/material.dart';

import 'flag_extension.dart';

class LanguageFlag extends StatelessWidget {
  final double size;

  const LanguageFlag({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(context) {
    final locale = Localizations.localeOf(context);
    final flag = locale.languageCode.getFlag();
    return Text(
      flag,
      style: TextStyle(fontSize: size),
    );
  }
}
