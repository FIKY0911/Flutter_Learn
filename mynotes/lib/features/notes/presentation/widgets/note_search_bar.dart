import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mynotes/core/constants/constants.dart';

class NoteSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;

  const NoteSearchBar({
    super.key,
    this.hintText = 'Search notes...',
    this.onChanged,
  })

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 16, right: 10),
          child: FaIcon(FontAwesomeIcons.magnifyingGlass),
        ),
        isDense: true,
        fillColor: white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: gray100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(color: primary)
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 40,
          minHeight: 18,
        )
      ),
    );
  }
}
