import 'package:flutter/material.dart';

import 'section_card.dart';

class SelectedHabitBlock extends StatelessWidget {
  final String emoji;
  final String title;

  const SelectedHabitBlock({
    super.key,
    required this.emoji,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Row(
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 34),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xFF22312B),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
