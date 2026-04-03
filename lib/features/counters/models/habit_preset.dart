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
