import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import 'section_card.dart';

class CustomHabitFieldsSection extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController emojiController;
  final InputDecoration Function({
    required String label,
    required String hint,
  }) inputDecorationBuilder;

  const CustomHabitFieldsSection({
    super.key,
    required this.titleController,
    required this.emojiController,
    required this.inputDecorationBuilder,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.formCustomHabitBlockTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF22312B),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: titleController,
            decoration: inputDecorationBuilder(
              label: l10n.formHabitNameLabel,
              hint: l10n.formHabitNameHint,
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return l10n.formHabitNameValidation;
              }
              return null;
            },
          ),
          const SizedBox(height: 14),
          TextFormField(
            controller: emojiController,
            decoration: inputDecorationBuilder(
              label: l10n.formEmojiLabel,
              hint: l10n.formEmojiHint,
            ),
          ),
        ],
      ),
    );
  }
}
