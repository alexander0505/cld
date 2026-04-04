import 'dart:async';

import 'package:flutter/material.dart';

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
    switch (_displayMode) {
      case CounterCardDisplayMode.seconds:
        return formatElapsed(
          widget.item.startAt,
          mode: CounterTimeDisplayMode.seconds,
        );

      case CounterCardDisplayMode.startDate:
        return formatDateTime(widget.item.startAt);

      case CounterCardDisplayMode.hoursMinutes:
        final diff = DateTime.now().difference(widget.item.startAt);
        final hours = diff.inHours;
        final minutes = diff.inMinutes % 60;
        return '$hours ч $minutes мин';

      case CounterCardDisplayMode.days:
        final diff = DateTime.now().difference(widget.item.startAt);
        return '${diff.inDays} дн';
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayValue = _buildDisplayValue();

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: widget.onTap,
                  icon: const Icon(Icons.more_horiz),
                ),
              ),
              const Spacer(),
              Text(
                widget.item.emoji,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 72),
              ),
              const SizedBox(height: 20),
              Text(
                widget.item.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _switchDisplayMode,
                child: Text(
                  displayValue,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              if (widget.item.reason.isNotEmpty)
                Text(
                  widget.item.reason,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
