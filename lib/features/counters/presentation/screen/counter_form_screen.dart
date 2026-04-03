
import 'package:flutter/material.dart';

import '../../models/counter_item.dart';
import '../../models/habit_preset.dart';
import '../../utils/date_formatters.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Редактировать' : 'Новый счетчик'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (!isCustomPreset) ...[
              Card(
                child: ListTile(
                  leading: Text(
                    widget.preset.emoji,
                    style: const TextStyle(fontSize: 28),
                  ),
                  title: Text(
                    widget.preset.title,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: const Text('Выбранная привычка'),
                ),
              ),
              const SizedBox(height: 16),
            ],
            TextFormField(
              controller: _titleController,
              enabled: isCustomPreset || isEdit,
              decoration: const InputDecoration(
                labelText: 'Название',
                border: OutlineInputBorder(),
                hintText: 'Например: Алкоголь',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Введите название';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emojiController,
              enabled: isCustomPreset || isEdit,
              decoration: const InputDecoration(
                labelText: 'Emoji',
                border: OutlineInputBorder(),
                hintText: 'Например: 🚭',
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: _pickDateTime,
              borderRadius: BorderRadius.circular(12),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Дата и время старта',
                  border: OutlineInputBorder(),
                ),
                child: Text(formatDateTime(_startAt)),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Причина',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: reasons.map((reason) {
                final isSelected = _selectedReason == reason;
                return ChoiceChip(
                  label: Text(reason),
                  selected: isSelected,
                  onSelected: (_) => _selectReason(reason),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _reasonController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Своя причина',
                border: OutlineInputBorder(),
                hintText: 'Почему ты хочешь отказаться от этой привычки?',
              ),
              onChanged: (_) {
                if (_selectedReason != null) {
                  setState(() {
                    _selectedReason = null;
                  });
                }
              },
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _save,
              child: Text(isEdit ? 'Сохранить изменения' : 'Создать счетчик'),
            ),
          ],
        ),
      ),
    );
  }
}
