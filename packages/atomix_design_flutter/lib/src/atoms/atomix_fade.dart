import 'package:flutter/material.dart';

/// Atomix fade component.
///
/// A simple atom that adds a fade-in animation to its child.
class AtomixFade extends StatefulWidget {
  /// Creates an Atomix fade widget.
  const AtomixFade({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeIn,
  });

  /// The widget to animate.
  final Widget child;

  /// The duration of the fade animation.
  final Duration duration;

  /// The animation curve.
  final Curve curve;

  @override
  State<AtomixFade> createState() => _AtomixFadeState();
}

class _AtomixFadeState extends State<AtomixFade>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
