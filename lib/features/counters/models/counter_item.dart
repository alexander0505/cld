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
}
