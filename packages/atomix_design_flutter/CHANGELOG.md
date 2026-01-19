## 0.5.0 - 2026-01-19

### Added
- **Atoms Gallery**: Introduced a visual landing page for the "Atoms" category to provide a high-level overview.
- **Atoms README**: Added conceptual documentation for the atomic level of the design system.

### Changed
- **Widgetbook Standardization**: Unified the navigation structure. All components now use an explicit `path: '[Category]/ComponentName'` format.
- **Improved UX**: Eliminated implicit lowercase folders in the sidebar for a cleaner, professional tree structure.
- **Layout System**: Renamed Playground scenarios and consolidated `AtomixBox` (Responsive Box) and `AtomixGrid`.

## 0.4.3 - 2026-01-19

### Changed
- **Developer Experience (DX)**: Improved Widgetbook knobs for all atomic components.
  - Replaced technical object strings with clean, semantic labels (e.g., "Primary", "Success", "MD").
  - Centralized knob labeling logic in `KnobHelpers` for consistency.

## 0.4.2 - 2026-01-19

### Added
- **Foundation Integration**: 20+ atomic components now support explicit override of Foundation tokens.
  - Added `backgroundColor`, `textColor`, `borderRadius`, `borderColor`, and `shadow` properties where applicable.
- **Enhanced Documentation**: All Atoms now feature an interactive "Playground" with "Foundation" knobs.
- **Granular Scenarios**: Refactored all atoms to include separate use cases for specific states (Success, Error, Disabled, etc.), each with its own static code snippet.

### Changed
- **Token Transparency**: Code snippets in Widgetbook now show `AtomixColors.primary` instead of hex codes.
- **Modern Builders**: Improved the internal logic of `AtomixShimmer` and `AtomixTooltip` for better reliability.

## 0.4.1 - 2026-01-18

### Changed
- **Documentation Standardization**: All 24 atomic components now follow the "Playground + Specific Scenarios" standard.
- **Improved UX**: Individual use case files for every widget for better navigation in Widgetbook.
- **Code Snippets**: Updated all documentation scenarios with accurate, copy-pasteable code snippets.

## 0.4.0 - 2026-01-18

### Added
- **Atoms Library Expansion**: Added 20+ new atomic components.
    - **Forms**: `AtomixCheckbox`, `AtomixRadio`, `AtomixSwitch`, `AtomixLabel`.
    - **Visual & Status**: `AtomixAvatar`, `AtomixTag`, `AtomixDot`, `AtomixProgressCircular`, `AtomixProgressLinear`.
    - **Data & Text**: `AtomixPriceText`, `AtomixLink`, `AtomixCounter`, `AtomixRating`.
    - **Loading & Structure**: `AtomixSkeleton`, `AtomixShimmer`, `AtomixTooltip`, `AtomixThumbnail`.
    - **Navigation & Misc**: `AtomixBreadcrumbItem`, `AtomixTabIndicator`.
- **Documentation**: 
    - Full interactive playgrounds for all new Atoms.
    - Unified Foundation documentation structure.

## 0.3.0 - 2026-01-18

### Added
- **Foundation Expansion**:
    - `AtomixAnimations`: Standardized durations and curves for consistent motion.
    - `AtomixBreakpoints`: Essential screen widths for responsive design.
    - `AtomixShadows`: Advanced multi-layered shadows for enhanced depth.
- **Documentation**:
    - Added visual showcases for Animations, Breakpoints, and Shadows in Widgetbook.

## 0.2.0 - 2026-01-18

### Added
- **Layout System**: Introduced `AtomixBox` and `AtomixGrid` for powerful structural layouts.
- **Templates**: Added interactive page-builder templates in Widgetbook.
- **Interactive Documentation**: Completely revamped all components with Knobs for real-time property editing.

### Changed
- **Modernized API**: Replaced all instances of `Color.withOpacity()` with the new `Color.withValues(alpha: ...)`.
- **Improved Widgetbook UX**: Knobs are now logically grouped (e.g., `Component > Property`).
- **Standardized Knobs**: Migrated from `context.knobs.list` to `context.knobs.object.dropdown` for better type safety and UI.
- **Code Generation**: All playgrounds now include dynamic, copy-pasteable code snippets.

### Fixed
- Resolved all `deprecated_member_use` warnings across the package and documentation.
- Fixed `unnecessary_library_name` lint in main package.
- Corrected `curly_braces_in_flow_control_structures` across the documentation app.
- Fixed Widgetbook configuration for `ViewportAddon` and `TextScaleAddon` compatibility.

## 0.1.1 - 2026-01-18

### Changed
- Shortened package description to meet pub.dev requirements
- Updated README with GitHub Pages documentation link

### Added
- Example app demonstrating all components
- Interactive Widgetbook documentation at https://osmanjimenez.github.io/atomix_design_flutter/

### Fixed
- Improved pub.dev score by adding required example

## 0.1.0 - 2026-01-18

### Added

#### Foundation
- Design token system with `AtomixColors`, `AtomixSpacing`, `AtomixRadius`, `AtomixElevation`, and `AtomixTypography`
- Light and dark theme support with `AtomixTheme`
- Material Design 3 integration
- Comprehensive color palette with semantic colors
- 4px-based spacing scale
- Border radius values with convenient shortcuts
- Material elevation scale
- Complete text style system

#### Atoms
- `AtomixText` - Text component with typography system
- `AtomixIcon` - Icon component with consistent styling
- `AtomixDivider` - Visual separator component
- `AtomixSpacer` - Spacing helper with token shortcuts
- `AtomixBadge` - Status badges with 5 variants (neutral, success, warning, error, info)

#### Molecules
- `AtomixButton` - Button component with 3 variants (primary, secondary, tertiary), 3 sizes, and multiple states
- `AtomixTextField` - Text input component with validation support, icons, and helper text
- `AtomixChip` - Chip component with selection states and optional icons
- `AtomixListTile` - List item component with leading/trailing elements

#### Organisms
- `AtomixAppBar` - Application bar with customizable title, leading icon, and actions
- `AtomixCard` - Card component with 3 variants (filled, outlined, elevated)
- `AtomixDialog` - Modal dialog component with title, content, and actions
- `AtomixBottomSheet` - Bottom sheet component with drag handle and flexible content

#### Documentation & Testing
- Complete DartDoc documentation for all public APIs
- Comprehensive test coverage for core components
- Example implementations for all components

### Features
- Atomic Design architecture for scalability
- Consistent design language across all components
- Full accessibility support through Material Design 3
- Type-safe component APIs
- Customizable theming system
