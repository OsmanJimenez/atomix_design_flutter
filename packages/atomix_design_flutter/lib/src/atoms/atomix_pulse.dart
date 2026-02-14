import 'package:flutter/material.dart';

/// Atomix pulse component.
///
/// An animation atom that adds a pulsating effect to its child.
class AtomixPulse extends StatefulWidget {
  /// Creates an Atomix pulse widget.
  const AtomixPulse({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.begin = 0.9,
    this.end = 1.1,
  });

  /// The widget to animate.
  final Widget child;

  /// The duration of one pulse cycle.
  final Duration duration;

  /// The starting scale.
  final double begin;

  /// The ending scale.
  final double end;

  @override
  State<AtomixPulse> createState() => _AtomixPulseState();
}

class _AtomixPulseState extends State<AtomixPulse>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);
    _animation = Tween<double>(
      begin: widget.begin,
      end: widget.end,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _animation, child: widget.child);
  }
}
