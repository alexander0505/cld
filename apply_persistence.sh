#!/usr/bin/env bash
set -euo pipefail

cat > pubspec.yaml <<'EOF'
name: hello_flutter
description: "A new Flutter project."
publish_to: 'none'
version: 0.1.0+1

environment:
  sdk: ^3.11.4

dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^2.5.3

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0

flutter:
  uses-material-design: true
EOF

mkdir -p lib/features/counters/data

cat > lib/features/counters/data/counters_storage.dart <<'EOF'
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/counter_item.dart';

class CountersStorage {
  static const _storageKey = 'counters';

  Future<List<CounterItem>> loadCounters() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storageKey);

    if (raw == null || raw.isEmpty) {
      return [];
    }

    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((item) => CounterItem.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveCounters(List<CounterItem> counters) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(
      counters.map((item) => item.toJson()).toList(),
    );
    await prefs.setString(_storageKey, encoded);
  }
}
EOF

cat > lib/features/counters/models/counter_item.dart <<'EOF'
class CounterItem {
  final String id;
  final String title;
  final String emoji;
  final DateTime startAt;
  final String reason;
  final String? presetKey;

  CounterItem({
    required this.id,
    required this.title,
    required this.emoji,
    required this.startAt,
    required this.reason,
    this.presetKey,
  });

  CounterItem copyWith({
    String? id,
    String? title,
    String? emoji,
    DateTime? startAt,
    String? reason,
    String? presetKey,
  }) {
    return CounterItem(
      id: id ?? this.id,
      title: title ?? this.title,
      emoji: emoji ?? this.emoji,
      startAt: startAt ?? this.startAt,
      reason: reason ?? this.reason,
      presetKey: presetKey ?? this.presetKey,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'emoji': emoji,
      'startAt': startAt.toIso8601String(),
      'reason': reason,
      'presetKey': presetKey,
    };
  }

  factory CounterItem.fromJson(Map<String, dynamic> json) {
    return CounterItem(
      id: json['id'] as String,
      title: json['title'] as String,
      emoji: json['emoji'] as String,
      startAt: DateTime.parse(json['startAt'] as String),
      reason: json['reason'] as String,
      presetKey: json['presetKey'] as String?,
    );
  }
}
EOF

cat > lib/features/counters/presentation/screen/counters_list_screen.dart <<'EOF'
import 'package:flutter/material.dart';

import '../../data/counters_storage.dart';
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
  List<CounterItem> _counters = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCounters();
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
    });
    _persistCounters();
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
    final preset = await Navigator.of(context).push<HabitPreset>(
      MaterialPageRoute(
        builder: (_) => const HabitPresetPickerScreen(),
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

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final hasItems = _counters.isNotEmpty;

    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clean Track'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openCreateFlow,
        child: const Icon(Icons.add),
      ),
      body: hasItems
          ? ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _counters.length,
              separatorBuilder: (context, index) =>
                  const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = _counters[index];
                return CounterCard(
                  item: item,
                  onTap: () => _openDetails(item),
                );
              },
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.spa, size: 64),
                    const SizedBox(height: 16),
                    const Text(
                      'Пока нет активных счетчиков',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Создай первый счетчик и начни отслеживать прогресс с сегодняшнего дня.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    FilledButton.icon(
                      onPressed: _openCreateFlow,
                      icon: const Icon(Icons.add),
                      label: const Text('Создать счетчик'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
EOF

echo "Done. Now run:"
echo "  flutter pub get"
echo "  flutter analyze"
echo "  flutter run"
