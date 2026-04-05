import 'package:flutter/material.dart';

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
                  const Text(
                    'Добавить привычку',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF22312B),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    hasRegularPresets
                        ? 'Выбери, с чего хочешь начать.\nМожно выбрать готовый вариант или создать свой.'
                        : 'Все готовые привычки уже добавлены.\nМожно создать свой вариант.',
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
  final VoidCallback onTap;

  const _CustomHabitTile({
    required this.preset,
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
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Своя привычка',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF22312B),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Создай новый вариант вручную',
                        style: TextStyle(
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
