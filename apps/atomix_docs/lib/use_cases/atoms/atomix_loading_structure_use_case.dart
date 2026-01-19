import 'package:atomix_design_flutter/atomix_design_flutter.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import '../../widgets/code_snippet.dart';

@widgetbook.UseCase(
  name: 'Loading & Structure',
  path: '[Atoms]',
  type: AtomixSkeleton,
)
Widget loadingStructureUseCase(BuildContext context) {
  final isShimmering = context.knobs.boolean(
    label: 'Is Shimmering',
    initialValue: true,
  );

  return SingleChildScrollView(
    padding: const EdgeInsets.all(AtomixSpacing.lg),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AtomixText(
          'Loading & Structure Atoms',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.md(),
        const AtomixText(
          'Components for handling loading states and structural previews.',
        ),
        const AtomixSpacer.xl(),

        // Skeleton & Shimmer
        const AtomixText(
          'Skeleton & Shimmer',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.sm(),
        AtomixShimmer(
          isActive: isShimmering,
          child: Column(
            children: [
              Row(
                children: [
                  const AtomixSkeleton(width: 50, height: 50, isCircle: true),
                  const AtomixSpacer.md(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AtomixSkeleton(width: double.infinity, height: 16),
                        const AtomixSpacer.xs(),
                        AtomixSkeleton(width: 150, height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const AtomixSpacer.lg(),

        // Tooltip
        const AtomixText(
          'AtomixTooltip',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.sm(),
        const AtomixTooltip(
          message: 'This is a helpful tooltip',
          child: AtomixBadge(label: 'Hover or Long Press me'),
        ),
        const AtomixSpacer.lg(),

        // Thumbnail
        const AtomixText(
          'AtomixThumbnail',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const AtomixSpacer.sm(),
        Row(
          children: const [
            AtomixThumbnail(imageUrl: 'https://picsum.photos/200'),
            AtomixSpacer.md(),
            AtomixThumbnail(imageUrl: 'https://picsum.photos/201', size: 48),
            AtomixSpacer.md(),
            AtomixThumbnail(imageUrl: 'https://picsum.photos/202', size: 32),
          ],
        ),

        const AtomixSpacer.xl(),
        CodeSnippet(
          code:
              '''// Skeleton & Shimmer
AtomixShimmer(
  isActive: $isShimmering,
  child: AtomixSkeleton(width: 200, height: 20),
)

// Tooltip
AtomixTooltip(
  message: 'Info here',
  child: Icon(Icons.info),
)

// Thumbnail
AtomixThumbnail(imageUrl: 'https://...')''',
        ),
      ],
    ),
  );
}
