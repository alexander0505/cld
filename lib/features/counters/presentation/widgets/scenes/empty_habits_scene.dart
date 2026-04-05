import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';

class EmptyHabitsScene extends StatelessWidget {
  final VoidCallback onTap;

  const EmptyHabitsScene({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 18),
      child: Column(
        children: [
          const Spacer(),
          Text(
            l10n.emptyStateTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color(0xFF22312B),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.emptyStateSubtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1.45,
              color: Color(0xFF607066),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.92),
                border: Border.all(color: const Color(0xFFE6ECE6)),
              ),
              child: const Icon(
                Icons.add,
                size: 44,
                color: Color(0xFF24A770),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
