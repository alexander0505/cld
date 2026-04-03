
import 'package:flutter/material.dart';

import '../../data/habit_presets.dart';
import '../../models/habit_preset.dart';

class HabitPresetPickerScreen extends StatelessWidget {
  const HabitPresetPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбери привычку'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: habitPresets.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final preset = habitPresets[index];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: Text(
                preset.emoji,
                style: const TextStyle(fontSize: 28),
              ),
              title: Text(
                preset.title,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: Text(
                preset.isCustom
                    ? 'Создать свой счетчик'
                    : 'Быстрое создание с готовыми причинами',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.of(context).pop<HabitPreset>(preset),
            ),
          );
        },
      ),
    );
  }
}
