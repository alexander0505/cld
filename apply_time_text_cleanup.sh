#!/usr/bin/env bash
set -euo pipefail

cat > lib/features/counters/data/habit_presets.dart <<'EOF'
import '../../../../l10n/app_localizations.dart';
import '../models/counter_item.dart';
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

CounterItem localizeCounterItem(
  CounterItem item,
  AppLocalizations l10n,
) {
  final preset = findHabitPresetByKey(item.presetKey, l10n);

  if (preset == null || preset.isCustom) {
    return item;
  }

  String localizedReason = item.reason;

  final ruPresets = buildHabitPresets(_RuAppLocalizationsProxy());
  final enPresets = buildHabitPresets(_EnAppLocalizationsProxy());

  final ruPreset = ruPresets.where((p) => p.keyName == preset.keyName).firstOrNull;
  final enPreset = enPresets.where((p) => p.keyName == preset.keyName).firstOrNull;

  final knownReasons = <String>{
    ...?ruPreset?.reasons,
    ...?enPreset?.reasons,
  };

  if (knownReasons.contains(item.reason)) {
    final reasonIndex = [
      ...?ruPreset?.reasons,
    ].indexOf(item.reason);

    if (reasonIndex != -1 && reasonIndex < preset.reasons.length) {
      localizedReason = preset.reasons[reasonIndex];
    } else {
      final enReasonIndex = [
        ...?enPreset?.reasons,
      ].indexOf(item.reason);

      if (enReasonIndex != -1 && enReasonIndex < preset.reasons.length) {
        localizedReason = preset.reasons[enReasonIndex];
      }
    }
  }

  return item.copyWith(
    title: preset.title,
    emoji: preset.emoji,
    reason: localizedReason,
  );
}

extension _FirstWhereOrNullExtension<E> on Iterable<E> {
  E? get firstOrNull {
    if (isEmpty) return null;
    return first;
  }
}

class _RuAppLocalizationsProxy implements AppLocalizations {
  @override
  String get appTitle => 'Clean Track';
  @override
  String get welcomeTitle => 'Clean Track';
  @override
  String get welcomeSubtitle => 'Спокойно наблюдай за своим прогрессом и возвращайся к себе без лишнего шума.';
  @override
  String get addHabitSceneTitle => 'Новая привычка';
  @override
  String get addHabitSceneSubtitle => 'Добавь новую привычку и начни новый путь в своём ритме.';
  @override
  String get addHabitSceneHint => 'Свайпни назад, чтобы вернуться к своим привычкам.';
  @override
  String get emptyStateTitle => 'Первая привычка';
  @override
  String get emptyStateSubtitle => 'Начни с одной привычки и просто наблюдай за своим прогрессом.';
  @override
  String get habitPickerTitle => 'Добавить привычку';
  @override
  String get habitPickerSubtitle => 'Выбери, с чего хочешь начать. Можно взять готовый вариант или создать свой.';
  @override
  String get habitPickerAllUsedSubtitle => 'Все готовые привычки уже выбраны. Можно создать свой вариант.';
  @override
  String get customHabitTitle => 'Своя привычка';
  @override
  String get customHabitSubtitle => 'Создай свой вариант вручную';
  @override
  String get formEditTitle => 'Изменить привычку';
  @override
  String get formCreateTitle => 'Новая привычка';
  @override
  String get formSubtitle => 'Настрой начало так, как тебе удобно.';
  @override
  String get formActionSave => 'Сохранить изменения';
  @override
  String get formActionStart => 'Начать отсчёт';
  @override
  String get formCustomHabitBlockTitle => 'Твоя привычка';
  @override
  String get formHabitNameLabel => 'Название привычки';
  @override
  String get formHabitNameHint => 'Например: Алкоголь';
  @override
  String get formHabitNameValidation => 'Укажи название привычки';
  @override
  String get formEmojiLabel => 'Эмодзи';
  @override
  String get formEmojiHint => 'Например: 🚭';
  @override
  String get formStartPointTitle => 'Точка отсчёта';
  @override
  String get formWhyTitle => 'Почему это важно';
  @override
  String get formCustomReasonLabel => 'Своя причина';
  @override
  String get formCustomReasonHint => 'Почему тебе хочется начать именно сейчас?';
  @override
  String get detailsStartDateTitle => 'Дата начала';
  @override
  String get detailsReasonTitle => 'Причина';
  @override
  String get detailsReasonEmpty => 'Причина не указана';
  @override
  String get detailsResetAction => 'Начать заново';
  @override
  String get detailsDeleteAction => 'Удалить привычку';
  @override
  String get detailsResetDialogTitle => 'Начать заново?';
  @override
  String get detailsResetDialogBody => 'Текущий прогресс начнётся заново с текущего момента.';
  @override
  String get detailsDeleteDialogTitle => 'Удалить привычку?';
  @override
  String get detailsDeleteDialogBody => 'Это действие нельзя отменить.';
  @override
  String get commonCancel => 'Отмена';
  @override
  String get commonDelete => 'Удалить';
  @override
  String get presetAlcoholTitle => 'Алкоголь';
  @override
  String get presetSmokingTitle => 'Сигареты';
  @override
  String get presetSugarTitle => 'Сахар';
  @override
  String get presetCoffeeTitle => 'Кофе';
  @override
  String get presetPornTitle => 'Порно';
  @override
  String get presetSocialTitle => 'Соцсети';
  @override
  String get presetGamesTitle => 'Игры';
  @override
  String get presetCustomTitle => 'Своя привычка';
  @override
  String get presetAlcoholReason1 => 'Хочу лучше себя чувствовать';
  @override
  String get presetAlcoholReason2 => 'Хочу лучше спать';
  @override
  String get presetAlcoholReason3 => 'Хочу быть собраннее';
  @override
  String get presetAlcoholReason4 => 'Хочу больше контролировать свою жизнь';
  @override
  String get presetSmokingReason1 => 'Хочу улучшить здоровье';
  @override
  String get presetSmokingReason2 => 'Хочу легче дышать';
  @override
  String get presetSmokingReason3 => 'Хочу меньше тратить денег';
  @override
  String get presetSmokingReason4 => 'Хочу чувствовать себя свободнее';
  @override
  String get presetSugarReason1 => 'Хочу меньше скачков энергии';
  @override
  String get presetSugarReason2 => 'Хочу стабильное самочувствие';
  @override
  String get presetSugarReason3 => 'Хочу лучше питаться';
  @override
  String get presetSugarReason4 => 'Хочу похудеть';
  @override
  String get presetCoffeeReason1 => 'Хочу лучше спать';
  @override
  String get presetCoffeeReason2 => 'Хочу убрать тревожность';
  @override
  String get presetCoffeeReason3 => 'Хочу меньше зависеть от стимуляторов';
  @override
  String get presetCoffeeReason4 => 'Хочу стабильную энергию без кофеина';
  @override
  String get presetPornReason1 => 'Хочу больше самоконтроля';
  @override
  String get presetPornReason2 => 'Хочу больше энергии';
  @override
  String get presetPornReason3 => 'Хочу улучшить концентрацию';
  @override
  String get presetPornReason4 => 'Хочу вернуть ясность мышления';
  @override
  String get presetSocialReason1 => 'Хочу меньше отвлекаться';
  @override
  String get presetSocialReason2 => 'Хочу вернуть концентрацию';
  @override
  String get presetSocialReason3 => 'Хочу меньше зависеть от телефона';
  @override
  String get presetSocialReason4 => 'Хочу освободить время';
  @override
  String get presetGamesReason1 => 'Хочу вернуть контроль над временем';
  @override
  String get presetGamesReason2 => 'Хочу делать больше полезного';
  @override
  String get presetGamesReason3 => 'Хочу меньше прокрастинировать';
  @override
  String get presetGamesReason4 => 'Хочу лучше концентрироваться';
  @override
  String get presetCustomReason1 => 'Хочу улучшить здоровье';
  @override
  String get presetCustomReason2 => 'Хочу больше энергии';
  @override
  String get presetCustomReason3 => 'Хочу больше контроля над собой';
  @override
  String get presetCustomReason4 => 'Хочу изменить жизнь к лучшему';
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _EnAppLocalizationsProxy implements AppLocalizations {
  @override
  String get appTitle => 'Clean Track';
  @override
  String get welcomeTitle => 'Clean Track';
  @override
  String get welcomeSubtitle => 'Track your progress calmly and return to yourself without extra noise.';
  @override
  String get addHabitSceneTitle => 'New habit';
  @override
  String get addHabitSceneSubtitle => 'Add a new habit and begin a new path at your own pace.';
  @override
  String get addHabitSceneHint => 'Swipe back to return to your habits.';
  @override
  String get emptyStateTitle => 'First habit';
  @override
  String get emptyStateSubtitle => 'Start with one habit and simply watch your progress.';
  @override
  String get habitPickerTitle => 'Add habit';
  @override
  String get habitPickerSubtitle => 'Choose where you\'d like to begin. You can pick a ready-made option or create your own.';
  @override
  String get habitPickerAllUsedSubtitle => 'All ready-made habits have already been added. You can create your own.';
  @override
  String get customHabitTitle => 'Custom habit';
  @override
  String get customHabitSubtitle => 'Create your own option manually';
  @override
  String get formEditTitle => 'Edit habit';
  @override
  String get formCreateTitle => 'New habit';
  @override
  String get formSubtitle => 'Set the beginning in the way that feels right for you.';
  @override
  String get formActionSave => 'Save changes';
  @override
  String get formActionStart => 'Start tracking';
  @override
  String get formCustomHabitBlockTitle => 'Your habit';
  @override
  String get formHabitNameLabel => 'Habit name';
  @override
  String get formHabitNameHint => 'For example: Alcohol';
  @override
  String get formHabitNameValidation => 'Enter a habit name';
  @override
  String get formEmojiLabel => 'Emoji';
  @override
  String get formEmojiHint => 'For example: 🚭';
  @override
  String get formStartPointTitle => 'Starting point';
  @override
  String get formWhyTitle => 'Why this matters';
  @override
  String get formCustomReasonLabel => 'Your reason';
  @override
  String get formCustomReasonHint => 'Why do you want to begin right now?';
  @override
  String get detailsStartDateTitle => 'Start date';
  @override
  String get detailsReasonTitle => 'Reason';
  @override
  String get detailsReasonEmpty => 'No reason specified';
  @override
  String get detailsResetAction => 'Start over';
  @override
  String get detailsDeleteAction => 'Delete habit';
  @override
  String get detailsResetDialogTitle => 'Start over?';
  @override
  String get detailsResetDialogBody => 'Your current progress will begin again from this moment.';
  @override
  String get detailsDeleteDialogTitle => 'Delete habit?';
  @override
  String get detailsDeleteDialogBody => 'This action cannot be undone.';
  @override
  String get commonCancel => 'Cancel';
  @override
  String get commonDelete => 'Delete';
  @override
  String get presetAlcoholTitle => 'Alcohol';
  @override
  String get presetSmokingTitle => 'Smoking';
  @override
  String get presetSugarTitle => 'Sugar';
  @override
  String get presetCoffeeTitle => 'Coffee';
  @override
  String get presetPornTitle => 'Porn';
  @override
  String get presetSocialTitle => 'Social media';
  @override
  String get presetGamesTitle => 'Games';
  @override
  String get presetCustomTitle => 'Custom habit';
  @override
  String get presetAlcoholReason1 => 'I want to feel better';
  @override
  String get presetAlcoholReason2 => 'I want to sleep better';
  @override
  String get presetAlcoholReason3 => 'I want to feel more collected';
  @override
  String get presetAlcoholReason4 => 'I want more control over my life';
  @override
  String get presetSmokingReason1 => 'I want to improve my health';
  @override
  String get presetSmokingReason2 => 'I want to breathe more easily';
  @override
  String get presetSmokingReason3 => 'I want to spend less money';
  @override
  String get presetSmokingReason4 => 'I want to feel more free';
  @override
  String get presetSugarReason1 => 'I want fewer energy crashes';
  @override
  String get presetSugarReason2 => 'I want steadier well-being';
  @override
  String get presetSugarReason3 => 'I want to eat better';
  @override
  String get presetSugarReason4 => 'I want to lose weight';
  @override
  String get presetCoffeeReason1 => 'I want to sleep better';
  @override
  String get presetCoffeeReason2 => 'I want less anxiety';
  @override
  String get presetCoffeeReason3 => 'I want to rely less on stimulants';
  @override
  String get presetCoffeeReason4 => 'I want stable energy without caffeine';
  @override
  String get presetPornReason1 => 'I want more self-control';
  @override
  String get presetPornReason2 => 'I want more energy';
  @override
  String get presetPornReason3 => 'I want to improve focus';
  @override
  String get presetPornReason4 => 'I want to regain mental clarity';
  @override
  String get presetSocialReason1 => 'I want fewer distractions';
  @override
  String get presetSocialReason2 => 'I want to regain focus';
  @override
  String get presetSocialReason3 => 'I want to depend less on my phone';
  @override
  String get presetSocialReason4 => 'I want to free up time';
  @override
  String get presetGamesReason1 => 'I want to regain control over my time';
  @override
  String get presetGamesReason2 => 'I want to do more useful things';
  @override
  String get presetGamesReason3 => 'I want to procrastinate less';
  @override
  String get presetGamesReason4 => 'I want to focus better';
  @override
  String get presetCustomReason1 => 'I want to improve my health';
  @override
  String get presetCustomReason2 => 'I want more energy';
  @override
  String get presetCustomReason3 => 'I want more control over myself';
  @override
  String get presetCustomReason4 => 'I want to change my life for the better';
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
EOF

cat > lib/features/counters/presentation/screen/counters_list_screen.dart <<'EOF'
import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n.dart';
import '../../data/counters_storage.dart';
import '../../data/habit_presets.dart';
import '../../models/counter_item.dart';
import '../../models/habit_preset.dart';
import '../widgets/counter_card.dart';
import 'counter_details_screen.dart';
import 'counter_form_screen.dart';
import 'habit_preset_picker_screen.dart';

class CountersListScreen extends StatefulWidget {
  const CountersListScreen({super.key});

  @override
  State<CountersListScreen> createState() => _CountersListScreenState();
}

class _CountersListScreenState extends State<CountersListScreen> {
  final CountersStorage _storage = CountersStorage();
  final PageController _pageController = PageController(viewportFraction: 0.96);

  List<CounterItem> _counters = [];
  bool _isLoading = true;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _loadCounters();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadCounters() async {
    final items = await _storage.loadCounters();
    if (!mounted) return;

    setState(() {
      _counters = items;
      _isLoading = false;
    });
  }

  Future<void> _persistCounters() {
    return _storage.saveCounters(_counters);
  }

  void _addCounter(CounterItem item) {
    setState(() {
      _counters.add(item);
    });
    _persistCounters();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _pageController.animateToPage(
        _counters.length - 1,
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOut,
      );
    });
  }

  void _updateCounter(CounterItem updated) {
    setState(() {
      final index = _counters.indexWhere((e) => e.id == updated.id);
      if (index != -1) {
        _counters[index] = updated;
      }
    });
    _persistCounters();
  }

  void _deleteCounter(String id) {
    setState(() {
      _counters.removeWhere((e) => e.id == id);

      if (_currentPage > 0 && _currentPage >= _counters.length) {
        _currentPage = _counters.length - 1;
      }

      if (_counters.isEmpty) {
        _currentPage = 0;
      }
    });

    _persistCounters();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final targetPage =
          _counters.isEmpty ? 0 : _currentPage.clamp(0, _counters.length - 1);

      _pageController.jumpToPage(targetPage);
    });
  }

  void _resetCounter(String id) {
    setState(() {
      final index = _counters.indexWhere((e) => e.id == id);
      if (index != -1) {
        _counters[index] = _counters[index].copyWith(startAt: DateTime.now());
      }
    });
    _persistCounters();
  }

  Future<void> _openCreateFlow() async {
    final excludedPresetKeys = _counters
        .map((item) => item.presetKey)
        .whereType<String>()
        .where((key) => key.isNotEmpty && key != 'custom')
        .toSet();

    final preset = await Navigator.of(context).push<HabitPreset>(
      MaterialPageRoute(
        builder: (_) => HabitPresetPickerScreen(
          excludedPresetKeys: excludedPresetKeys,
        ),
      ),
    );

    if (!mounted || preset == null) return;

    final result = await Navigator.of(context).push<CounterItem>(
      MaterialPageRoute(
        builder: (_) => CounterFormScreen(preset: preset),
      ),
    );

    if (result != null) {
      _addCounter(result);
    }
  }

  Future<void> _openDetails(CounterItem item) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CounterDetailsScreen(
          counter: item,
          onSave: _updateCounter,
          onDelete: _deleteCounter,
          onReset: _resetCounter,
        ),
      ),
    );

    if (!mounted) return;
    setState(() {});
  }

  Widget _buildMeditativeBackground({required Widget child}) {
    return Container(
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
              Colors.white.withValues(alpha: 0.08),
              Colors.white.withValues(alpha: 0.14),
              Colors.white.withValues(alpha: 0.10),
            ],
          ),
        ),
        child: child,
      ),
    );
  }

  Widget _buildAddCounterScene(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 18),
      child: Column(
        children: [
          const Spacer(),
          Text(
            l10n.addHabitSceneTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color(0xFF22312B),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.addHabitSceneSubtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1.45,
              color: Color(0xFF607066),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: _openCreateFlow,
            child: Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.92),
                border: Border.all(color: const Color(0xFFE6ECE6)),
              ),
              child: const Icon(
                Icons.add,
                size: 44,
                color: Color(0xFF24A770),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            l10n.addHabitSceneHint,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              height: 1.4,
              color: Color(0xFF748379),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 18),
      child: Column(
        children: [
          const Spacer(),
          Text(
            l10n.emptyStateTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color(0xFF22312B),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.emptyStateSubtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1.45,
              color: Color(0xFF607066),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: _openCreateFlow,
            child: Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.92),
                border: Border.all(color: const Color(0xFFE6ECE6)),
              ),
              child: const Icon(
                Icons.add,
                size: 44,
                color: Color(0xFF24A770),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    if (_isLoading) {
      return Scaffold(
        backgroundColor: const Color(0xFFF7FAFB),
        body: _buildMeditativeBackground(
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    final localizedCounters = _counters
        .map((item) => localizeCounterItem(item, l10n))
        .toList();

    final hasItems = localizedCounters.isNotEmpty;
    final totalPages = hasItems ? localizedCounters.length + 1 : 1;

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFB),
      body: _buildMeditativeBackground(
        child: SafeArea(
          child: hasItems
              ? Column(
                  children: [
                    const SizedBox(height: 22),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemCount: totalPages,
                        itemBuilder: (context, index) {
                          if (index == localizedCounters.length) {
                            return _buildAddCounterScene(context);
                          }

                          final item = localizedCounters[index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(14, 22, 14, 18),
                            child: CounterCard(
                              item: item,
                              onTap: () => _openDetails(_counters[index]),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(totalPages, (index) {
                          final isActive = index == _currentPage;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: isActive ? 22 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? const Color(0xFF24A770)
                                  : const Color(0xFF24A770).withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(999),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                )
              : _buildEmptyState(context),
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
    final elapsed = formatElapsed(localizedCounter.startAt);

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
