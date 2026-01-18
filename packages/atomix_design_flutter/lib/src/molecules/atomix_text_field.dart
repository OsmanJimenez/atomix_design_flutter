import 'package:flutter/material.dart';
import '../foundation/atomix_radius.dart';

/// Atomix text field component.
///
/// A text input component with support for labels, hints, helpers, and error messages.
/// Built on top of Material TextField with Atomix design tokens.
///
/// Example:
/// ```dart
/// AtomixTextField(
///   label: 'Email',
///   hint: 'Enter your email',
///   controller: emailController,
///   keyboardType: TextInputType.emailAddress,
/// )
/// ```
class AtomixTextField extends StatelessWidget {
  /// Creates an Atomix text field.
  const AtomixTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.autofocus = false,
  });

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Optional label text displayed above the field.
  final String? label;

  /// Optional hint text displayed when the field is empty.
  final String? hint;

  /// Optional helper text displayed below the field.
  final String? helperText;

  /// Optional error text displayed below the field.
  final String? errorText;

  /// Optional icon displayed at the start of the field.
  final IconData? prefixIcon;

  /// Optional icon displayed at the end of the field.
  final IconData? suffixIcon;

  /// Whether to obscure the text (for passwords).
  final bool obscureText;

  /// Whether the field is enabled.
  final bool enabled;

  /// Whether the field is read-only.
  final bool readOnly;

  /// Maximum number of lines for the text field.
  final int? maxLines;

  /// Minimum number of lines for the text field.
  final int? minLines;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// The type of action button to use for the keyboard.
  final TextInputAction? textInputAction;

  /// Called when the text changes.
  final ValueChanged<String>? onChanged;

  /// Called when the user submits the text.
  final ValueChanged<String>? onSubmitted;

  /// Defines the keyboard focus for this widget.
  final FocusNode? focusNode;

  /// Whether this text field should focus itself if nothing else is already focused.
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: maxLines,
      minLines: minLines,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        border: OutlineInputBorder(borderRadius: AtomixRadius.mdBorderRadius),
      ),
    );
  }
}
