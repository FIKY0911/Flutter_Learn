import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynotes/core/constants/constants.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final List<String> tags;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;

  const NoteCard({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    this.tags = const [],
    this.onDelete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: primary, width: 2),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: primary.withValues(alpha: 0.5),
              offset: const Offset(4, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: gray900,
              ),
            ),
            if (tags.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: tags
                      .map(
                        (tag) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: gray100,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          margin: const EdgeInsets.only(right: 8),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              fontSize: 12,
                              color: gray700,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            Expanded(
              child: Text(
                content,
                style: const TextStyle(color: gray700),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    color: gray500,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                if (onDelete != null)
                  IconButton(
                    onPressed: onDelete,
                    icon: const FaIcon(
                      FontAwesomeIcons.trash,
                      color: gray500,
                      size: 16,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
