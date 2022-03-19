import 'package:flutter/material.dart';

import 'language_picker/language_picker.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 140,
      color: Colors.grey[100],
      child: Column(
        children: const [
          LanguagePicker(),
        ],
      ),
    );
  }
}
