import '../../../l10n/app_localizations.dart';

enum CounterTimeDisplayMode {
  seconds,
  mixed,
  days,
}

String formatWithSpaces(int value) {
  final digits = value.toString();
  final buffer = StringBuffer();

  for (int i = 0; i < digits.length; i++) {
    final reverseIndex = digits.length - i;
    buffer.write(digits[i]);

    if (reverseIndex > 1 && reverseIndex % 3 == 1) {
      buffer.write(' ');
    }
  }

  return buffer.toString();
}

String formatElapsed(
  DateTime startAt,
  AppLocalizations l10n, {
  CounterTimeDisplayMode mode = CounterTimeDisplayMode.mixed,
}) {
  final diff = DateTime.now().difference(startAt);

  switch (mode) {
    case CounterTimeDisplayMode.seconds:
      return '${formatWithSpaces(diff.inSeconds)} ${l10n.timeUnitSecondsShort}';

    case CounterTimeDisplayMode.days:
      return '${formatWithSpaces(diff.inDays)} ${l10n.timeUnitDaysShort}';

    case CounterTimeDisplayMode.mixed:
      if (diff.inDays > 0) {
        final days = diff.inDays;
        final hours = diff.inHours % 24;
        return '${formatWithSpaces(days)} ${l10n.timeUnitDaysShort} $hours ${l10n.timeUnitHoursShort}';
      }

      if (diff.inHours > 0) {
        final hours = diff.inHours;
        final minutes = diff.inMinutes % 60;
        return '${formatWithSpaces(hours)} ${l10n.timeUnitHoursShort} $minutes ${l10n.timeUnitMinutesShort}';
      }

      if (diff.inMinutes > 0) {
        return '${formatWithSpaces(diff.inMinutes)} ${l10n.timeUnitMinutesShort} ${diff.inSeconds % 60} ${l10n.timeUnitSecondsShort}';
      }

      return '${formatWithSpaces(diff.inSeconds)} ${l10n.timeUnitSecondsShort}';
  }
}

String formatDateTime(DateTime dateTime) {
  String two(int value) => value.toString().padLeft(2, '0');

  final day = two(dateTime.day);
  final month = two(dateTime.month);
  final year = dateTime.year;
  final hour = two(dateTime.hour);
  final minute = two(dateTime.minute);

  return '$day.$month.$year $hour:$minute';
}
