import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixColorPicker extends StatelessWidget {
  final Color selectedColor;
  final ValueChanged<Color> onColorChanged;
  final List<Color>? colors;

  const AtomixColorPicker({
    super.key,
    required this.selectedColor,
    required this.onColorChanged,
    this.colors,
  });

  static const List<Color> defaultColors = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
  ];

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    final colorList = colors ?? defaultColors;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: colorList.map((color) {
        final isSelected = color.toARGB32() == selectedColor.toARGB32();
        return GestureDetector(
          onTap: () => onColorChanged(color),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? theme.colors.textPrimary
                    : theme.colors.border,
                width: isSelected ? 3 : 1,
              ),
            ),
            child: isSelected
                ? Icon(Icons.check, color: Colors.white, size: 20)
                : null,
          ),
        );
      }).toList(),
    );
  }
}
