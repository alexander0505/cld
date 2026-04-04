enum CounterTimeDisplayMode {
  seconds,
  mixed,
  days,
}

String formatElapsed(
  DateTime startAt, {
  CounterTimeDisplayMode mode = CounterTimeDisplayMode.mixed,
}) {
  final diff = DateTime.now().difference(startAt);

  switch (mode) {
    case CounterTimeDisplayMode.seconds:
      return '${diff.inSeconds} сек';

    case CounterTimeDisplayMode.days:
      return '${diff.inDays} дн';

    case CounterTimeDisplayMode.mixed:
      if (diff.inDays > 0) {
        final days = diff.inDays;
        final hours = diff.inHours % 24;
        return '$days дн $hours ч';
      }

      if (diff.inHours > 0) {
        final hours = diff.inHours;
        final minutes = diff.inMinutes % 60;
        return '$hours ч $minutes мин';
      }

      if (diff.inMinutes > 0) {
        return '${diff.inMinutes} мин ${diff.inSeconds % 60} сек';
      }

      return '${diff.inSeconds} сек';
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
