import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

/// A Shimmer effect wrapper for loading placeholders.
class AtomixShimmer extends StatefulWidget {
  /// The widget to apply the shimmer effect to.
  final Widget child;

  /// Whether the shimmer is active.
  final bool isActive;

  /// Custom base color for foundation override.
  final Color? baseColor;

  /// Custom highlight color for foundation override.
  final Color? highlightColor;

  const AtomixShimmer({
    super.key,
    required this.child,
    this.isActive = true,
    this.baseColor,
    this.highlightColor,
  });

  @override
  State<AtomixShimmer> createState() => _AtomixShimmerState();
}

class _AtomixShimmerState extends State<AtomixShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(begin: -2.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );

    if (widget.isActive) _controller.repeat();
  }

  @override
  void didUpdateWidget(AtomixShimmer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.isActive && _controller.isAnimating) {
      _controller.stop();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isActive) return widget.child;

    final theme = AtomixTheme.of(context);
    final defaultBaseColor = widget.baseColor ?? theme.colors.border;
    final defaultHighlightColor =
        widget.highlightColor ?? widget.baseColor ?? theme.colors.border;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                defaultBaseColor.withValues(alpha: 0.1),
                defaultHighlightColor.withValues(alpha: 0.6),
                defaultBaseColor.withValues(alpha: 0.1),
              ],
              stops: const [0.1, 0.5, 0.9],
              transform: _SlidingGradientTransform(offset: _animation.value),
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  final double offset;
  const _SlidingGradientTransform({required this.offset});

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * offset, 0, 0);
  }
}
