import '../../../../l10n/app_localizations.dart';
import '../models/counter_item.dart';
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

CounterItem localizeCounterItem(
  CounterItem item,
  AppLocalizations l10n,
) {
  final preset = findHabitPresetByKey(item.presetKey, l10n);

  if (preset == null || preset.isCustom) {
    return item;
  }

  String localizedReason = item.reason;

  final ruPresets = buildHabitPresets(_RuAppLocalizationsProxy());
  final enPresets = buildHabitPresets(_EnAppLocalizationsProxy());

  final ruPreset = ruPresets.where((p) => p.keyName == preset.keyName).firstOrNull;
  final enPreset = enPresets.where((p) => p.keyName == preset.keyName).firstOrNull;

  final knownReasons = <String>{
    ...?ruPreset?.reasons,
    ...?enPreset?.reasons,
  };

  if (knownReasons.contains(item.reason)) {
    final reasonIndex = [
      ...?ruPreset?.reasons,
    ].indexOf(item.reason);

    if (reasonIndex != -1 && reasonIndex < preset.reasons.length) {
      localizedReason = preset.reasons[reasonIndex];
    } else {
      final enReasonIndex = [
        ...?enPreset?.reasons,
      ].indexOf(item.reason);

      if (enReasonIndex != -1 && enReasonIndex < preset.reasons.length) {
        localizedReason = preset.reasons[enReasonIndex];
      }
    }
  }

  return item.copyWith(
    title: preset.title,
    emoji: preset.emoji,
    reason: localizedReason,
  );
}

extension _FirstWhereOrNullExtension<E> on Iterable<E> {
  E? get firstOrNull {
    if (isEmpty) return null;
    return first;
  }
}

class _RuAppLocalizationsProxy implements AppLocalizations {
  @override
  String get appTitle => 'Clean Track';
  @override
  String get welcomeTitle => 'Clean Track';
  @override
  String get welcomeSubtitle => 'Спокойно наблюдай за своим прогрессом и возвращайся к себе без лишнего шума.';
  @override
  String get addHabitSceneTitle => 'Новая привычка';
  @override
  String get addHabitSceneSubtitle => 'Добавь новую привычку и начни новый путь в своём ритме.';
  @override
  String get addHabitSceneHint => 'Свайпни назад, чтобы вернуться к своим привычкам.';
  @override
  String get emptyStateTitle => 'Первая привычка';
  @override
  String get emptyStateSubtitle => 'Начни с одной привычки и просто наблюдай за своим прогрессом.';
  @override
  String get habitPickerTitle => 'Добавить привычку';
  @override
  String get habitPickerSubtitle => 'Выбери, с чего хочешь начать. Можно взять готовый вариант или создать свой.';
  @override
  String get habitPickerAllUsedSubtitle => 'Все готовые привычки уже выбраны. Можно создать свой вариант.';
  @override
  String get customHabitTitle => 'Своя привычка';
  @override
  String get customHabitSubtitle => 'Создай свой вариант вручную';
  @override
  String get formEditTitle => 'Изменить привычку';
  @override
  String get formCreateTitle => 'Новая привычка';
  @override
  String get formSubtitle => 'Настрой начало так, как тебе удобно.';
  @override
  String get formActionSave => 'Сохранить изменения';
  @override
  String get formActionStart => 'Начать отсчёт';
  @override
  String get formCustomHabitBlockTitle => 'Твоя привычка';
  @override
  String get formHabitNameLabel => 'Название привычки';
  @override
  String get formHabitNameHint => 'Например: Алкоголь';
  @override
  String get formHabitNameValidation => 'Укажи название привычки';
  @override
  String get formEmojiLabel => 'Эмодзи';
  @override
  String get formEmojiHint => 'Например: 🚭';
  @override
  String get formStartPointTitle => 'Точка отсчёта';
  @override
  String get formWhyTitle => 'Почему это важно';
  @override
  String get formCustomReasonLabel => 'Своя причина';
  @override
  String get formCustomReasonHint => 'Почему тебе хочется начать именно сейчас?';
  @override
  String get detailsStartDateTitle => 'Дата начала';
  @override
  String get detailsReasonTitle => 'Причина';
  @override
  String get detailsReasonEmpty => 'Причина не указана';
  @override
  String get detailsResetAction => 'Начать заново';
  @override
  String get detailsDeleteAction => 'Удалить привычку';
  @override
  String get detailsResetDialogTitle => 'Начать заново?';
  @override
  String get detailsResetDialogBody => 'Текущий прогресс начнётся заново с текущего момента.';
  @override
  String get detailsDeleteDialogTitle => 'Удалить привычку?';
  @override
  String get detailsDeleteDialogBody => 'Это действие нельзя отменить.';
  @override
  String get commonCancel => 'Отмена';
  @override
  String get commonDelete => 'Удалить';
  @override
  String get presetAlcoholTitle => 'Алкоголь';
  @override
  String get presetSmokingTitle => 'Сигареты';
  @override
  String get presetSugarTitle => 'Сахар';
  @override
  String get presetCoffeeTitle => 'Кофе';
  @override
  String get presetPornTitle => 'Порно';
  @override
  String get presetSocialTitle => 'Соцсети';
  @override
  String get presetGamesTitle => 'Игры';
  @override
  String get presetCustomTitle => 'Своя привычка';
  @override
  String get presetAlcoholReason1 => 'Хочу лучше себя чувствовать';
  @override
  String get presetAlcoholReason2 => 'Хочу лучше спать';
  @override
  String get presetAlcoholReason3 => 'Хочу быть собраннее';
  @override
  String get presetAlcoholReason4 => 'Хочу больше контролировать свою жизнь';
  @override
  String get presetSmokingReason1 => 'Хочу улучшить здоровье';
  @override
  String get presetSmokingReason2 => 'Хочу легче дышать';
  @override
  String get presetSmokingReason3 => 'Хочу меньше тратить денег';
  @override
  String get presetSmokingReason4 => 'Хочу чувствовать себя свободнее';
  @override
  String get presetSugarReason1 => 'Хочу меньше скачков энергии';
  @override
  String get presetSugarReason2 => 'Хочу стабильное самочувствие';
  @override
  String get presetSugarReason3 => 'Хочу лучше питаться';
  @override
  String get presetSugarReason4 => 'Хочу похудеть';
  @override
  String get presetCoffeeReason1 => 'Хочу лучше спать';
  @override
  String get presetCoffeeReason2 => 'Хочу убрать тревожность';
  @override
  String get presetCoffeeReason3 => 'Хочу меньше зависеть от стимуляторов';
  @override
  String get presetCoffeeReason4 => 'Хочу стабильную энергию без кофеина';
  @override
  String get presetPornReason1 => 'Хочу больше самоконтроля';
  @override
  String get presetPornReason2 => 'Хочу больше энергии';
  @override
  String get presetPornReason3 => 'Хочу улучшить концентрацию';
  @override
  String get presetPornReason4 => 'Хочу вернуть ясность мышления';
  @override
  String get presetSocialReason1 => 'Хочу меньше отвлекаться';
  @override
  String get presetSocialReason2 => 'Хочу вернуть концентрацию';
  @override
  String get presetSocialReason3 => 'Хочу меньше зависеть от телефона';
  @override
  String get presetSocialReason4 => 'Хочу освободить время';
  @override
  String get presetGamesReason1 => 'Хочу вернуть контроль над временем';
  @override
  String get presetGamesReason2 => 'Хочу делать больше полезного';
  @override
  String get presetGamesReason3 => 'Хочу меньше прокрастинировать';
  @override
  String get presetGamesReason4 => 'Хочу лучше концентрироваться';
  @override
  String get presetCustomReason1 => 'Хочу улучшить здоровье';
  @override
  String get presetCustomReason2 => 'Хочу больше энергии';
  @override
  String get presetCustomReason3 => 'Хочу больше контроля над собой';
  @override
  String get presetCustomReason4 => 'Хочу изменить жизнь к лучшему';
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _EnAppLocalizationsProxy implements AppLocalizations {
  @override
  String get appTitle => 'Clean Track';
  @override
  String get welcomeTitle => 'Clean Track';
  @override
  String get welcomeSubtitle => 'Track your progress calmly and return to yourself without extra noise.';
  @override
  String get addHabitSceneTitle => 'New habit';
  @override
  String get addHabitSceneSubtitle => 'Add a new habit and begin a new path at your own pace.';
  @override
  String get addHabitSceneHint => 'Swipe back to return to your habits.';
  @override
  String get emptyStateTitle => 'First habit';
  @override
  String get emptyStateSubtitle => 'Start with one habit and simply watch your progress.';
  @override
  String get habitPickerTitle => 'Add habit';
  @override
  String get habitPickerSubtitle => 'Choose where you\'d like to begin. You can pick a ready-made option or create your own.';
  @override
  String get habitPickerAllUsedSubtitle => 'All ready-made habits have already been added. You can create your own.';
  @override
  String get customHabitTitle => 'Custom habit';
  @override
  String get customHabitSubtitle => 'Create your own option manually';
  @override
  String get formEditTitle => 'Edit habit';
  @override
  String get formCreateTitle => 'New habit';
  @override
  String get formSubtitle => 'Set the beginning in the way that feels right for you.';
  @override
  String get formActionSave => 'Save changes';
  @override
  String get formActionStart => 'Start tracking';
  @override
  String get formCustomHabitBlockTitle => 'Your habit';
  @override
  String get formHabitNameLabel => 'Habit name';
  @override
  String get formHabitNameHint => 'For example: Alcohol';
  @override
  String get formHabitNameValidation => 'Enter a habit name';
  @override
  String get formEmojiLabel => 'Emoji';
  @override
  String get formEmojiHint => 'For example: 🚭';
  @override
  String get formStartPointTitle => 'Starting point';
  @override
  String get formWhyTitle => 'Why this matters';
  @override
  String get formCustomReasonLabel => 'Your reason';
  @override
  String get formCustomReasonHint => 'Why do you want to begin right now?';
  @override
  String get detailsStartDateTitle => 'Start date';
  @override
  String get detailsReasonTitle => 'Reason';
  @override
  String get detailsReasonEmpty => 'No reason specified';
  @override
  String get detailsResetAction => 'Start over';
  @override
  String get detailsDeleteAction => 'Delete habit';
  @override
  String get detailsResetDialogTitle => 'Start over?';
  @override
  String get detailsResetDialogBody => 'Your current progress will begin again from this moment.';
  @override
  String get detailsDeleteDialogTitle => 'Delete habit?';
  @override
  String get detailsDeleteDialogBody => 'This action cannot be undone.';
  @override
  String get commonCancel => 'Cancel';
  @override
  String get commonDelete => 'Delete';
  @override
  String get presetAlcoholTitle => 'Alcohol';
  @override
  String get presetSmokingTitle => 'Smoking';
  @override
  String get presetSugarTitle => 'Sugar';
  @override
  String get presetCoffeeTitle => 'Coffee';
  @override
  String get presetPornTitle => 'Porn';
  @override
  String get presetSocialTitle => 'Social media';
  @override
  String get presetGamesTitle => 'Games';
  @override
  String get presetCustomTitle => 'Custom habit';
  @override
  String get presetAlcoholReason1 => 'I want to feel better';
  @override
  String get presetAlcoholReason2 => 'I want to sleep better';
  @override
  String get presetAlcoholReason3 => 'I want to feel more collected';
  @override
  String get presetAlcoholReason4 => 'I want more control over my life';
  @override
  String get presetSmokingReason1 => 'I want to improve my health';
  @override
  String get presetSmokingReason2 => 'I want to breathe more easily';
  @override
  String get presetSmokingReason3 => 'I want to spend less money';
  @override
  String get presetSmokingReason4 => 'I want to feel more free';
  @override
  String get presetSugarReason1 => 'I want fewer energy crashes';
  @override
  String get presetSugarReason2 => 'I want steadier well-being';
  @override
  String get presetSugarReason3 => 'I want to eat better';
  @override
  String get presetSugarReason4 => 'I want to lose weight';
  @override
  String get presetCoffeeReason1 => 'I want to sleep better';
  @override
  String get presetCoffeeReason2 => 'I want less anxiety';
  @override
  String get presetCoffeeReason3 => 'I want to rely less on stimulants';
  @override
  String get presetCoffeeReason4 => 'I want stable energy without caffeine';
  @override
  String get presetPornReason1 => 'I want more self-control';
  @override
  String get presetPornReason2 => 'I want more energy';
  @override
  String get presetPornReason3 => 'I want to improve focus';
  @override
  String get presetPornReason4 => 'I want to regain mental clarity';
  @override
  String get presetSocialReason1 => 'I want fewer distractions';
  @override
  String get presetSocialReason2 => 'I want to regain focus';
  @override
  String get presetSocialReason3 => 'I want to depend less on my phone';
  @override
  String get presetSocialReason4 => 'I want to free up time';
  @override
  String get presetGamesReason1 => 'I want to regain control over my time';
  @override
  String get presetGamesReason2 => 'I want to do more useful things';
  @override
  String get presetGamesReason3 => 'I want to procrastinate less';
  @override
  String get presetGamesReason4 => 'I want to focus better';
  @override
  String get presetCustomReason1 => 'I want to improve my health';
  @override
  String get presetCustomReason2 => 'I want more energy';
  @override
  String get presetCustomReason3 => 'I want more control over myself';
  @override
  String get presetCustomReason4 => 'I want to change my life for the better';
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
