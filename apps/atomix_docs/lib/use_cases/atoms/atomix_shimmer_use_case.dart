import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Shimmer',
  type: AtomixShimmer,
)
Widget shimmerPlayground(BuildContext context) {
  final isActive = context.knobs.boolean(
    label: 'Shimmer > Is Active',
    initialValue: true,
  );

  final code =
      '''AtomixShimmer(
  isActive: $isActive,
  child: AtomixSkeleton(width: 200, height: 20),
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixShimmer(
            isActive: isActive,
            child: const AtomixSkeleton(width: 300, height: 100),
          ),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Loading Product',
  path: '[Atoms]/Shimmer',
  type: AtomixShimmer,
)
Widget shimmerProduct(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          AtomixShimmer(
            child: Column(
              children: [
                AtomixSkeleton(width: 250, height: 150),
                SizedBox(height: 12),
                AtomixSkeleton(width: 200, height: 20),
                SizedBox(height: 8),
                AtomixSkeleton(width: 100, height: 16),
              ],
            ),
          ),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''AtomixShimmer(
  child: ProductCardSkeleton(),
)''',
          ),
        ],
      ),
    ),
  );
}
