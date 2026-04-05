#!/usr/bin/env bash
set -euo pipefail

cat > lib/l10n/app_en.arb <<'EOF'
{
  "@@locale": "en",
  "appTitle": "Clean Track",
  "welcomeTitle": "Clean Track",
  "welcomeSubtitle": "Track your progress calmly and return to yourself without extra noise.",
  "addHabitSceneTitle": "New habit",
  "addHabitSceneSubtitle": "Add a new habit and begin a new path at your own pace.",
  "addHabitSceneHint": "Swipe back to return to your habits.",
  "emptyStateTitle": "First habit",
  "emptyStateSubtitle": "Start with one habit and simply watch your progress.",
  "habitPickerTitle": "Add habit",
  "habitPickerSubtitle": "Choose where you'd like to begin. You can pick a ready-made option or create your own.",
  "habitPickerAllUsedSubtitle": "All ready-made habits have already been added. You can create your own.",
  "customHabitTitle": "Custom habit",
  "customHabitSubtitle": "Create your own option manually",
  "formEditTitle": "Edit habit",
  "formCreateTitle": "New habit",
  "formSubtitle": "Set the beginning in the way that feels right for you.",
  "formActionSave": "Save changes",
  "formActionStart": "Start tracking",
  "formCustomHabitBlockTitle": "Your habit",
  "formHabitNameLabel": "Habit name",
  "formHabitNameHint": "For example: Alcohol",
  "formHabitNameValidation": "Enter a habit name",
  "formEmojiLabel": "Emoji",
  "formEmojiHint": "For example: 🚭",
  "formStartPointTitle": "Starting point",
  "formWhyTitle": "Why this matters",
  "formCustomReasonLabel": "Your reason",
  "formCustomReasonHint": "Why do you want to begin right now?",
  "detailsStartDateTitle": "Start date",
  "detailsReasonTitle": "Reason",
  "detailsReasonEmpty": "No reason specified",
  "detailsResetAction": "Start over",
  "detailsDeleteAction": "Delete habit",
  "detailsResetDialogTitle": "Start over?",
  "detailsResetDialogBody": "Your current progress will begin again from this moment.",
  "detailsDeleteDialogTitle": "Delete habit?",
  "detailsDeleteDialogBody": "This action cannot be undone.",
  "commonCancel": "Cancel",
  "commonDelete": "Delete"
}
EOF

cat > lib/l10n/app_ru.arb <<'EOF'
{
  "@@locale": "ru",
  "appTitle": "Clean Track",
  "welcomeTitle": "Clean Track",
  "welcomeSubtitle": "Спокойно наблюдай за своим прогрессом и возвращайся к себе без лишнего шума.",
  "addHabitSceneTitle": "Новая привычка",
  "addHabitSceneSubtitle": "Добавь новую привычку и начни новый путь в своём ритме.",
  "addHabitSceneHint": "Свайпни назад, чтобы вернуться к своим привычкам.",
  "emptyStateTitle": "Первая привычка",
  "emptyStateSubtitle": "Начни с одной привычки и просто наблюдай за своим прогрессом.",
  "habitPickerTitle": "Добавить привычку",
  "habitPickerSubtitle": "Выбери, с чего хочешь начать. Можно взять готовый вариант или создать свой.",
  "habitPickerAllUsedSubtitle": "Все готовые привычки уже выбраны. Можно создать свой вариант.",
  "customHabitTitle": "Своя привычка",
  "customHabitSubtitle": "Создай свой вариант вручную",
  "formEditTitle": "Изменить привычку",
  "formCreateTitle": "Новая привычка",
  "formSubtitle": "Настрой начало так, как тебе удобно.",
  "formActionSave": "Сохранить изменения",
  "formActionStart": "Начать отсчёт",
  "formCustomHabitBlockTitle": "Твоя привычка",
  "formHabitNameLabel": "Название привычки",
  "formHabitNameHint": "Например: Алкоголь",
  "formHabitNameValidation": "Укажи название привычки",
  "formEmojiLabel": "Эмодзи",
  "formEmojiHint": "Например: 🚭",
  "formStartPointTitle": "Точка отсчёта",
  "formWhyTitle": "Почему это важно",
  "formCustomReasonLabel": "Своя причина",
  "formCustomReasonHint": "Почему тебе хочется начать именно сейчас?",
  "detailsStartDateTitle": "Дата начала",
  "detailsReasonTitle": "Причина",
  "detailsReasonEmpty": "Причина не указана",
  "detailsResetAction": "Начать заново",
  "detailsDeleteAction": "Удалить привычку",
  "detailsResetDialogTitle": "Начать заново?",
  "detailsResetDialogBody": "Текущий прогресс начнётся заново с текущего момента.",
  "detailsDeleteDialogTitle": "Удалить привычку?",
  "detailsDeleteDialogBody": "Это действие нельзя отменить.",
  "commonCancel": "Отмена",
  "commonDelete": "Удалить"
}
EOF

cat > lib/features/counters/presentation/screen/counter_details_screen.dart <<'EOF'
import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n.dart';
import '../../data/habit_presets.dart';
import '../../models/counter_item.dart';
import '../../utils/date_formatters.dart';
import 'counter_form_screen.dart';

class CounterDetailsScreen extends StatefulWidget {
  final CounterItem counter;
  final ValueChanged<CounterItem> onSave;
  final ValueChanged<String> onDelete;
  final ValueChanged<String> onReset;

  const CounterDetailsScreen({
    super.key,
    required this.counter,
    required this.onSave,
    required this.onDelete,
    required this.onReset,
  });

  @override
  State<CounterDetailsScreen> createState() => _CounterDetailsScreenState();
}

class _CounterDetailsScreenState extends State<CounterDetailsScreen> {
  late CounterItem _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.counter;
  }

  Future<void> _editCounter() async {
    final matchedPreset =
        findHabitPresetByKey(_counter.presetKey) ?? habitPresets.last;

    final result = await Navigator.of(context).push<CounterItem>(
      MaterialPageRoute(
        builder: (_) => CounterFormScreen(
          existing: _counter,
          preset: matchedPreset,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _counter = result;
      });
      widget.onSave(result);
    }
  }

  Future<void> _confirmReset() async {
    final l10n = context.l10n;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(l10n.detailsResetDialogTitle),
        content: Text(l10n.detailsResetDialogBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.detailsResetAction),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      widget.onReset(_counter.id);
      setState(() {
        _counter = _counter.copyWith(startAt: DateTime.now());
      });
    }
  }

  Future<void> _confirmDelete() async {
    final l10n = context.l10n;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(l10n.detailsDeleteDialogTitle),
        content: Text(l10n.detailsDeleteDialogBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.commonCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.commonDelete),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      widget.onDelete(_counter.id);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final elapsed = formatElapsed(_counter.startAt);

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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back_ios_new),
                        color: const Color(0xFF4E5C56),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: _editCounter,
                        icon: const Icon(Icons.edit_outlined),
                        color: const Color(0xFF4E5C56),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    _counter.emoji,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 74),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    _counter.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF22312B),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    elapsed,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 42,
                      height: 1.1,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF24A770),
                    ),
                  ),
                  const SizedBox(height: 22),
                  _InfoBlock(
                    title: l10n.detailsStartDateTitle,
                    value: formatDateTime(_counter.startAt),
                  ),
                  const SizedBox(height: 14),
                  _InfoBlock(
                    title: l10n.detailsReasonTitle,
                    value: _counter.reason.isEmpty
                        ? l10n.detailsReasonEmpty
                        : _counter.reason,
                  ),
                  const Spacer(),
                  FilledButton(
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      backgroundColor: const Color(0xFF24A770),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                    ),
                    onPressed: _confirmReset,
                    child: Text(
                      l10n.detailsResetAction,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: _confirmDelete,
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      l10n.detailsDeleteAction,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9A5A5A),
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
}

class _InfoBlock extends StatelessWidget {
  final String title;
  final String value;

  const _InfoBlock({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white.withValues(alpha: 0.22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xFF748379),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              height: 1.4,
              fontWeight: FontWeight.w600,
              color: Color(0xFF22312B),
            ),
          ),
        ],
      ),
    );
  }
}
EOF
