import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixPagination extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final ValueChanged<int> onPageChanged;
  final int visiblePageCount;

  const AtomixPagination({
    super.key,
    required this.totalPages,
    required this.currentPage,
    required this.onPageChanged,
    this.visiblePageCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: currentPage > 1
              ? () => onPageChanged(currentPage - 1)
              : null,
          icon: Icon(
            Icons.chevron_left,
            color: currentPage > 1
                ? theme.colors.primary
                : theme.colors.textDisabled,
          ),
        ),
        ..._buildPageNumbers(theme),
        IconButton(
          onPressed: currentPage < totalPages
              ? () => onPageChanged(currentPage + 1)
              : null,
          icon: Icon(
            Icons.chevron_right,
            color: currentPage < totalPages
                ? theme.colors.primary
                : theme.colors.textDisabled,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildPageNumbers(AtomixThemeData theme) {
    final List<Widget> items = [];
    final int startPage = (currentPage - visiblePageCount ~/ 2)
        .clamp(1, totalPages - visiblePageCount + 1)
        .clamp(1, totalPages);
    final int endPage = (startPage + visiblePageCount - 1).clamp(1, totalPages);

    if (startPage > 1) {
      items.add(_buildPageItem(theme, 1));
      if (startPage > 2) {
        items.add(const Text('...'));
      }
    }

    for (int i = startPage; i <= endPage; i++) {
      items.add(_buildPageItem(theme, i));
    }

    if (endPage < totalPages) {
      if (endPage < totalPages - 1) {
        items.add(const Text('...'));
      }
      items.add(_buildPageItem(theme, totalPages));
    }

    return items;
  }

  Widget _buildPageItem(AtomixThemeData theme, int page) {
    final isSelected = page == currentPage;
    return InkWell(
      onTap: () => onPageChanged(page),
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: isSelected
            ? BoxDecoration(
                color: theme.colors.primary,
                borderRadius: BorderRadius.circular(4),
              )
            : null,
        child: Text(
          '$page',
          style: theme.typography.bodyMedium.copyWith(
            color: isSelected
                ? theme.colors.onPrimary
                : theme.colors.textPrimary,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
