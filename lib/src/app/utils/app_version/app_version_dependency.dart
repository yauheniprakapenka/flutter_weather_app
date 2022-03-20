import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:yaml/yaml.dart';

import 'app_version.dart';

Future<void> initAppVersionDependency() async {
  final yamlString = await rootBundle.loadString('pubspec.yaml');
  final YamlMap parsedYaml = loadYaml(yamlString);
  final String? version = parsedYaml['version'];
  Get.put(AppVersion(version ?? ''));
}
