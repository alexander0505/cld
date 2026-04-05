import 'package:flutter/widgets.dart';

import '../../l10n/app_localizations.dart';

extension L10nX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

abstract final class AppLocales {
  static const supported = AppLocalizations.supportedLocales;
}
