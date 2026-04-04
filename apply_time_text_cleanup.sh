
#!/usr/bin/env bash
set -euo pipefail

cat > lib/features/counters/presentation/widgets/counter_card.dart <<'EOF'
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
  bool _showStartAt = false;

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

      _showStartAt = !_showStartAt;
    });
  }

  @override
  Widget build(BuildContext context) {
    final elapsed = formatElapsed(
      widget.item.startAt,
      mode: _displayMode,
    );

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
                child: Column(
                  children: [
                    Text(
                      elapsed,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    if (_showStartAt) ...[
                      const SizedBox(height: 10),
                      Text(
                        formatDateTime(widget.item.startAt),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ],
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
EOF

echo "Done. Now run:"
echo "  flutter analyze"
echo "  flutter run"
