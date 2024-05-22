import 'dart:async';
import 'package:flutter/material.dart';

class ShowupAnimation extends StatefulWidget {
  /// GETTING THE CHILD WIDGET
  final Widget child;
  /// GETTING THE ANIMATION DURATION
  final int? delay;

  ShowupAnimation({required this.child, this.delay});

  @override
  State<ShowupAnimation> createState() => _ShowupAnimationState();
}

class _ShowupAnimationState extends State<ShowupAnimation> with TickerProviderStateMixin {
  /// CREATING THE ANIMATION CONTROLLER VARIABLE
  late AnimationController _animController;
  /// CREATING THE ANIMATION VARIABLE OF TYPE OFFSET
  late Animation<Offset> _animOffset;
  /// CREATING THE TIMER VARIABLE
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final curve = CurvedAnimation(parent: _animController, curve: Curves.decelerate);
    _animOffset = Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero).animate(curve);

    if (widget.delay == null) {
      _animController.forward();
    } else {
      _timer = Timer(Duration(milliseconds: widget.delay!), () {
        _animController.forward();
      });
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
