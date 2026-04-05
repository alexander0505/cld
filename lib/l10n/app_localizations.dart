import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Clean Track'**
  String get appTitle;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Clean Track'**
  String get welcomeTitle;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track your progress calmly and return to yourself without extra noise.'**
  String get welcomeSubtitle;

  /// No description provided for @addHabitSceneTitle.
  ///
  /// In en, this message translates to:
  /// **'New habit'**
  String get addHabitSceneTitle;

  /// No description provided for @addHabitSceneSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Add a new habit and begin a new path at your own pace.'**
  String get addHabitSceneSubtitle;

  /// No description provided for @addHabitSceneHint.
  ///
  /// In en, this message translates to:
  /// **'Swipe back to return to your habits.'**
  String get addHabitSceneHint;

  /// No description provided for @emptyStateTitle.
  ///
  /// In en, this message translates to:
  /// **'First habit'**
  String get emptyStateTitle;

  /// No description provided for @emptyStateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start with one habit and simply watch your progress.'**
  String get emptyStateSubtitle;

  /// No description provided for @habitPickerTitle.
  ///
  /// In en, this message translates to:
  /// **'Add habit'**
  String get habitPickerTitle;

  /// No description provided for @habitPickerSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose where you\'d like to begin. You can pick a ready-made option or create your own.'**
  String get habitPickerSubtitle;

  /// No description provided for @habitPickerAllUsedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'All ready-made habits have already been added. You can create your own.'**
  String get habitPickerAllUsedSubtitle;

  /// No description provided for @customHabitTitle.
  ///
  /// In en, this message translates to:
  /// **'Custom habit'**
  String get customHabitTitle;

  /// No description provided for @customHabitSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your own option manually'**
  String get customHabitSubtitle;

  /// No description provided for @formEditTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit habit'**
  String get formEditTitle;

  /// No description provided for @formCreateTitle.
  ///
  /// In en, this message translates to:
  /// **'New habit'**
  String get formCreateTitle;

  /// No description provided for @formSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Set the beginning in the way that feels right for you.'**
  String get formSubtitle;

  /// No description provided for @formActionSave.
  ///
  /// In en, this message translates to:
  /// **'Save changes'**
  String get formActionSave;

  /// No description provided for @formActionStart.
  ///
  /// In en, this message translates to:
  /// **'Start tracking'**
  String get formActionStart;

  /// No description provided for @formCustomHabitBlockTitle.
  ///
  /// In en, this message translates to:
  /// **'Your habit'**
  String get formCustomHabitBlockTitle;

  /// No description provided for @formHabitNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Habit name'**
  String get formHabitNameLabel;

  /// No description provided for @formHabitNameHint.
  ///
  /// In en, this message translates to:
  /// **'For example: Alcohol'**
  String get formHabitNameHint;

  /// No description provided for @formHabitNameValidation.
  ///
  /// In en, this message translates to:
  /// **'Enter a habit name'**
  String get formHabitNameValidation;

  /// No description provided for @formEmojiLabel.
  ///
  /// In en, this message translates to:
  /// **'Emoji'**
  String get formEmojiLabel;

  /// No description provided for @formEmojiHint.
  ///
  /// In en, this message translates to:
  /// **'For example: 🚭'**
  String get formEmojiHint;

  /// No description provided for @formStartPointTitle.
  ///
  /// In en, this message translates to:
  /// **'Starting point'**
  String get formStartPointTitle;

  /// No description provided for @formWhyTitle.
  ///
  /// In en, this message translates to:
  /// **'Why this matters'**
  String get formWhyTitle;

  /// No description provided for @formCustomReasonLabel.
  ///
  /// In en, this message translates to:
  /// **'Your reason'**
  String get formCustomReasonLabel;

  /// No description provided for @formCustomReasonHint.
  ///
  /// In en, this message translates to:
  /// **'Why do you want to begin right now?'**
  String get formCustomReasonHint;

  /// No description provided for @detailsStartDateTitle.
  ///
  /// In en, this message translates to:
  /// **'Start date'**
  String get detailsStartDateTitle;

  /// No description provided for @detailsReasonTitle.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get detailsReasonTitle;

  /// No description provided for @detailsReasonEmpty.
  ///
  /// In en, this message translates to:
  /// **'No reason specified'**
  String get detailsReasonEmpty;

  /// No description provided for @detailsResetAction.
  ///
  /// In en, this message translates to:
  /// **'Start over'**
  String get detailsResetAction;

  /// No description provided for @detailsDeleteAction.
  ///
  /// In en, this message translates to:
  /// **'Delete habit'**
  String get detailsDeleteAction;

  /// No description provided for @detailsResetDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Start over?'**
  String get detailsResetDialogTitle;

  /// No description provided for @detailsResetDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Your current progress will begin again from this moment.'**
  String get detailsResetDialogBody;

  /// No description provided for @detailsDeleteDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete habit?'**
  String get detailsDeleteDialogTitle;

  /// No description provided for @detailsDeleteDialogBody.
  ///
  /// In en, this message translates to:
  /// **'This action cannot be undone.'**
  String get detailsDeleteDialogBody;

  /// No description provided for @commonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get commonCancel;

  /// No description provided for @commonDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get commonDelete;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
