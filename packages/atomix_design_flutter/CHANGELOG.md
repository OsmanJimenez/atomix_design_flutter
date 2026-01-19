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
