import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

@widgetbook.UseCase(name: 'Default', type: AtomixTextField)
Widget atomixTextFieldDefault(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AtomixTextField(label: 'Email', hint: 'Enter your email'),
  );
}

@widgetbook.UseCase(name: 'With Helper Text', type: AtomixTextField)
Widget atomixTextFieldWithHelper(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AtomixTextField(
      label: 'Username',
      hint: 'Choose a username',
      helperText: 'Must be at least 3 characters',
    ),
  );
}

@widgetbook.UseCase(name: 'With Error', type: AtomixTextField)
Widget atomixTextFieldWithError(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AtomixTextField(
      label: 'Email',
      hint: 'Enter your email',
      errorText: 'Invalid email address',
    ),
  );
}

@widgetbook.UseCase(name: 'With Prefix Icon', type: AtomixTextField)
Widget atomixTextFieldWithPrefixIcon(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AtomixTextField(
      label: 'Search',
      hint: 'Search...',
      prefixIcon: Icons.search,
    ),
  );
}

@widgetbook.UseCase(name: 'Password', type: AtomixTextField)
Widget atomixTextFieldPassword(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AtomixTextField(
      label: 'Password',
      hint: 'Enter your password',
      obscureText: true,
      suffixIcon: Icons.visibility_off,
    ),
  );
}

@widgetbook.UseCase(name: 'Multiline', type: AtomixTextField)
Widget atomixTextFieldMultiline(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AtomixTextField(
      label: 'Description',
      hint: 'Enter a description',
      maxLines: 4,
      minLines: 3,
    ),
  );
}

@widgetbook.UseCase(name: 'Disabled', type: AtomixTextField)
Widget atomixTextFieldDisabled(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(16),
    child: AtomixTextField(
      label: 'Disabled',
      hint: 'This field is disabled',
      enabled: false,
    ),
  );
}
