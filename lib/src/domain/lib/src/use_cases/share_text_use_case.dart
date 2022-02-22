import 'package:flutter/foundation.dart';
import 'package:share_plus/share_plus.dart';

class ShareTextUseCase {
  Future<void> call(String text) async {
    try {
      await Share.share(text);
    } on Exception catch (e) {
      debugPrint('Error share weather: $e');
    }
  }
}
