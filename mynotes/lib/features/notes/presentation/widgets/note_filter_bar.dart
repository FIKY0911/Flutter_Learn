import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynotes/core/constants/constants.dart';

class NoteFilterBar extends StatelessWidget {
  final String selectedValue;
  final List<String> options;
  final ValueChanged<String> onSelected;
  final VoidCallback? onSortDirectionToggle;
  final VoidCallback? onViewModeToggle;

  const NoteFilterBar({
    super.key,
    required this.selectedValue,
    required this.options,
    required this.onSelected,
    this.onSortDirectionToggle,
    this.onViewModeToggle
  })

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          IconButton(
            onPressed: onSortDirectionToggle, 
            icon: const FaIcon(
              FontAwesomeIcons.arrowDown
            ),
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            constraints: const BoxConstraints(),
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            iconSize: 16,
            color: gray700,
          ),

          const SizedBox(width: 16),

          // Dropdown Sort menggunakan PopupMenuButton (Posisi Menu Stabil di Bawah)
          PopupMenuButton<String>(
            position: PopupMenuPosition.under,
            borderRadius: BorderRadius.circular(16),
            onSelected: onSelected,
            itemBuilder: (context) => options.map((option){
              final isSelected = option == selectedValue;
              return PopupMenuItem<String>(
                value: option,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      option,
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    if(isSelected) ...[
                      const SizedBox(width: 8),
                      const Icon(Icons.check, size: 18),
                    ]
                  ],
                ),
              );
            }).toList(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  selectedValue,
                  style: const TextStyle(
                    color: gray700, 
                    fontSize: 14
                  )
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: FaIcon(
                    FontAwesomeIcons.arrowDownWideShort,
                    size: 7,
                    color: gray700,
                  ),
                )
              ],
            ),
          ),

          const Spacer(),

          // Tombol Grid / List View Toggle
          IconButton(
            onPressed: onViewModeToggle, 
            icon: const FaIcon(FontAwesomeIcons.bars),
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            constraints: const BoxConstraints(),
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            iconSize: 16,
            color: gray700,
          )
        ],
      ),
    );
  }
}
