// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Clean Track';

  @override
  String get welcomeTitle => 'Clean Track';

  @override
  String get welcomeSubtitle =>
      'Track your progress calmly and return to yourself without extra noise.';

  @override
  String get addHabitSceneTitle => 'New habit';

  @override
  String get addHabitSceneSubtitle =>
      'Add a new habit and begin a new path at your own pace.';

  @override
  String get addHabitSceneHint => 'Swipe back to return to your habits.';

  @override
  String get emptyStateTitle => 'First habit';

  @override
  String get emptyStateSubtitle =>
      'Start with one habit and simply watch your progress.';

  @override
  String get habitPickerTitle => 'Add habit';

  @override
  String get habitPickerSubtitle =>
      'Choose where you\'d like to begin. You can pick a ready-made option or create your own.';

  @override
  String get habitPickerAllUsedSubtitle =>
      'All ready-made habits have already been added. You can create your own.';

  @override
  String get customHabitTitle => 'Custom habit';

  @override
  String get customHabitSubtitle => 'Create your own option manually';

  @override
  String get formEditTitle => 'Edit habit';

  @override
  String get formCreateTitle => 'New habit';

  @override
  String get formSubtitle =>
      'Set the beginning in the way that feels right for you.';

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
}
