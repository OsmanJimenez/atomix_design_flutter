import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Playground',
  path: '[Atoms]/Skeleton',
  type: AtomixSkeleton,
)
Widget skeletonPlayground(BuildContext context) {
  final width = context.knobs.double.slider(
    label: 'Skeleton > Width',
    min: 20,
    max: 300,
    initialValue: 150,
  );

  final height = context.knobs.double.slider(
    label: 'Skeleton > Height',
    min: 10,
    max: 300,
    initialValue: 20,
  );

  final isCircle = context.knobs.boolean(
    label: 'Skeleton > Is Circle',
    initialValue: false,
  );

  final code =
      '''AtomixSkeleton(
  width: $width,
  height: $height,
  isCircle: $isCircle,
)''';

  return Center(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AtomixSkeleton(width: width, height: height, isCircle: isCircle),
          const SizedBox(height: 32),
          CodeSnippet(code: code),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Avatars & Lines',
  path: '[Atoms]/Skeleton',
  type: AtomixSkeleton,
)
Widget skeletonAvatars(BuildContext context) {
  return const Center(
    child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AtomixSkeleton(width: 50, height: 50, isCircle: true),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AtomixSkeleton(width: 120, height: 16),
                  SizedBox(height: 8),
                  AtomixSkeleton(width: 80, height: 12),
                ],
              ),
            ],
          ),
          SizedBox(height: 24),
          CodeSnippet(
            code: '''// Profile Skeleton
Row(
  children: [
    AtomixSkeleton(width: 50, height: 50, isCircle: true),
    Column(
      children: [
        AtomixSkeleton(width: 120, height: 16),
        AtomixSkeleton(width: 80, height: 12),
      ],
    ),
  ],
)''',
          ),
        ],
      ),
    ),
  );
}
