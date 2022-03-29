import 'dart:async';

import 'package:flutter/material.dart';

import '../config/toast_config.dart';
import '../models/toast_message_icon.dart';

class Toast extends StatefulWidget {
  final String text;
  final ToastMessageIcon? icon;

  const Toast({Key? key, required this.text, this.icon}) : super(key: key);

  @override
  _ToastState createState() => _ToastState();
}

class _ToastState extends State<Toast> with SingleTickerProviderStateMixin {
  var currenSecond = 0;
  late final _animationCntlr = AnimationController(vsync: this, duration: const Duration(milliseconds: kDurationAnimation));
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  @override
  void dispose() {
    _animationCntlr.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final icon = widget.icon;
    return SafeArea(
      child: IgnorePointer(
        child: SlideTransition(
          position: _setAnimation(),
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Material(
                shadowColor: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.antiAlias,
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2, color: const Color.fromARGB(255, 175, 211, 240)),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: double.infinity,
                    minHeight: 60,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        if (icon != null)
                          Row(
                            children: [
                              SizedBox.square(
                                dimension: 24,
                                child: icon.getIcon(),
                              ),
                              const SizedBox(width: 16),
                            ],
                          ),
                        Expanded(
                          child: Text(widget.text, maxLines: 5),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Animation<Offset> _setAnimation() {
    return Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationCntlr,
        curve: Curves.ease,
      ),
    );
  }

  void _startAnimation() {
    _animationCntlr.forward().whenComplete(_startTimer);
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        final tick = timer.tick;
        currenSecond = tick;
        if (tick >= kDisplayDuration) {
          timer.cancel();
          _animationCntlr.reverse();
        }
      },
    );
  }
}
