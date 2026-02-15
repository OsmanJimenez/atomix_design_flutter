import 'package:flutter/material.dart';

enum AtomixButtonGroupOrientation { horizontal, vertical }

class AtomixButtonGroup extends StatefulWidget {
  final List<Widget> children;
  final AtomixButtonGroupOrientation orientation;
  final double spacing;
  final bool isToggleGroup;
  final List<int> selectedIndices;
  final ValueChanged<List<int>>? onSelectionChanged;
  final bool allowMultiple;

  const AtomixButtonGroup({
    super.key,
    required this.children,
    this.orientation = AtomixButtonGroupOrientation.horizontal,
    this.spacing = 8.0,
    this.isToggleGroup = false,
    this.selectedIndices = const [],
    this.onSelectionChanged,
    this.allowMultiple = false,
  });

  @override
  State<AtomixButtonGroup> createState() => _AtomixButtonGroupState();
}

class _AtomixButtonGroupState extends State<AtomixButtonGroup> {
  late List<int> _selectedIndices;

  @override
  void initState() {
    super.initState();
    _selectedIndices = List.from(widget.selectedIndices);
  }

  void _handleTap(int index) {
    if (!widget.isToggleGroup) return;

    setState(() {
      if (widget.allowMultiple) {
        if (_selectedIndices.contains(index)) {
          _selectedIndices.remove(index);
        } else {
          _selectedIndices.add(index);
        }
      } else {
        _selectedIndices.clear();
        _selectedIndices.add(index);
      }
    });

    widget.onSelectionChanged?.call(_selectedIndices);
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isToggleGroup) {
      if (widget.orientation == AtomixButtonGroupOrientation.horizontal) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: _buildSpacedChildren(),
        );
      } else {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _buildSpacedChildren(),
        );
      }
    }

    final List<Widget> children = [];
    for (int i = 0; i < widget.children.length; i++) {
      final child = widget.children[i];
      // Remove unused isSelected variable for now

      children.add(
        GestureDetector(
          onTap: () => _handleTap(i),
          child: AbsorbPointer(
            absorbing: true, // Absorb clicks so wrapper handles them
            child: child,
          ),
        ),
      );

      if (i < widget.children.length - 1) {
        children.add(
          widget.orientation == AtomixButtonGroupOrientation.horizontal
              ? SizedBox(width: widget.spacing)
              : SizedBox(height: widget.spacing),
        );
      }
    }

    if (widget.orientation == AtomixButtonGroupOrientation.horizontal) {
      return Row(mainAxisSize: MainAxisSize.min, children: children);
    }
    return Column(mainAxisSize: MainAxisSize.min, children: children);
  }

  List<Widget> _buildSpacedChildren() {
    final List<Widget> items = [];
    for (int i = 0; i < widget.children.length; i++) {
      items.add(widget.children[i]);
      if (i < widget.children.length - 1) {
        items.add(
          widget.orientation == AtomixButtonGroupOrientation.horizontal
              ? SizedBox(width: widget.spacing)
              : SizedBox(height: widget.spacing),
        );
      }
    }
    return items;
  }
}
