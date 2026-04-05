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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 18),
              backgroundColor: Colors.white.withValues(alpha: 0.46),
              foregroundColor: const Color(0xFF1F7E61),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
                side: BorderSide(
                  color: const Color(0xFF24A770).withValues(alpha: 0.22),
                ),
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
        ),
        const SizedBox(height: 14),
        TextButton(
          onPressed: onDelete,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
          ),
          child: Text(
            deleteTitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFFB06B6B),
            ),
          ),
        ),
      ],
    );
  }
}
