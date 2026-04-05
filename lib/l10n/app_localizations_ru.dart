// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Clean Track';

  @override
  String get welcomeTitle => 'Clean Track';

  @override
  String get welcomeSubtitle =>
      'Спокойно наблюдай за своим прогрессом и возвращайся к себе без лишнего шума.';

  @override
  String get addHabitSceneTitle => 'Новая привычка';

  @override
  String get addHabitSceneSubtitle =>
      'Добавь новую привычку и начни новый путь в своём ритме.';

  @override
  String get addHabitSceneHint =>
      'Свайпни назад, чтобы вернуться к своим привычкам.';

  @override
  String get emptyStateTitle => 'Первая привычка';

  @override
  String get emptyStateSubtitle =>
      'Начни с одной привычки и просто наблюдай за своим прогрессом.';

  @override
  String get habitPickerTitle => 'Добавить привычку';

  @override
  String get habitPickerSubtitle =>
      'Выбери, с чего хочешь начать. Можно взять готовый вариант или создать свой.';

  @override
  String get habitPickerAllUsedSubtitle =>
      'Все готовые привычки уже выбраны. Можно создать свой вариант.';

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
  String get formCustomReasonHint =>
      'Почему тебе хочется начать именно сейчас?';

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
  String get detailsResetDialogBody =>
      'Текущий прогресс начнётся заново с текущего момента.';

  @override
  String get detailsDeleteDialogTitle => 'Удалить привычку?';

  @override
  String get detailsDeleteDialogBody => 'Это действие нельзя отменить.';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonDelete => 'Удалить';
}
