import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/counter_item.dart';
import '../../utils/date_formatters.dart';

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
  CounterTimeDisplayMode _displayMode = CounterTimeDisplayMode.seconds;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
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
        case CounterTimeDisplayMode.seconds:
          _displayMode = CounterTimeDisplayMode.mixed;
          break;
        case CounterTimeDisplayMode.mixed:
          _displayMode = CounterTimeDisplayMode.days;
          break;
        case CounterTimeDisplayMode.days:
          _displayMode = CounterTimeDisplayMode.seconds;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final elapsed = formatElapsed(
      widget.item.startAt,
      mode: _displayMode,
    );

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Text(
                widget.item.emoji,
                style: const TextStyle(fontSize: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: _switchDisplayMode,
                      child: Text(
                        elapsed,
                        style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Старт: ${formatDateTime(widget.item.startAt)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
