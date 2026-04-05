import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n.dart';
import '../../data/habit_presets.dart';
import '../../data/habit_presets.dart' show localizeCounterItem;
import '../../models/counter_item.dart';
import '../../utils/date_formatters.dart';
import '../widgets/details/destructive_actions.dart';
import '../widgets/details/info_block.dart';
import 'counter_form_screen.dart';

class CounterDetailsScreen extends StatefulWidget {
  final CounterItem counter;
  final ValueChanged<CounterItem> onSave;
  final ValueChanged<String> onDelete;
  final ValueChanged<String> onReset;

  const CounterDetailsScreen({
    super.key,
    required this.counter,
    required this.onSave,
    required this.onDelete,
    required this.onReset,
  });

  @override
  State<CounterDetailsScreen> createState() => _CounterDetailsScreenState();
}

class _CounterDetailsScreenState extends State<CounterDetailsScreen> {
  late CounterItem _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.counter;
  }

  Future<void> _editCounter() async {
    final l10n = context.l10n;
    final matchedPreset =
        findHabitPresetByKey(_counter.presetKey, l10n) ?? customHabitPreset(l10n);

    final result = await Navigator.of(context).push<CounterItem>(
      MaterialPageRoute(
        builder: (_) => CounterFormScreen(
          existing: _counter,
          preset: matchedPreset,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _counter = result;
      });
      widget.onSave(result);
    }
  }

  Future<bool> _showResetDialog() async {
    final l10n = context.l10n;

    return await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(l10n.detailsResetDialogTitle),
            content: Text(l10n.detailsResetDialogBody),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(l10n.commonCancel),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(l10n.detailsResetAction),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future<bool> _showDeleteDialog() async {
    final l10n = context.l10n;

    return await showDialog<bool>(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(l10n.detailsDeleteDialogTitle),
            content: Text(l10n.detailsDeleteDialogBody),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(l10n.commonCancel),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(l10n.commonDelete),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future<void> _confirmReset() async {
    final confirmed = await _showResetDialog();

    if (!confirmed) return;

    widget.onReset(_counter.id);
    setState(() {
      _counter = _counter.copyWith(startAt: DateTime.now());
    });
  }

  Future<void> _confirmDelete() async {
    final confirmed = await _showDeleteDialog();

    if (!confirmed || !mounted) return;

    widget.onDelete(_counter.id);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final localizedCounter = localizeCounterItem(_counter, l10n);
    final elapsed = formatElapsed(localizedCounter.startAt, l10n);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ocean_bg.png'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withValues(alpha: 0.10),
                Colors.white.withValues(alpha: 0.16),
                Colors.white.withValues(alpha: 0.12),
              ],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back_ios_new),
                        color: const Color(0xFF4E5C56),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: _editCounter,
                        icon: const Icon(Icons.edit_outlined),
                        color: const Color(0xFF4E5C56),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    localizedCounter.emoji,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 74),
                  ),
                  const SizedBox(height: 22),
                  Text(
                    localizedCounter.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF22312B),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    elapsed,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 42,
                      height: 1.1,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF24A770),
                    ),
                  ),
                  const SizedBox(height: 22),
                  InfoBlock(
                    title: l10n.detailsStartDateTitle,
                    value: formatDateTime(localizedCounter.startAt, l10n),
                  ),
                  const SizedBox(height: 14),
                  InfoBlock(
                    title: l10n.detailsReasonTitle,
                    value: localizedCounter.reason.isEmpty
                        ? l10n.detailsReasonEmpty
                        : localizedCounter.reason,
                  ),
                  const Spacer(),
                  DestructiveActions(
                    resetTitle: l10n.detailsResetAction,
                    deleteTitle: l10n.detailsDeleteAction,
                    onReset: _confirmReset,
                    onDelete: _confirmDelete,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
