import 'package:flutter/material.dart';

void main() {
  runApp(const CleanTrackApp());
}

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
      home: const WelcomeScreen(),
    );
  }
}

class HabitPreset {
  final String keyName;
  final String title;
  final String emoji;
  final List<String> reasons;
  final bool isCustom;

  const HabitPreset({
    required this.keyName,
    required this.title,
    required this.emoji,
    required this.reasons,
    this.isCustom = false,
  });
}

const List<HabitPreset> habitPresets = [
  HabitPreset(
    keyName: 'alcohol',
    title: 'Алкоголь',
    emoji: '🍷',
    reasons: [
      'Хочу лучше себя чувствовать',
      'Хочу лучше спать',
      'Хочу быть собраннее',
      'Хочу больше контролировать свою жизнь',
    ],
  ),
  HabitPreset(
    keyName: 'smoking',
    title: 'Сигареты',
    emoji: '🚭',
    reasons: [
      'Хочу улучшить здоровье',
      'Хочу легче дышать',
      'Хочу меньше тратить денег',
      'Хочу чувствовать себя свободнее',
    ],
  ),
  HabitPreset(
    keyName: 'sugar',
    title: 'Сахар',
    emoji: '🍰',
    reasons: [
      'Хочу меньше скачков энергии',
      'Хочу стабильное самочувствие',
      'Хочу лучше питаться',
      'Хочу похудеть',
    ],
  ),
  HabitPreset(
    keyName: 'coffee',
    title: 'Кофе',
    emoji: '☕',
    reasons: [
      'Хочу лучше спать',
      'Хочу убрать тревожность',
      'Хочу меньше зависеть от стимуляторов',
      'Хочу стабильную энергию без кофеина',
    ],
  ),
  HabitPreset(
    keyName: 'porn',
    title: 'Порно',
    emoji: '🔞',
    reasons: [
      'Хочу больше самоконтроля',
      'Хочу больше энергии',
      'Хочу улучшить концентрацию',
      'Хочу вернуть ясность мышления',
    ],
  ),
  HabitPreset(
    keyName: 'social',
    title: 'Соцсети',
    emoji: '📱',
    reasons: [
      'Хочу меньше отвлекаться',
      'Хочу вернуть концентрацию',
      'Хочу меньше зависеть от телефона',
      'Хочу освободить время',
    ],
  ),
  HabitPreset(
    keyName: 'games',
    title: 'Игры',
    emoji: '🎮',
    reasons: [
      'Хочу вернуть контроль над временем',
      'Хочу делать больше полезного',
      'Хочу меньше прокрастинировать',
      'Хочу лучше концентрироваться',
    ],
  ),
  HabitPreset(
    keyName: 'custom',
    title: 'Своя привычка',
    emoji: '💪',
    reasons: [
      'Хочу улучшить здоровье',
      'Хочу больше энергии',
      'Хочу больше контроля над собой',
      'Хочу изменить жизнь к лучшему',
    ],
    isCustom: true,
  ),
];

class CounterItem {
  final String id;
  final String title;
  final String emoji;
  final DateTime startAt;
  final String reason;

  CounterItem({
    required this.id,
    required this.title,
    required this.emoji,
    required this.startAt,
    required this.reason,
  });

  CounterItem copyWith({
    String? id,
    String? title,
    String? emoji,
    DateTime? startAt,
    String? reason,
  }) {
    return CounterItem(
      id: id ?? this.id,
      title: title ?? this.title,
      emoji: emoji ?? this.emoji,
      startAt: startAt ?? this.startAt,
      reason: reason ?? this.reason,
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _start(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const CountersListScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(),

            const Icon(
              Icons.spa,
              size: 80,
            ),

            const SizedBox(height: 24),

            const Text(
              'Clean Track',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              'Отслеживай свой прогресс\nи избавляйся от зависимостей',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () => _start(context),
                child: const Text('Начать'),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class CountersListScreen extends StatefulWidget {
  const CountersListScreen({super.key});

  @override
  State<CountersListScreen> createState() => _CountersListScreenState();
}

class _CountersListScreenState extends State<CountersListScreen> {
  final List<CounterItem> _counters = [
    CounterItem(
      id: '1',
      title: 'Алкоголь',
      emoji: '🍷',
      startAt: DateTime.now().subtract(const Duration(days: 12, hours: 4)),
      reason: 'Хочу лучше себя чувствовать',
    ),
    CounterItem(
      id: '2',
      title: 'Сахар',
      emoji: '🍰',
      startAt: DateTime.now().subtract(const Duration(hours: 18, minutes: 20)),
      reason: 'Хочу меньше скачков энергии',
    ),
  ];

  void _addCounter(CounterItem item) {
    setState(() {
      _counters.add(item);
    });
  }

  void _updateCounter(CounterItem updated) {
    setState(() {
      final index = _counters.indexWhere((e) => e.id == updated.id);
      if (index != -1) {
        _counters[index] = updated;
      }
    });
  }

  void _deleteCounter(String id) {
    setState(() {
      _counters.removeWhere((e) => e.id == id);
    });
  }

  void _resetCounter(String id) {
    setState(() {
      final index = _counters.indexWhere((e) => e.id == id);
      if (index != -1) {
        _counters[index] = _counters[index].copyWith(startAt: DateTime.now());
      }
    });
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
              separatorBuilder: (_, __) => const SizedBox(height: 12),
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
                      'Добавь первый счетчик',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Начни с одной привычки и отслеживай свой прогресс.',
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
        separatorBuilder: (_, __) => const SizedBox(height: 10),
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
              onTap: () => Navigator.of(context).pop(preset),
            ),
          );
        },
      ),
    );
  }
}

class CounterCard extends StatelessWidget {
  final CounterItem item;
  final VoidCallback onTap;

  const CounterCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final elapsed = formatElapsed(item.startAt);

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                item.emoji,
                style: const TextStyle(fontSize: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      elapsed,
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Старт: ${formatDateTime(item.startAt)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

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
    final matchedPreset = habitPresets.where((e) => e.title == _counter.title).isNotEmpty
        ? habitPresets.firstWhere((e) => e.title == _counter.title)
        : habitPresets.last;

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
        content: const Text('Текущий прогресс начнётся заново с текущего момента.'),
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
                padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                child: Column(
                  children: [
                    const Text(
                      'Текущий streak',
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
              label: const Text('Сбросить счетчик'),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterFormScreen extends StatefulWidget {
  final CounterItem? existing;
  final HabitPreset preset;

  const CounterFormScreen({
    super.key,
    this.existing,
    required this.preset,
  });

  @override
  State<CounterFormScreen> createState() => _CounterFormScreenState();
}

class _CounterFormScreenState extends State<CounterFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _titleController;
  late final TextEditingController _emojiController;
  late final TextEditingController _reasonController;
  late DateTime _startAt;
  String? _selectedReason;

  bool get isEdit => widget.existing != null;
  bool get isCustomPreset => widget.preset.isCustom;

  List<String> get reasons => widget.preset.reasons;

  @override
  void initState() {
    super.initState();
    final existing = widget.existing;

    _titleController = TextEditingController(
      text: existing?.title ?? widget.preset.title,
    );
    _emojiController = TextEditingController(
      text: existing?.emoji ?? widget.preset.emoji,
    );
    _reasonController = TextEditingController(
      text: existing?.reason ?? '',
    );
    _startAt = existing?.startAt ?? DateTime.now();

    if ((existing?.reason ?? '').isNotEmpty && reasons.contains(existing!.reason)) {
      _selectedReason = existing.reason;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _emojiController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _startAt,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate == null || !mounted) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_startAt),
    );

    if (pickedTime == null) return;

    setState(() {
      _startAt = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    });
  }

  void _selectReason(String reason) {
    setState(() {
      _selectedReason = reason;
      _reasonController.text = reason;
    });
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final now = DateTime.now();
    final item = CounterItem(
      id: widget.existing?.id ?? now.microsecondsSinceEpoch.toString(),
      title: _titleController.text.trim(),
      emoji: _emojiController.text.trim().isEmpty ? '💪' : _emojiController.text.trim(),
      startAt: _startAt,
      reason: _reasonController.text.trim(),
    );

    Navigator.of(context).pop(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Редактировать' : 'Новый счетчик'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (!isCustomPreset) ...[
              Card(
                child: ListTile(
                  leading: Text(
                    widget.preset.emoji,
                    style: const TextStyle(fontSize: 28),
                  ),
                  title: Text(
                    widget.preset.title,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  subtitle: const Text('Выбранная привычка'),
                ),
              ),
              const SizedBox(height: 16),
            ],
            TextFormField(
              controller: _titleController,
              enabled: isCustomPreset || isEdit,
              decoration: const InputDecoration(
                labelText: 'Название',
                border: OutlineInputBorder(),
                hintText: 'Например: Алкоголь',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Введите название';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emojiController,
              enabled: isCustomPreset || isEdit,
              decoration: const InputDecoration(
                labelText: 'Emoji',
                border: OutlineInputBorder(),
                hintText: 'Например: 🚭',
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: _pickDateTime,
              borderRadius: BorderRadius.circular(12),
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Дата и время старта',
                  border: OutlineInputBorder(),
                ),
                child: Text(formatDateTime(_startAt)),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Причина',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: reasons.map((reason) {
                final isSelected = _selectedReason == reason;
                return ChoiceChip(
                  label: Text(reason),
                  selected: isSelected,
                  onSelected: (_) => _selectReason(reason),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _reasonController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Своя причина',
                border: OutlineInputBorder(),
                hintText: 'Почему ты хочешь отказаться от этой привычки?',
              ),
              onChanged: (_) {
                if (_selectedReason != null) {
                  setState(() {
                    _selectedReason = null;
                  });
                }
              },
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _save,
              child: Text(isEdit ? 'Сохранить изменения' : 'Создать счетчик'),
            ),
          ],
        ),
      ),
    );
  }
}

String formatElapsed(DateTime startAt) {
  final diff = DateTime.now().difference(startAt);

  if (diff.inDays > 0) {
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    return '$days дн $hours ч';
  }

  if (diff.inHours > 0) {
    final hours = diff.inHours;
    final minutes = diff.inMinutes % 60;
    return '$hours ч $minutes мин';
  }

  if (diff.inMinutes > 0) {
    return '${diff.inMinutes} мин';
  }

  return '${diff.inSeconds} сек';
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
