import 'package:flutter/material.dart';

import 'language_flag.dart';
import 'picker.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Row(
      children: const [
        LanguageFlag(size: 22),
        SizedBox(width: 8),
        Picker(),
      ],
    );
  }
}
