import '../../../../l10n/app_localizations.dart';
import '../models/habit_preset.dart';

List<HabitPreset> buildHabitPresets(AppLocalizations l10n) {
  return [
    HabitPreset(
      keyName: 'alcohol',
      title: l10n.presetAlcoholTitle,
      emoji: '🍷',
      reasons: [
        l10n.presetAlcoholReason1,
        l10n.presetAlcoholReason2,
        l10n.presetAlcoholReason3,
        l10n.presetAlcoholReason4,
      ],
    ),
    HabitPreset(
      keyName: 'smoking',
      title: l10n.presetSmokingTitle,
      emoji: '🚭',
      reasons: [
        l10n.presetSmokingReason1,
        l10n.presetSmokingReason2,
        l10n.presetSmokingReason3,
        l10n.presetSmokingReason4,
      ],
    ),
    HabitPreset(
      keyName: 'sugar',
      title: l10n.presetSugarTitle,
      emoji: '🍰',
      reasons: [
        l10n.presetSugarReason1,
        l10n.presetSugarReason2,
        l10n.presetSugarReason3,
        l10n.presetSugarReason4,
      ],
    ),
    HabitPreset(
      keyName: 'coffee',
      title: l10n.presetCoffeeTitle,
      emoji: '☕',
      reasons: [
        l10n.presetCoffeeReason1,
        l10n.presetCoffeeReason2,
        l10n.presetCoffeeReason3,
        l10n.presetCoffeeReason4,
      ],
    ),
    HabitPreset(
      keyName: 'porn',
      title: l10n.presetPornTitle,
      emoji: '🔞',
      reasons: [
        l10n.presetPornReason1,
        l10n.presetPornReason2,
        l10n.presetPornReason3,
        l10n.presetPornReason4,
      ],
    ),
    HabitPreset(
      keyName: 'social',
      title: l10n.presetSocialTitle,
      emoji: '📱',
      reasons: [
        l10n.presetSocialReason1,
        l10n.presetSocialReason2,
        l10n.presetSocialReason3,
        l10n.presetSocialReason4,
      ],
    ),
    HabitPreset(
      keyName: 'games',
      title: l10n.presetGamesTitle,
      emoji: '🎮',
      reasons: [
        l10n.presetGamesReason1,
        l10n.presetGamesReason2,
        l10n.presetGamesReason3,
        l10n.presetGamesReason4,
      ],
    ),
    HabitPreset(
      keyName: 'custom',
      title: l10n.presetCustomTitle,
      emoji: '💪',
      reasons: [
        l10n.presetCustomReason1,
        l10n.presetCustomReason2,
        l10n.presetCustomReason3,
        l10n.presetCustomReason4,
      ],
      isCustom: true,
    ),
  ];
}

HabitPreset? findHabitPresetByKey(
  String? key,
  AppLocalizations l10n,
) {
  if (key == null) return null;

  for (final preset in buildHabitPresets(l10n)) {
    if (preset.keyName == key) return preset;
  }
  return null;
}

HabitPreset customHabitPreset(AppLocalizations l10n) {
  return buildHabitPresets(l10n).firstWhere((preset) => preset.isCustom);
}
