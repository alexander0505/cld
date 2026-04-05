import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import '../../../utils/date_formatters.dart';
import 'section_card.dart';

class StartPointSection extends StatelessWidget {
  final DateTime startAt;
  final VoidCallback onTap;

  const StartPointSection({
    super.key,
    required this.startAt,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.formStartPointTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF22312B),
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            borderRadius: BorderRadius.circular(22),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 18,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white.withValues(alpha: 0.58),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.schedule,
                    color: Color(0xFF24A770),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      formatDateTime(startAt, l10n),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF22312B),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right,
                    color: Color(0xFF748379),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
