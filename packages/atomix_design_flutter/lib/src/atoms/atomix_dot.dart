import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// A small status Dot component.
class AtomixDot extends StatelessWidget {
  /// Color of the dot.
  final Color color;

  /// Size of the dot (diameter).
  final double size;

  /// Whether the dot should have a pulsing animation.
  final bool isPulsing;

  /// Custom border radius for foundation override.
  final BorderRadius? borderRadius;

  const AtomixDot({
    super.key,
    this.color = AtomixColors.primary,
    this.size = 8,
    this.isPulsing = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    if (isPulsing) {
      return _PulsingDot(color: color, size: size, borderRadius: borderRadius);
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(size),
      ),
    );
  }
}

class _PulsingDot extends StatefulWidget {
  final Color color;
  final double size;
  final BorderRadius? borderRadius;

  const _PulsingDot({
    required this.color,
    required this.size,
    this.borderRadius,
  });

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
    _animation = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            borderRadius:
                widget.borderRadius ?? BorderRadius.circular(widget.size),
            color: widget.color.withValues(alpha: _animation.value),
            boxShadow: [
              BoxShadow(
                color: widget.color.withValues(alpha: 0.3),
                blurRadius: 4 * (1 - _animation.value + 1),
                spreadRadius: 2 * (1 - _animation.value + 0.5),
              ),
            ],
          ),
        );
      },
    );
  }
}
