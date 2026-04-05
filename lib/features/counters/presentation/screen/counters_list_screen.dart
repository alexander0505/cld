import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n.dart';
import '../../data/counters_storage.dart';
import '../../data/habit_presets.dart';
import '../../models/counter_item.dart';
import '../../models/habit_preset.dart';
import '../widgets/counter_card.dart';
import 'counter_details_screen.dart';
import 'counter_form_screen.dart';
import 'habit_preset_picker_screen.dart';

class CountersListScreen extends StatefulWidget {
  const CountersListScreen({super.key});

  @override
  State<CountersListScreen> createState() => _CountersListScreenState();
}

class _CountersListScreenState extends State<CountersListScreen> {
  final CountersStorage _storage = CountersStorage();
  final PageController _pageController = PageController(viewportFraction: 0.96);

  List<CounterItem> _counters = [];
  bool _isLoading = true;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _loadCounters();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadCounters() async {
    final items = await _storage.loadCounters();
    if (!mounted) return;

    setState(() {
      _counters = items;
      _isLoading = false;
    });
  }

  Future<void> _persistCounters() {
    return _storage.saveCounters(_counters);
  }

  void _addCounter(CounterItem item) {
    setState(() {
      _counters.add(item);
    });
    _persistCounters();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _pageController.animateToPage(
        _counters.length - 1,
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOut,
      );
    });
  }

  void _updateCounter(CounterItem updated) {
    setState(() {
      final index = _counters.indexWhere((e) => e.id == updated.id);
      if (index != -1) {
        _counters[index] = updated;
      }
    });
    _persistCounters();
  }

  void _deleteCounter(String id) {
    setState(() {
      _counters.removeWhere((e) => e.id == id);

      if (_currentPage > 0 && _currentPage >= _counters.length) {
        _currentPage = _counters.length - 1;
      }

      if (_counters.isEmpty) {
        _currentPage = 0;
      }
    });

    _persistCounters();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final targetPage =
          _counters.isEmpty ? 0 : _currentPage.clamp(0, _counters.length - 1);

      _pageController.jumpToPage(targetPage);
    });
  }

  void _resetCounter(String id) {
    setState(() {
      final index = _counters.indexWhere((e) => e.id == id);
      if (index != -1) {
        _counters[index] = _counters[index].copyWith(startAt: DateTime.now());
      }
    });
    _persistCounters();
  }

  Future<void> _openCreateFlow() async {
    final excludedPresetKeys = _counters
        .map((item) => item.presetKey)
        .whereType<String>()
        .where((key) => key.isNotEmpty && key != 'custom')
        .toSet();

    final preset = await Navigator.of(context).push<HabitPreset>(
      MaterialPageRoute(
        builder: (_) => HabitPresetPickerScreen(
          excludedPresetKeys: excludedPresetKeys,
        ),
      ),
    );

    if (!mounted || preset == null) return;

    final result = await Navigator.of(context).push<CounterItem>(
      MaterialPageRoute(
        builder: (_) => CounterFormScreen(preset: preset),
      ),
    );

    if (result != null) {
      _addCounter(result);
    }
  }

  Future<void> _openDetails(CounterItem item) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CounterDetailsScreen(
          counter: item,
          onSave: _updateCounter,
          onDelete: _deleteCounter,
          onReset: _resetCounter,
        ),
      ),
    );

    if (!mounted) return;
    setState(() {});
  }

  Widget _buildMeditativeBackground({required Widget child}) {
    return Container(
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
              Colors.white.withValues(alpha: 0.08),
              Colors.white.withValues(alpha: 0.14),
              Colors.white.withValues(alpha: 0.10),
            ],
          ),
        ),
        child: child,
      ),
    );
  }

  Widget _buildAddCounterScene(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 18),
      child: Column(
        children: [
          const Spacer(),
          Text(
            l10n.addHabitSceneTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color(0xFF22312B),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.addHabitSceneSubtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1.45,
              color: Color(0xFF607066),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: _openCreateFlow,
            child: Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.92),
                border: Border.all(color: const Color(0xFFE6ECE6)),
              ),
              child: const Icon(
                Icons.add,
                size: 44,
                color: Color(0xFF24A770),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            l10n.addHabitSceneHint,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              height: 1.4,
              color: Color(0xFF748379),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 18),
      child: Column(
        children: [
          const Spacer(),
          Text(
            l10n.emptyStateTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color(0xFF22312B),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10n.emptyStateSubtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              height: 1.45,
              color: Color(0xFF607066),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: _openCreateFlow,
            child: Container(
              width: 112,
              height: 112,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.92),
                border: Border.all(color: const Color(0xFFE6ECE6)),
              ),
              child: const Icon(
                Icons.add,
                size: 44,
                color: Color(0xFF24A770),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    if (_isLoading) {
      return Scaffold(
        backgroundColor: const Color(0xFFF7FAFB),
        body: _buildMeditativeBackground(
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    final localizedCounters = _counters
        .map((item) => localizeCounterItem(item, l10n))
        .toList();

    final hasItems = localizedCounters.isNotEmpty;
    final totalPages = hasItems ? localizedCounters.length + 1 : 1;

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFB),
      body: _buildMeditativeBackground(
        child: SafeArea(
          child: hasItems
              ? Column(
                  children: [
                    const SizedBox(height: 22),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemCount: totalPages,
                        itemBuilder: (context, index) {
                          if (index == localizedCounters.length) {
                            return _buildAddCounterScene(context);
                          }

                          final item = localizedCounters[index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(14, 22, 14, 18),
                            child: CounterCard(
                              item: item,
                              onTap: () => _openDetails(_counters[index]),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(totalPages, (index) {
                          final isActive = index == _currentPage;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: isActive ? 22 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? const Color(0xFF24A770)
                                  : const Color(0xFF24A770).withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(999),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                )
              : _buildEmptyState(context),
        ),
      ),
    );
  }
}
