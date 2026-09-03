import 'package:flutter/material.dart';

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
    
  })
}
