import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/atomix_theme.dart';

/// Atomix text form field component.
///
/// A text input component that integrates with Flutter's [Form] and [TextFormField].
/// Supports validation, saving, and automatic error states.
///
/// Example:
/// ```dart
/// AtomixTextFormField(
///   label: 'Email',
///   validator: (value) => value!.contains('@') ? null : 'Invalid email',
///   onSaved: (value) => _email = value,
/// )
/// ```
class AtomixTextFormField extends StatelessWidget {
  /// Creates an Atomix text form field.
  const AtomixTextFormField({
    super.key,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.showCursor,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
    this.label,
    this.hint,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.errorText,
  });

  /// The text field label.
  final String? label;

  /// The hint text.
  final String? hint;

  /// Helper text displayed below the field.
  final String? helperText;

  /// Optional error text override.
  final String? errorText;

  /// Icon at the start of the field.
  final IconData? prefixIcon;

  /// Icon at the end of the field.
  final IconData? suffixIcon;

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Optional initial value.
  final String? initialValue;

  /// The node that handles keyboard focus.
  final FocusNode? focusNode;

  /// The appearance of the text field.
  final InputDecoration decoration;

  /// Type of keyboard to display.
  final TextInputType? keyboardType;

  /// How to capitalize text.
  final TextCapitalization textCapitalization;

  /// The action button for the keyboard.
  final TextInputAction? textInputAction;

  /// The style to use for the text being edited.
  final TextStyle? style;

  /// The strut style to use.
  final StrutStyle? strutStyle;

  /// The directionality of the text.
  final TextDirection? textDirection;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// How the text should be aligned vertically.
  final TextAlignVertical? textAlignVertical;

  /// Whether this text field should focus itself.
  final bool autofocus;

  /// Whether the text field is read-only.
  final bool readOnly;

  /// Whether to show the cursor.
  final bool? showCursor;

  /// Character used to obscure text.
  final String obscuringCharacter;

  /// Whether to obscure text.
  final bool obscureText;

  /// Whether to enable autocorrect.
  final bool autocorrect;

  /// Smart dashes type.
  final SmartDashesType? smartDashesType;

  /// Smart quotes type.
  final SmartQuotesType? smartQuotesType;

  /// Whether to enable suggestions.
  final bool enableSuggestions;

  /// Max length enforcement.
  final MaxLengthEnforcement? maxLengthEnforcement;

  /// Maximum lines for the field.
  final int? maxLines;

  /// Minimum lines for the field.
  final int? minLines;

  /// Whether the field expands to fill its parent.
  final bool expands;

  /// Maximum logical characters.
  final int? maxLength;

  /// Called when the text changes.
  final ValueChanged<String>? onChanged;

  /// Called when the user taps on the text field.
  final GestureTapCallback? onTap;

  /// Called when editing is complete.
  final VoidCallback? onEditingComplete;

  /// Called when the field is submitted.
  final ValueChanged<String>? onFieldSubmitted;

  /// Called when the form is saved.
  final FormFieldSetter<String>? onSaved;

  /// Function that validates the input.
  final FormFieldValidator<String>? validator;

  /// Optional input formatters.
  final List<dynamic>? inputFormatters;

  /// Whether the field is enabled.
  final bool? enabled;

  /// Width of the cursor.
  final double cursorWidth;

  /// Height of the cursor.
  final double? cursorHeight;

  /// Radius of the cursor.
  final Radius? cursorRadius;

  /// Color of the cursor.
  final Color? cursorColor;

  /// Keyboard appearance based on brightness.
  final Brightness? keyboardAppearance;

  /// Padding around the scrollable area.
  final EdgeInsets scrollPadding;

  /// Whether interactive selection is enabled.
  final bool enableInteractiveSelection;

  /// Handlers for selection controls.
  final TextSelectionControls? selectionControls;

  /// Counter widget builder.
  final InputCounterWidgetBuilder? buildCounter;

  /// Physics for the scrollable.
  final ScrollPhysics? scrollPhysics;

  /// Autofill hints.
  final Iterable<String>? autofillHints;

  /// Autovalidate mode.
  final AutovalidateMode? autovalidateMode;

  /// Scroll controller.
  final ScrollController? scrollController;

  /// Restoration ID.
  final String? restorationId;

  /// IME personalized learning.
  final bool enableIMEPersonalizedLearning;

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      focusNode: focusNode,
      decoration: decoration.copyWith(
        labelText: label,
        hintText: hint,
        helperText: helperText,
        errorText: errorText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(theme.radius.md),
        ),
        labelStyle: theme.typography.bodyMedium,
        hintStyle: theme.typography.bodyMedium.copyWith(
          color: theme.colors.textSecondary,
        ),
      ),
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      style: style,
      strutStyle: strutStyle,
      textDirection: textDirection,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
      autofocus: autofocus,
      readOnly: readOnly,
      showCursor: showCursor,
      obscuringCharacter: obscuringCharacter,
      obscureText: obscureText,
      autocorrect: autocorrect,
      smartDashesType: smartDashesType,
      smartQuotesType: smartQuotesType,
      enableSuggestions: enableSuggestions,
      maxLengthEnforcement: maxLengthEnforcement,
      maxLines: maxLines,
      minLines: minLines,
      expands: expands,
      maxLength: maxLength,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      inputFormatters: inputFormatters?.cast<TextInputFormatter>(),
      enabled: enabled,
      cursorWidth: cursorWidth,
      cursorHeight: cursorHeight,
      cursorRadius: cursorRadius,
      cursorColor: cursorColor,
      keyboardAppearance: keyboardAppearance,
      scrollPadding: scrollPadding,
      enableInteractiveSelection: enableInteractiveSelection,
      selectionControls: selectionControls,
      buildCounter: buildCounter,
      scrollPhysics: scrollPhysics,
      autofillHints: autofillHints,
      autovalidateMode: autovalidateMode,
      scrollController: scrollController,
      restorationId: restorationId,
      enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
    );
  }
}
