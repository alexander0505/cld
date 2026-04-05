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
