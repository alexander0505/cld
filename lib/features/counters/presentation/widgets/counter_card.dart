import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n.dart';
import '../../models/counter_item.dart';
import '../../utils/date_formatters.dart';

enum CounterCardDisplayMode {
  seconds,
  startDate,
  hoursMinutes,
  days,
}

class CounterCard extends StatefulWidget {
  final CounterItem item;
  final VoidCallback onTap;

  const CounterCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  State<CounterCard> createState() => _CounterCardState();
}

class _CounterCardState extends State<CounterCard> {
  late Timer _timer;
  CounterCardDisplayMode _displayMode = CounterCardDisplayMode.seconds;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted && _displayMode != CounterCardDisplayMode.startDate) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _switchDisplayMode() {
    setState(() {
      switch (_displayMode) {
        case CounterCardDisplayMode.seconds:
          _displayMode = CounterCardDisplayMode.startDate;
          break;
        case CounterCardDisplayMode.startDate:
          _displayMode = CounterCardDisplayMode.hoursMinutes;
          break;
        case CounterCardDisplayMode.hoursMinutes:
          _displayMode = CounterCardDisplayMode.days;
          break;
        case CounterCardDisplayMode.days:
          _displayMode = CounterCardDisplayMode.seconds;
          break;
      }
    });
  }

  String _buildDisplayValue() {
    final l10n = context.l10n;

    switch (_displayMode) {
      case CounterCardDisplayMode.seconds:
        return formatElapsed(
          widget.item.startAt,
          l10n,
          mode: CounterTimeDisplayMode.seconds,
        );

      case CounterCardDisplayMode.startDate:
        final startAt = widget.item.startAt;
        final day = startAt.day.toString().padLeft(2, '0');
        final month = startAt.month.toString().padLeft(2, '0');
        final year = startAt.year;
        return '$day.$month.$year';

      case CounterCardDisplayMode.hoursMinutes:
        final diff = DateTime.now().difference(widget.item.startAt);
        final hours = diff.inHours;
        final minutes = diff.inMinutes % 60;
        return '${formatWithSpaces(hours)} ${l10n.timeUnitHoursShort} $minutes ${l10n.timeUnitMinutesShort}';

      case CounterCardDisplayMode.days:
        final diff = DateTime.now().difference(widget.item.startAt);
        return '${formatWithSpaces(diff.inDays)} ${l10n.timeUnitDaysShort}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayValue = _buildDisplayValue();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(34),
        color: Colors.white.withValues(alpha: 0.18),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(34),
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 20, 28, 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: widget.onTap,
                    icon: const Icon(Icons.more_horiz),
                    color: const Color(0xFF4E5C56),
                  ),
                ),
                const Spacer(),
                Text(
                  widget.item.emoji,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 76),
                ),
                const SizedBox(height: 24),
                Text(
                  widget.item.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF213029),
                  ),
                ),
                const SizedBox(height: 26),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: _switchDisplayMode,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      displayValue,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 40,
                        height: 1.1,
                        color: Color(0xFF24A770),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                if (widget.item.reason.isNotEmpty)
                  Text(
                    widget.item.reason,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF5E6D65),
                      fontSize: 16,
                      height: 1.45,
                    ),
                  ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
