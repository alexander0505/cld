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
}
