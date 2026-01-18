import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:atomix_design_flutter/atomix_design_flutter.dart';

void main() {
  group('AtomixTheme', () {
    test('light theme should be created with correct brightness', () {
      final theme = AtomixTheme.light();
      expect(theme.brightness, Brightness.light);
      expect(theme.useMaterial3, true);
    });

    test('dark theme should be created with correct brightness', () {
      final theme = AtomixTheme.dark();
      expect(theme.brightness, Brightness.dark);
      expect(theme.useMaterial3, true);
    });

    test('custom theme should accept overrides', () {
      final theme = AtomixTheme.themeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
      );
      expect(theme.colorScheme.primary, Colors.blue);
    });

    test('light theme should have correct color scheme', () {
      final theme = AtomixTheme.light();
      expect(theme.colorScheme.primary, AtomixColors.primary);
      expect(theme.colorScheme.secondary, AtomixColors.secondary);
    });

    test('dark theme should have correct color scheme', () {
      final theme = AtomixTheme.dark();
      expect(theme.colorScheme.primary, AtomixColors.primary);
      expect(theme.colorScheme.secondary, AtomixColors.secondary);
    });
  });
}
