#!/usr/bin/env bash
set -euo pipefail

mkdir -p lib/features/counters/presentation/widgets/form

cat > lib/features/counters/presentation/widgets/form/section_card.dart <<'EOF'
import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final Widget child;

  const SectionCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white.withValues(alpha: 0.24),
      ),
      child: child,
    );
  }
}
EOF

cat > lib/features/counters/presentation/widgets/form/selected_habit_block.dart <<'EOF'
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
EOF

cat > lib/features/counters/presentation/widgets/form/custom_habit_fields_section.dart <<'EOF'
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
EOF

cat > lib/features/counters/presentation/widgets/form/start_point_section.dart <<'EOF'
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
EOF

cat > lib/features/counters/presentation/widgets/form/reason_section.dart <<'EOF'
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
EOF

cat > lib/features/counters/presentation/screen/counter_form_screen.dart <<'EOF'
import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n.dart';
import '../../models/counter_item.dart';
import '../../models/habit_preset.dart';
import '../widgets/form/custom_habit_fields_section.dart';
import '../widgets/form/reason_section.dart';
import '../widgets/form/selected_habit_block.dart';
import '../widgets/form/start_point_section.dart';

class CounterFormScreen extends StatefulWidget {
  final CounterItem? existing;
  final HabitPreset preset;

  const CounterFormScreen({
    super.key,
    this.existing,
    required this.preset,
  });

  @override
  State<CounterFormScreen> createState() => _CounterFormScreenState();
}

class _CounterFormScreenState extends State<CounterFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _emojiController;
  late final TextEditingController _reasonController;

  late DateTime _startAt;
  String? _selectedReason;

  bool get isEdit => widget.existing != null;
  bool get isCustomPreset => widget.preset.isCustom;

  List<String> get reasons => widget.preset.reasons;

  @override
  void initState() {
    super.initState();
    final existing = widget.existing;

    _titleController = TextEditingController(
      text: existing?.title ?? widget.preset.title,
    );
    _emojiController = TextEditingController(
      text: existing?.emoji ?? widget.preset.emoji,
    );
    _reasonController = TextEditingController(
      text: existing?.reason ?? '',
    );

    _startAt = existing?.startAt ?? DateTime.now();

    if (existing != null &&
        existing.reason.isNotEmpty &&
        reasons.contains(existing.reason)) {
      _selectedReason = existing.reason;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _emojiController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _startAt,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate == null || !mounted) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_startAt),
    );

    if (pickedTime == null) return;

    setState(() {
      _startAt = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    });
  }

  void _selectReason(String reason) {
    setState(() {
      _selectedReason = reason;
      _reasonController.text = reason;
    });
  }

  void _handleReasonChanged(String _) {
    if (_selectedReason != null) {
      setState(() {
        _selectedReason = null;
      });
    }
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final now = DateTime.now();

    final item = CounterItem(
      id: widget.existing?.id ?? now.microsecondsSinceEpoch.toString(),
      title: _titleController.text.trim(),
      emoji: _emojiController.text.trim().isEmpty
          ? '💪'
          : _emojiController.text.trim(),
      startAt: _startAt,
      reason: _reasonController.text.trim(),
      presetKey: widget.preset.keyName,
    );

    Navigator.of(context).pop(item);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final titleText = isEdit ? l10n.formEditTitle : l10n.formCreateTitle;
    final actionText = isEdit ? l10n.formActionSave : l10n.formActionStart;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ocean_bg.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withValues(alpha: 0.10),
                Colors.white.withValues(alpha: 0.16),
                Colors.white.withValues(alpha: 0.12),
              ],
            ),
          ),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back_ios_new),
                        color: const Color(0xFF4E5C56),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    titleText,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF22312B),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.formSubtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.45,
                      color: Color(0xFF607066),
                    ),
                  ),
                  const SizedBox(height: 28),
                  if (!isCustomPreset) ...[
                    SelectedHabitBlock(
                      emoji: widget.preset.emoji,
                      title: widget.preset.title,
                    ),
                    const SizedBox(height: 18),
                  ],
                  if (isCustomPreset) ...[
                    CustomHabitFieldsSection(
                      titleController: _titleController,
                      emojiController: _emojiController,
                      inputDecorationBuilder: _inputDecoration,
                    ),
                    const SizedBox(height: 18),
                  ],
                  StartPointSection(
                    startAt: _startAt,
                    onTap: _pickDateTime,
                  ),
                  const SizedBox(height: 18),
                  ReasonSection(
                    reasons: reasons,
                    selectedReason: _selectedReason,
                    reasonController: _reasonController,
                    onSelectReason: _selectReason,
                    onReasonChanged: _handleReasonChanged,
                    inputDecorationBuilder: _inputDecoration,
                  ),
                  const SizedBox(height: 26),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        backgroundColor: const Color(0xFF24A770),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      onPressed: _save,
                      child: Text(
                        actionText,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.58),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(
          color: Color(0xFF24A770),
          width: 1.4,
        ),
      ),
      labelStyle: const TextStyle(color: Color(0xFF607066)),
      hintStyle: const TextStyle(color: Color(0xFF8A9790)),
    );
  }
}
EOF
