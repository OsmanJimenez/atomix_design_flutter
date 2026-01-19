// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:atomix_docs/use_cases/atoms/atomix_badge_use_case.dart'
    as _atomix_docs_use_cases_atoms_atomix_badge_use_case;
import 'package:atomix_docs/use_cases/atoms/atomix_divider_use_case.dart'
    as _atomix_docs_use_cases_atoms_atomix_divider_use_case;
import 'package:atomix_docs/use_cases/atoms/atomix_icon_use_case.dart'
    as _atomix_docs_use_cases_atoms_atomix_icon_use_case;
import 'package:atomix_docs/use_cases/atoms/atomix_spacer_use_case.dart'
    as _atomix_docs_use_cases_atoms_atomix_spacer_use_case;
import 'package:atomix_docs/use_cases/atoms/atomix_text_use_case.dart'
    as _atomix_docs_use_cases_atoms_atomix_text_use_case;
import 'package:atomix_docs/use_cases/foundation/animations_use_case.dart'
    as _atomix_docs_use_cases_foundation_animations_use_case;
import 'package:atomix_docs/use_cases/foundation/breakpoints_use_case.dart'
    as _atomix_docs_use_cases_foundation_breakpoints_use_case;
import 'package:atomix_docs/use_cases/foundation/colors_use_case.dart'
    as _atomix_docs_use_cases_foundation_colors_use_case;
import 'package:atomix_docs/use_cases/foundation/customization_use_case.dart'
    as _atomix_docs_use_cases_foundation_customization_use_case;
import 'package:atomix_docs/use_cases/foundation/elevation_use_case.dart'
    as _atomix_docs_use_cases_foundation_elevation_use_case;
import 'package:atomix_docs/use_cases/foundation/radius_use_case.dart'
    as _atomix_docs_use_cases_foundation_radius_use_case;
import 'package:atomix_docs/use_cases/foundation/shadows_use_case.dart'
    as _atomix_docs_use_cases_foundation_shadows_use_case;
import 'package:atomix_docs/use_cases/foundation/spacing_use_case.dart'
    as _atomix_docs_use_cases_foundation_spacing_use_case;
import 'package:atomix_docs/use_cases/foundation/typography_use_case.dart'
    as _atomix_docs_use_cases_foundation_typography_use_case;
import 'package:atomix_docs/use_cases/layout/atomix_layout_use_case.dart'
    as _atomix_docs_use_cases_layout_atomix_layout_use_case;
import 'package:atomix_docs/use_cases/layout/layout_readme.dart'
    as _atomix_docs_use_cases_layout_layout_readme;
import 'package:atomix_docs/use_cases/molecules/atomix_button_use_case.dart'
    as _atomix_docs_use_cases_molecules_atomix_button_use_case;
import 'package:atomix_docs/use_cases/molecules/atomix_chip_use_case.dart'
    as _atomix_docs_use_cases_molecules_atomix_chip_use_case;
import 'package:atomix_docs/use_cases/molecules/atomix_list_tile_use_case.dart'
    as _atomix_docs_use_cases_molecules_atomix_list_tile_use_case;
import 'package:atomix_docs/use_cases/molecules/atomix_text_field_use_case.dart'
    as _atomix_docs_use_cases_molecules_atomix_text_field_use_case;
import 'package:atomix_docs/use_cases/organisms/atomix_app_bar_use_case.dart'
    as _atomix_docs_use_cases_organisms_atomix_app_bar_use_case;
import 'package:atomix_docs/use_cases/organisms/atomix_bottom_sheet_use_case.dart'
    as _atomix_docs_use_cases_organisms_atomix_bottom_sheet_use_case;
import 'package:atomix_docs/use_cases/organisms/atomix_card_use_case.dart'
    as _atomix_docs_use_cases_organisms_atomix_card_use_case;
import 'package:atomix_docs/use_cases/organisms/atomix_dialog_use_case.dart'
    as _atomix_docs_use_cases_organisms_atomix_dialog_use_case;
import 'package:atomix_docs/use_cases/templates/playground_template_use_case.dart'
    as _atomix_docs_use_cases_templates_playground_template_use_case;
import 'package:atomix_docs/use_cases/templates/templates_readme.dart'
    as _atomix_docs_use_cases_templates_templates_readme;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookCategory(
    name: 'Foundation',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'AtomixAnimations',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Animations',
            builder: _atomix_docs_use_cases_foundation_animations_use_case
                .animationsUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixBreakpoints',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Breakpoints',
            builder: _atomix_docs_use_cases_foundation_breakpoints_use_case
                .breakpointsUseCase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixShadows',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Shadows',
            builder: _atomix_docs_use_cases_foundation_shadows_use_case
                .shadowsUseCase,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'atoms',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'AtomixBadge',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Error',
            builder: _atomix_docs_use_cases_atoms_atomix_badge_use_case
                .atomixBadgeError,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Info',
            builder: _atomix_docs_use_cases_atoms_atomix_badge_use_case
                .atomixBadgeInfo,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Neutral',
            builder: _atomix_docs_use_cases_atoms_atomix_badge_use_case
                .atomixBadgeNeutral,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Playground',
            builder: _atomix_docs_use_cases_atoms_atomix_badge_use_case
                .atomixBadgePlayground,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Success',
            builder: _atomix_docs_use_cases_atoms_atomix_badge_use_case
                .atomixBadgeSuccess,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Warning',
            builder: _atomix_docs_use_cases_atoms_atomix_badge_use_case
                .atomixBadgeWarning,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Icon',
            builder: _atomix_docs_use_cases_atoms_atomix_badge_use_case
                .atomixBadgeWithIcon,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixDivider',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _atomix_docs_use_cases_atoms_atomix_divider_use_case
                .atomixDividerDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Large Spacing',
            builder: _atomix_docs_use_cases_atoms_atomix_divider_use_case
                .atomixDividerLarge,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Playground',
            builder: _atomix_docs_use_cases_atoms_atomix_divider_use_case
                .atomixDividerPlayground,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Indent',
            builder: _atomix_docs_use_cases_atoms_atomix_divider_use_case
                .atomixDividerIndent,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixIcon',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Colors',
            builder: _atomix_docs_use_cases_atoms_atomix_icon_use_case
                .atomixIconColors,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Playground',
            builder: _atomix_docs_use_cases_atoms_atomix_icon_use_case
                .atomixIconPlayground,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Sizes',
            builder: _atomix_docs_use_cases_atoms_atomix_icon_use_case
                .atomixIconSizes,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixSpacer',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Horizontal Scale',
            builder: _atomix_docs_use_cases_atoms_atomix_spacer_use_case
                .atomixSpacerHorizontalScale,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Playground',
            builder: _atomix_docs_use_cases_atoms_atomix_spacer_use_case
                .atomixSpacerPlayground,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Vertical Scale',
            builder: _atomix_docs_use_cases_atoms_atomix_spacer_use_case
                .atomixSpacerVerticalScale,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixText',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Body Large',
            builder: _atomix_docs_use_cases_atoms_atomix_text_use_case
                .atomixTextBodyLarge,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Body Medium',
            builder: _atomix_docs_use_cases_atoms_atomix_text_use_case
                .atomixTextBodyMedium,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Heading Large',
            builder: _atomix_docs_use_cases_atoms_atomix_text_use_case
                .atomixTextHeadingLarge,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Label Small',
            builder: _atomix_docs_use_cases_atoms_atomix_text_use_case
                .atomixTextLabelSmall,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Playground',
            builder: _atomix_docs_use_cases_atoms_atomix_text_use_case
                .atomixTextPlayground,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'foundation',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'AtomixColors',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Color Palette',
            builder: _atomix_docs_use_cases_foundation_colors_use_case
                .atomixColorsShowcase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixElevation',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Elevation Scale',
            builder: _atomix_docs_use_cases_foundation_elevation_use_case
                .atomixElevationShowcase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixRadius',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Border Radius',
            builder: _atomix_docs_use_cases_foundation_radius_use_case
                .atomixRadiusShowcase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixSpacing',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Spacing Scale',
            builder: _atomix_docs_use_cases_foundation_spacing_use_case
                .atomixSpacingShowcase,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixTheme',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'How to Customize',
            builder: _atomix_docs_use_cases_foundation_customization_use_case
                .customizationGuide,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixTypography',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Typography Scale',
            builder: _atomix_docs_use_cases_foundation_typography_use_case
                .atomixTypographyShowcase,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'layout',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'AtomixBox',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Layout Box',
            builder: _atomix_docs_use_cases_layout_atomix_layout_use_case
                .atomixBoxPlayground,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixGrid',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'README',
            builder: _atomix_docs_use_cases_layout_layout_readme.layoutReadme,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Responsive Grid',
            builder: _atomix_docs_use_cases_layout_atomix_layout_use_case
                .atomixGridPlayground,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'molecules',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'AtomixButton',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Disabled',
            builder: _atomix_docs_use_cases_molecules_atomix_button_use_case
                .atomixButtonDisabled,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Full Width',
            builder: _atomix_docs_use_cases_molecules_atomix_button_use_case
                .atomixButtonFullWidth,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Large',
            builder: _atomix_docs_use_cases_molecules_atomix_button_use_case
                .atomixButtonLarge,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Loading',
            builder: _atomix_docs_use_cases_molecules_atomix_button_use_case
                .atomixButtonLoading,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Playground',
            builder: _atomix_docs_use_cases_molecules_atomix_button_use_case
                .atomixButtonPlayground,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Primary',
            builder: _atomix_docs_use_cases_molecules_atomix_button_use_case
                .atomixButtonPrimary,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Secondary',
            builder: _atomix_docs_use_cases_molecules_atomix_button_use_case
                .atomixButtonSecondary,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Small',
            builder: _atomix_docs_use_cases_molecules_atomix_button_use_case
                .atomixButtonSmall,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Tertiary',
            builder: _atomix_docs_use_cases_molecules_atomix_button_use_case
                .atomixButtonTertiary,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Icon',
            builder: _atomix_docs_use_cases_molecules_atomix_button_use_case
                .atomixButtonWithIcon,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixChip',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _atomix_docs_use_cases_molecules_atomix_chip_use_case
                .atomixChipDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Deletable',
            builder: _atomix_docs_use_cases_molecules_atomix_chip_use_case
                .atomixChipDeletable,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Playground',
            builder: _atomix_docs_use_cases_molecules_atomix_chip_use_case
                .atomixChipPlayground,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Selected',
            builder: _atomix_docs_use_cases_molecules_atomix_chip_use_case
                .atomixChipSelected,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Icon',
            builder: _atomix_docs_use_cases_molecules_atomix_chip_use_case
                .atomixChipWithIcon,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixListTile',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _atomix_docs_use_cases_molecules_atomix_list_tile_use_case
                .atomixListTileDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Disabled',
            builder: _atomix_docs_use_cases_molecules_atomix_list_tile_use_case
                .atomixListTileDisabled,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Playground',
            builder: _atomix_docs_use_cases_molecules_atomix_list_tile_use_case
                .atomixListTilePlayground,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Selected',
            builder: _atomix_docs_use_cases_molecules_atomix_list_tile_use_case
                .atomixListTileSelected,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Subtitle',
            builder: _atomix_docs_use_cases_molecules_atomix_list_tile_use_case
                .atomixListTileWithSubtitle,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixTextField',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _atomix_docs_use_cases_molecules_atomix_text_field_use_case
                .atomixTextFieldDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Disabled',
            builder: _atomix_docs_use_cases_molecules_atomix_text_field_use_case
                .atomixTextFieldDisabled,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Multiline',
            builder: _atomix_docs_use_cases_molecules_atomix_text_field_use_case
                .atomixTextFieldMultiline,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Password',
            builder: _atomix_docs_use_cases_molecules_atomix_text_field_use_case
                .atomixTextFieldPassword,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Playground',
            builder: _atomix_docs_use_cases_molecules_atomix_text_field_use_case
                .atomixTextFieldPlayground,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Error',
            builder: _atomix_docs_use_cases_molecules_atomix_text_field_use_case
                .atomixTextFieldWithError,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Helper Text',
            builder: _atomix_docs_use_cases_molecules_atomix_text_field_use_case
                .atomixTextFieldWithHelper,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Prefix Icon',
            builder: _atomix_docs_use_cases_molecules_atomix_text_field_use_case
                .atomixTextFieldWithPrefixIcon,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'organisms',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'AtomixAppBar',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Centered Title',
            builder: _atomix_docs_use_cases_organisms_atomix_app_bar_use_case
                .atomixAppBarCentered,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _atomix_docs_use_cases_organisms_atomix_app_bar_use_case
                .atomixAppBarDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Playground',
            builder: _atomix_docs_use_cases_organisms_atomix_app_bar_use_case
                .atomixAppBarPlayground,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Actions',
            builder: _atomix_docs_use_cases_organisms_atomix_app_bar_use_case
                .atomixAppBarWithActions,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Leading Icon',
            builder: _atomix_docs_use_cases_organisms_atomix_app_bar_use_case
                .atomixAppBarWithLeading,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixBottomSheet',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder:
                _atomix_docs_use_cases_organisms_atomix_bottom_sheet_use_case
                    .atomixBottomSheetDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Playground',
            builder:
                _atomix_docs_use_cases_organisms_atomix_bottom_sheet_use_case
                    .atomixBottomSheetPlayground,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Action',
            builder:
                _atomix_docs_use_cases_organisms_atomix_bottom_sheet_use_case
                    .atomixBottomSheetWithAction,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Without Handle',
            builder:
                _atomix_docs_use_cases_organisms_atomix_bottom_sheet_use_case
                    .atomixBottomSheetNoHandle,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixCard',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Elevated',
            builder: _atomix_docs_use_cases_organisms_atomix_card_use_case
                .atomixCardElevated,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Filled',
            builder: _atomix_docs_use_cases_organisms_atomix_card_use_case
                .atomixCardFilled,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Outlined',
            builder: _atomix_docs_use_cases_organisms_atomix_card_use_case
                .atomixCardOutlined,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Playground',
            builder: _atomix_docs_use_cases_organisms_atomix_card_use_case
                .atomixCardPlayground,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Tappable',
            builder: _atomix_docs_use_cases_organisms_atomix_card_use_case
                .atomixCardTappable,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'AtomixDialog',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _atomix_docs_use_cases_organisms_atomix_dialog_use_case
                .atomixDialogDefault,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Playground',
            builder: _atomix_docs_use_cases_organisms_atomix_dialog_use_case
                .atomixDialogPlayground,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Simple Dialog',
            builder: _atomix_docs_use_cases_organisms_atomix_dialog_use_case
                .atomixDialogSimple,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'With Icon',
            builder: _atomix_docs_use_cases_organisms_atomix_dialog_use_case
                .atomixDialogWithIcon,
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'use_cases',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'templates',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'AtomixTemplates',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Full Page Playground',
                builder:
                    _atomix_docs_use_cases_templates_playground_template_use_case
                        .playgroundTemplate,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'README',
                builder: _atomix_docs_use_cases_templates_templates_readme
                    .templatesReadme,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
