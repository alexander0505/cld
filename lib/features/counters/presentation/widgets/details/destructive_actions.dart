import 'package:flutter/material.dart';

class DestructiveActions extends StatelessWidget {
  final String resetTitle;
  final String deleteTitle;
  final VoidCallback onReset;
  final VoidCallback onDelete;

  const DestructiveActions({
    super.key,
    required this.resetTitle,
    required this.deleteTitle,
    required this.onReset,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          style: FilledButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 18),
            backgroundColor: const Color(0xFF24A770),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
          ),
          onPressed: onReset,
          child: Text(
            resetTitle,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: onDelete,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            deleteTitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF9A5A5A),
            ),
          ),
        ),
      ],
    );
  }
}
