import 'package:flutter/material.dart';

import '../../../../../core/l10n/l10n.dart';
import 'section_card.dart';

class ReasonSection extends StatelessWidget {
  final List<String> reasons;
  final String? selectedReason;
  final TextEditingController reasonController;
  final ValueChanged<String> onSelectReason;
  final ValueChanged<String> onReasonChanged;
  final InputDecoration Function({
    required String label,
    required String hint,
  }) inputDecorationBuilder;

  const ReasonSection({
    super.key,
    required this.reasons,
    required this.selectedReason,
    required this.reasonController,
    required this.onSelectReason,
    required this.onReasonChanged,
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
            l10n.formWhyTitle,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF22312B),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: reasons.map((reason) {
              final isSelected = selectedReason == reason;
              return GestureDetector(
                onTap: () => onSelectReason(reason),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: isSelected
                        ? const Color(0xFF24A770).withValues(alpha: 0.18)
                        : Colors.white.withValues(alpha: 0.42),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF24A770)
                          : Colors.transparent,
                    ),
                  ),
                  child: Text(
                    reason,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.35,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: const Color(0xFF22312B),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 18),
          TextFormField(
            controller: reasonController,
            maxLines: 4,
            decoration: inputDecorationBuilder(
              label: l10n.formCustomReasonLabel,
              hint: l10n.formCustomReasonHint,
            ),
            onChanged: onReasonChanged,
          ),
        ],
      ),
    );
  }
}
