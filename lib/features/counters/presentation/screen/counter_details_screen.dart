
import 'package:flutter/material.dart';

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
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Сбросить счетчик?'),
        content:
            const Text('Текущий прогресс начнётся заново с текущего момента.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Сбросить'),
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
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Удалить счетчик?'),
        content: const Text('Это действие нельзя отменить.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Удалить'),
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
    final elapsed = formatElapsed(_counter.startAt);

    return Scaffold(
      appBar: AppBar(
        title: Text(_counter.title),
        actions: [
          IconButton(
            onPressed: _editCounter,
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: _confirmDelete,
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 12),
            Text(
              _counter.emoji,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 56),
            ),
            const SizedBox(height: 16),
            Text(
              _counter.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                child: Column(
                  children: [
                    const Text(
                      'Текущий результат',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      elapsed,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Дата старта',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8),
                    Text(formatDateTime(_counter.startAt)),
                    const SizedBox(height: 16),
                    const Text(
                      'Причина',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _counter.reason.isEmpty ? 'Не указана' : _counter.reason,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            FilledButton.icon(
              onPressed: _confirmReset,
              icon: const Icon(Icons.refresh),
              label: const Text('Начать заново'),
            ),
          ],
        ),
      ),
    );
  }
}
