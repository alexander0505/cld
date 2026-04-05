import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/counter_item.dart';

class CountersStorage {
  static const _storageKey = 'counters';
  static const _hasSeenWelcomeKey = 'has_seen_welcome';

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

  Future<bool> hasSeenWelcome() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_hasSeenWelcomeKey) ?? false;
  }

  Future<void> markWelcomeSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_hasSeenWelcomeKey, true);
  }
}
