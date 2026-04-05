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
  "commonDelete": "Delete",
  "presetAlcoholTitle": "Alcohol",
  "presetSmokingTitle": "Smoking",
  "presetSugarTitle": "Sugar",
  "presetCoffeeTitle": "Coffee",
  "presetPornTitle": "Porn",
  "presetSocialTitle": "Social media",
  "presetGamesTitle": "Games",
  "presetCustomTitle": "Custom habit",
  "presetAlcoholReason1": "I want to feel better",
  "presetAlcoholReason2": "I want to sleep better",
  "presetAlcoholReason3": "I want to feel more collected",
  "presetAlcoholReason4": "I want more control over my life",
  "presetSmokingReason1": "I want to improve my health",
  "presetSmokingReason2": "I want to breathe more easily",
  "presetSmokingReason3": "I want to spend less money",
  "presetSmokingReason4": "I want to feel more free",
  "presetSugarReason1": "I want fewer energy crashes",
  "presetSugarReason2": "I want steadier well-being",
  "presetSugarReason3": "I want to eat better",
  "presetSugarReason4": "I want to lose weight",
  "presetCoffeeReason1": "I want to sleep better",
  "presetCoffeeReason2": "I want less anxiety",
  "presetCoffeeReason3": "I want to rely less on stimulants",
  "presetCoffeeReason4": "I want stable energy without caffeine",
  "presetPornReason1": "I want more self-control",
  "presetPornReason2": "I want more energy",
  "presetPornReason3": "I want to improve focus",
  "presetPornReason4": "I want to regain mental clarity",
  "presetSocialReason1": "I want fewer distractions",
  "presetSocialReason2": "I want to regain focus",
  "presetSocialReason3": "I want to depend less on my phone",
  "presetSocialReason4": "I want to free up time",
  "presetGamesReason1": "I want to regain control over my time",
  "presetGamesReason2": "I want to do more useful things",
  "presetGamesReason3": "I want to procrastinate less",
  "presetGamesReason4": "I want to focus better",
  "presetCustomReason1": "I want to improve my health",
  "presetCustomReason2": "I want more energy",
  "presetCustomReason3": "I want more control over myself",
  "presetCustomReason4": "I want to change my life for the better",
  "timeUnitSecondsShort": "sec",
  "timeUnitMinutesShort": "min",
  "timeUnitHoursShort": "h",
  "timeUnitDaysShort": "d"
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
  "commonDelete": "Удалить",
  "presetAlcoholTitle": "Алкоголь",
  "presetSmokingTitle": "Сигареты",
  "presetSugarTitle": "Сахар",
  "presetCoffeeTitle": "Кофе",
  "presetPornTitle": "Порно",
  "presetSocialTitle": "Соцсети",
  "presetGamesTitle": "Игры",
  "presetCustomTitle": "Своя привычка",
  "presetAlcoholReason1": "Хочу лучше себя чувствовать",
  "presetAlcoholReason2": "Хочу лучше спать",
  "presetAlcoholReason3": "Хочу быть собраннее",
  "presetAlcoholReason4": "Хочу больше контролировать свою жизнь",
  "presetSmokingReason1": "Хочу улучшить здоровье",
  "presetSmokingReason2": "Хочу легче дышать",
  "presetSmokingReason3": "Хочу меньше тратить денег",
  "presetSmokingReason4": "Хочу чувствовать себя свободнее",
  "presetSugarReason1": "Хочу меньше скачков энергии",
  "presetSugarReason2": "Хочу стабильное самочувствие",
  "presetSugarReason3": "Хочу лучше питаться",
  "presetSugarReason4": "Хочу похудеть",
  "presetCoffeeReason1": "Хочу лучше спать",
  "presetCoffeeReason2": "Хочу убрать тревожность",
  "presetCoffeeReason3": "Хочу меньше зависеть от стимуляторов",
  "presetCoffeeReason4": "Хочу стабильную энергию без кофеина",
  "presetPornReason1": "Хочу больше самоконтроля",
  "presetPornReason2": "Хочу больше энергии",
  "presetPornReason3": "Хочу улучшить концентрацию",
  "presetPornReason4": "Хочу вернуть ясность мышления",
  "presetSocialReason1": "Хочу меньше отвлекаться",
  "presetSocialReason2": "Хочу вернуть концентрацию",
  "presetSocialReason3": "Хочу меньше зависеть от телефона",
  "presetSocialReason4": "Хочу освободить время",
  "presetGamesReason1": "Хочу вернуть контроль над временем",
  "presetGamesReason2": "Хочу делать больше полезного",
  "presetGamesReason3": "Хочу меньше прокрастинировать",
  "presetGamesReason4": "Хочу лучше концентрироваться",
  "presetCustomReason1": "Хочу улучшить здоровье",
  "presetCustomReason2": "Хочу больше энергии",
  "presetCustomReason3": "Хочу больше контроля над собой",
  "presetCustomReason4": "Хочу изменить жизнь к лучшему",
  "timeUnitSecondsShort": "сек",
  "timeUnitMinutesShort": "мин",
  "timeUnitHoursShort": "ч",
  "timeUnitDaysShort": "дн"
}
EOF

cat > lib/features/counters/utils/date_formatters.dart <<'EOF'
import '../../../l10n/app_localizations.dart';

enum CounterTimeDisplayMode {
  seconds,
  mixed,
  days,
}

String formatWithSpaces(int value) {
  final digits = value.toString();
  final buffer = StringBuffer();

  for (int i = 0; i < digits.length; i++) {
    final reverseIndex = digits.length - i;
    buffer.write(digits[i]);

    if (reverseIndex > 1 && reverseIndex % 3 == 1) {
      buffer.write(' ');
    }
  }

  return buffer.toString();
}

String formatElapsed(
  DateTime startAt,
  AppLocalizations l10n, {
  CounterTimeDisplayMode mode = CounterTimeDisplayMode.mixed,
}) {
  final diff = DateTime.now().difference(startAt);

  switch (mode) {
    case CounterTimeDisplayMode.seconds:
      return '${formatWithSpaces(diff.inSeconds)} ${l10n.timeUnitSecondsShort}';

    case CounterTimeDisplayMode.days:
      return '${formatWithSpaces(diff.inDays)} ${l10n.timeUnitDaysShort}';

    case CounterTimeDisplayMode.mixed:
      if (diff.inDays > 0) {
        final days = diff.inDays;
        final hours = diff.inHours % 24;
        return '${formatWithSpaces(days)} ${l10n.timeUnitDaysShort} $hours ${l10n.timeUnitHoursShort}';
      }

      if (diff.inHours > 0) {
        final hours = diff.inHours;
        final minutes = diff.inMinutes % 60;
        return '${formatWithSpaces(hours)} ${l10n.timeUnitHoursShort} $minutes ${l10n.timeUnitMinutesShort}';
      }

      if (diff.inMinutes > 0) {
        return '${formatWithSpaces(diff.inMinutes)} ${l10n.timeUnitMinutesShort} ${diff.inSeconds % 60} ${l10n.timeUnitSecondsShort}';
      }

      return '${formatWithSpaces(diff.inSeconds)} ${l10n.timeUnitSecondsShort}';
  }
}

String formatDateTime(DateTime dateTime) {
  String two(int value) => value.toString().padLeft(2, '0');

  final day = two(dateTime.day);
  final month = two(dateTime.month);
  final year = dateTime.year;
  final hour = two(dateTime.hour);
  final minute = two(dateTime.minute);

  return '$day.$month.$year $hour:$minute';
}
EOF

cat > lib/features/counters/presentation/widgets/counter_card.dart <<'EOF'
import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n.dart';
import '../../models/counter_item.dart';
import '../../utils/date_formatters.dart';

enum CounterCardDisplayMode {
  seconds,
  startDate,
  hoursMinutes,
  days,
}

class CounterCard extends StatefulWidget {
  final CounterItem item;
  final VoidCallback onTap;

  const CounterCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  State<CounterCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  late Timer _timer;
  CounterCardDisplayMode _displayMode = CounterCardDisplayMode.seconds;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted && _displayMode != CounterCardDisplayMode.startDate) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _switchDisplayMode() {
    setState(() {
      switch (_displayMode) {
        case CounterCardDisplayMode.seconds:
          _displayMode = CounterCardDisplayMode.startDate;
          break;
        case CounterCardDisplayMode.startDate:
          _displayMode = CounterCardDisplayMode.hoursMinutes;
          break;
        case CounterCardDisplayMode.hoursMinutes:
          _displayMode = CounterCardDisplayMode.days;
          break;
        case CounterCardDisplayMode.days:
          _displayMode = CounterCardDisplayMode.seconds;
          break;
      }
    });
  }

  String _buildDisplayValue() {
    final l10n = context.l10n;

    switch (_displayMode) {
      case CounterCardDisplayMode.seconds:
        return formatElapsed(
          widget.item.startAt,
          l10n,
          mode: CounterTimeDisplayMode.seconds,
        );

      case CounterCardDisplayMode.startDate:
        final startAt = widget.item.startAt;
        final day = startAt.day.toString().padLeft(2, '0');
        final month = startAt.month.toString().padLeft(2, '0');
        final year = startAt.year;
        return '$day.$month.$year';

      case CounterCardDisplayMode.hoursMinutes:
        final diff = DateTime.now().difference(widget.item.startAt);
        final hours = diff.inHours;
        final minutes = diff.inMinutes % 60;
        return '${formatWithSpaces(hours)} ${l10n.timeUnitHoursShort} $minutes ${l10n.timeUnitMinutesShort}';

      case CounterCardDisplayMode.days:
        final diff = DateTime.now().difference(widget.item.startAt);
        return '${formatWithSpaces(diff.inDays)} ${l10n.timeUnitDaysShort}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayValue = _buildDisplayValue();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        color: Colors.white.withValues(alpha: 0.18),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(34),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 20, 28, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: widget.onTap,
                    icon: const Icon(Icons.more_horiz),
                    color: const Color(0xFF4E5C56),
                  ),
                ),
                const Spacer(),
                Text(
                  widget.item.emoji,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 76),
                ),
                const SizedBox(height: 24),
                Text(
                  widget.item.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF213029),
                  ),
                ),
                const SizedBox(height: 26),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: _switchDisplayMode,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      displayValue,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 40,
                        height: 1.1,
                        color: Color(0xFF24A770),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                if (widget.item.reason.isNotEmpty)
                  Text(
                    widget.item.reason,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF5E6D65),
                      fontSize: 16,
                      height: 1.45,
                    ),
                  ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
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
    final l10n = context.l10n;
    final matchedPreset =
        findHabitPresetByKey(_counter.presetKey, l10n) ?? customHabitPreset(l10n);

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
    final localizedCounter = localizeCounterItem(_counter, l10n);
    final elapsed = formatElapsed(localizedCounter.startAt, l10n);

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
                    localizedCounter.emoji,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 74),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    localizedCounter.title,
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
                    value: formatDateTime(localizedCounter.startAt),
                  ),
                  const SizedBox(height: 14),
                  _InfoBlock(
                    title: l10n.detailsReasonTitle,
                    value: localizedCounter.reason.isEmpty
                        ? l10n.detailsReasonEmpty
                        : localizedCounter.reason,
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
