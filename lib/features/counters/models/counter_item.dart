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
