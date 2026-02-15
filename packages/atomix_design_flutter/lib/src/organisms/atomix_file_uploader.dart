import 'package:flutter/material.dart';
import '../../atomix_design_flutter.dart';

class AtomixFileUploader extends StatefulWidget {
  final ValueChanged<List<String>>? onFilesSelected;
  final List<String> acceptedExtensions;
  final int maxFiles;

  const AtomixFileUploader({
    super.key,
    this.onFilesSelected,
    this.acceptedExtensions = const [],
    this.maxFiles = 5,
  });

  @override
  State<AtomixFileUploader> createState() => _AtomixFileUploaderState();
}

class _AtomixFileUploaderState extends State<AtomixFileUploader> {
  final List<String> _files = [];

  void _addFile() {
    // In a real implementation, this would open a file picker
    setState(() {
      _files.add('file_${_files.length + 1}.pdf');
    });
    widget.onFilesSelected?.call(_files);
  }

  void _removeFile(int index) {
    setState(() {
      _files.removeAt(index);
    });
    widget.onFilesSelected?.call(_files);
  }

  @override
  Widget build(BuildContext context) {
    final theme = AtomixTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colors.border,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.cloud_upload_outlined,
            size: 48,
            color: theme.colors.textSecondary,
          ),
          const SizedBox(height: 16),
          Text(
            'Drag and drop files here',
            style: theme.typography.titleMedium.copyWith(
              color: theme.colors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'or',
            style: theme.typography.bodySmall.copyWith(
              color: theme.colors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          AtomixButton(
            label: 'Browse Files',
            onPressed: _files.length < widget.maxFiles ? _addFile : null,
            variant: AtomixButtonVariant.secondary,
          ),
          if (_files.isNotEmpty) ...[
            const SizedBox(height: 24),
            const AtomixDivider(),
            const SizedBox(height: 16),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _files.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colors.surfaceVariant,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.insert_drive_file,
                        size: 20,
                        color: theme.colors.textSecondary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          _files[index],
                          style: theme.typography.bodyMedium.copyWith(
                            color: theme.colors.textPrimary,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 20),
                        onPressed: () => _removeFile(index),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}
