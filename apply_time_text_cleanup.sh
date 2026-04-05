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
  "presetCustomReason4": "I want to change my life for the better"
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
  "presetCustomReason4": "Хочу изменить жизнь к лучшему"
}
EOF

cat > lib/features/counters/data/habit_presets.dart <<'EOF'
import '../../../../l10n/app_localizations.dart';
import '../models/habit_preset.dart';

List<HabitPreset> buildHabitPresets(AppLocalizations l10n) {
  return [
    HabitPreset(
      keyName: 'alcohol',
      title: l10n.presetAlcoholTitle,
      emoji: '🍷',
      reasons: [
        l10n.presetAlcoholReason1,
        l10n.presetAlcoholReason2,
        l10n.presetAlcoholReason3,
        l10n.presetAlcoholReason4,
      ],
    ),
    HabitPreset(
      keyName: 'smoking',
      title: l10n.presetSmokingTitle,
      emoji: '🚭',
      reasons: [
        l10n.presetSmokingReason1,
        l10n.presetSmokingReason2,
        l10n.presetSmokingReason3,
        l10n.presetSmokingReason4,
      ],
    ),
    HabitPreset(
      keyName: 'sugar',
      title: l10n.presetSugarTitle,
      emoji: '🍰',
      reasons: [
        l10n.presetSugarReason1,
        l10n.presetSugarReason2,
        l10n.presetSugarReason3,
        l10n.presetSugarReason4,
      ],
    ),
    HabitPreset(
      keyName: 'coffee',
      title: l10n.presetCoffeeTitle,
      emoji: '☕',
      reasons: [
        l10n.presetCoffeeReason1,
        l10n.presetCoffeeReason2,
        l10n.presetCoffeeReason3,
        l10n.presetCoffeeReason4,
      ],
    ),
    HabitPreset(
      keyName: 'porn',
      title: l10n.presetPornTitle,
      emoji: '🔞',
      reasons: [
        l10n.presetPornReason1,
        l10n.presetPornReason2,
        l10n.presetPornReason3,
        l10n.presetPornReason4,
      ],
    ),
    HabitPreset(
      keyName: 'social',
      title: l10n.presetSocialTitle,
      emoji: '📱',
      reasons: [
        l10n.presetSocialReason1,
        l10n.presetSocialReason2,
        l10n.presetSocialReason3,
        l10n.presetSocialReason4,
      ],
    ),
    HabitPreset(
      keyName: 'games',
      title: l10n.presetGamesTitle,
      emoji: '🎮',
      reasons: [
        l10n.presetGamesReason1,
        l10n.presetGamesReason2,
        l10n.presetGamesReason3,
        l10n.presetGamesReason4,
      ],
    ),
    HabitPreset(
      keyName: 'custom',
      title: l10n.presetCustomTitle,
      emoji: '💪',
      reasons: [
        l10n.presetCustomReason1,
        l10n.presetCustomReason2,
        l10n.presetCustomReason3,
        l10n.presetCustomReason4,
      ],
      isCustom: true,
    ),
  ];
}

HabitPreset? findHabitPresetByKey(
  String? key,
  AppLocalizations l10n,
) {
  if (key == null) return null;

  for (final preset in buildHabitPresets(l10n)) {
    if (preset.keyName == key) return preset;
  }
  return null;
}

HabitPreset customHabitPreset(AppLocalizations l10n) {
  return buildHabitPresets(l10n).firstWhere((preset) => preset.isCustom);
}
EOF

cat > lib/features/counters/presentation/screen/habit_preset_picker_screen.dart <<'EOF'
import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n.dart';
import '../../data/habit_presets.dart';
import '../../models/habit_preset.dart';

class HabitPresetPickerScreen extends StatelessWidget {
  final Set<String> excludedPresetKeys;

  const HabitPresetPickerScreen({
    super.key,
    this.excludedPresetKeys = const {},
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final allPresets = buildHabitPresets(l10n);

    final regularPresets = allPresets
        .where((preset) => !preset.isCustom)
        .where((preset) => !excludedPresetKeys.contains(preset.keyName))
        .toList();

    final customPreset = allPresets.firstWhere((preset) => preset.isCustom);
    final hasRegularPresets = regularPresets.isNotEmpty;

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
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: const Color(0xFF4E5C56),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.habitPickerTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF22312B),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    hasRegularPresets
                        ? l10n.habitPickerSubtitle
                        : l10n.habitPickerAllUsedSubtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.45,
                      color: Color(0xFF607066),
                    ),
                  ),
                  const SizedBox(height: 28),
                  if (hasRegularPresets)
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: regularPresets.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 14),
                        itemBuilder: (context, index) {
                          final preset = regularPresets[index];
                          return _HabitPresetTile(
                            preset: preset,
                            onTap: () =>
                                Navigator.of(context).pop<HabitPreset>(preset),
                          );
                        },
                      ),
                    )
                  else
                    const Spacer(),
                  const SizedBox(height: 18),
                  _CustomHabitTile(
                    preset: customPreset,
                    title: l10n.customHabitTitle,
                    subtitle: l10n.customHabitSubtitle,
                    onTap: () => Navigator.of(context).pop<HabitPreset>(customPreset),
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

class _HabitPresetTile extends StatelessWidget {
  final HabitPreset preset;
  final VoidCallback onTap;

  const _HabitPresetTile({
    required this.preset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white.withValues(alpha: 0.20),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            child: Row(
              children: [
                Text(
                  preset.emoji,
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    preset.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
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
      ),
    );
  }
}

class _CustomHabitTile extends StatelessWidget {
  final HabitPreset preset;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _CustomHabitTile({
    required this.preset,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white.withValues(alpha: 0.76),
        border: Border.all(
          color: const Color(0xFFE6ECE6),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            child: Row(
              children: [
                Text(
                  preset.emoji,
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF22312B),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.35,
                          color: Color(0xFF607066),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.add_circle_outline,
                  color: Color(0xFF24A770),
                ),
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
