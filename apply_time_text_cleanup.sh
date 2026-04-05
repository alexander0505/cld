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
  "customHabitSubtitle": "Create your own option manually"
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
  "customHabitSubtitle": "Создай свой вариант вручную"
}
EOF

cat > lib/app.dart <<'EOF'
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/l10n/l10n.dart';
import 'l10n/app_localizations.dart';
import 'features/counters/presentation/screen/welcome_screen.dart';

class CleanTrackApp extends StatelessWidget {
  const CleanTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Track',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      onGenerateTitle: (context) => context.l10n.appTitle,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocales.supported,
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          return const Locale('en');
        }

        if (locale.languageCode.toLowerCase() == 'ru') {
          return const Locale('ru');
        }

        return const Locale('en');
      },
      home: const WelcomeScreen(),
    );
  }
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

    final regularPresets = habitPresets
        .where((preset) => !preset.isCustom)
        .where((preset) => !excludedPresetKeys.contains(preset.keyName))
        .toList();

    final customPreset = habitPresets.firstWhere((preset) => preset.isCustom);
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
                        separatorBuilder: (_, separatorIndex) => const SizedBox(height: 14),
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
