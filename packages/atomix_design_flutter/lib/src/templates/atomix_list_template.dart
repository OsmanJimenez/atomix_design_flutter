import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

/// List/Feed template with optional filters and search
class AtomixListTemplate extends StatelessWidget {
  final String? title;
  final Widget? appBar;
  final Widget? searchBar;
  final Widget? filterBar;
  final List<Widget> items;
  final Widget? emptyState;
  final Widget? floatingActionButton;

  const AtomixListTemplate({
    super.key,
    this.title,
    this.appBar,
    this.searchBar,
    this.filterBar,
    required this.items,
    this.emptyState,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBar as PreferredSizeWidget? ??
          (title != null ? AtomixAppBar(title: title!) : null),
      floatingActionButton: floatingActionButton,
      body: Column(
        children: [
          if (searchBar != null)
            Padding(padding: const EdgeInsets.all(16), child: searchBar!),
          if (filterBar != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: filterBar!,
            ),
          Expanded(
            child: items.isEmpty && emptyState != null
                ? Center(child: emptyState!)
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemBuilder: (context, index) => items[index],
                  ),
          ),
        ],
      ),
    );
  }
}
