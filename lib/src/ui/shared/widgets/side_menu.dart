import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../../app/utils/app_version/app_version.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LanguagePicker(),
          const Spacer(),
          Text(Get.find<AppVersion>().versionAndBuild),
        ],
      ),
    );
  }
}
