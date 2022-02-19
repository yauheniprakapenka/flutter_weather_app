import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return TextButton(
      onPressed: () {
        //
      },
      child: const Text(
        'Share',
        style: TextStyle(
          color: Color(0xFFf09763),
        ),
      ),
    );
  }
}
