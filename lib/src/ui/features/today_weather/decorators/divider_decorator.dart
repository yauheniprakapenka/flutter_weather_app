import 'package:flutter/material.dart';

class DividerDecorator extends StatelessWidget {
  const DividerDecorator({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const SizedBox(
      width: 160,
      child: Divider(),
    );
  }
}
