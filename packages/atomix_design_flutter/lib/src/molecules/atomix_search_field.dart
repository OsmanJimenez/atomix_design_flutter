import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';
import '../theme/atomix_theme.dart';

class AtomixSearchField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final bool autofocus;

  const AtomixSearchField({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.onClear,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return TextField(
      controller: controller,
      onChanged: onChanged,
      autofocus: autofocus,
      decoration: InputDecoration(
        hintText: hintText ?? 'Search...',
        prefixIcon: Icon(Icons.search, color: theme.colors.textSecondary),
        suffixIcon: controller?.text.isNotEmpty == true
            ? IconButton(
                icon: Icon(Icons.clear, color: theme.colors.textSecondary),
                onPressed: () {
                  controller?.clear();
                  onClear?.call();
                },
              )
            : null,
        filled: true,
        fillColor: theme.colors.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
    );
  }
}
