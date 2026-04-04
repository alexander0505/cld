import 'package:flutter/material.dart';

import '../../data/counters_storage.dart';
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
    final preset = await Navigator.of(context).push<HabitPreset>(
      MaterialPageRoute(
        builder: (_) => const HabitPresetPickerScreen(),
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
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFF7FAFB),
            Color(0xFFF1F7F5),
            Color(0xFFF7F5EF),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -120,
            left: -60,
            child: Container(
              width: 360,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: const Color(0xFFD8EEE7).withValues(alpha: 0.55),
              ),
            ),
          ),
          Positioned(
            top: 120,
            right: -80,
            child: Container(
              width: 420,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: const Color(0xFFE6F3EE).withValues(alpha: 0.75),
              ),
            ),
          ),
          Positioned(
            bottom: 140,
            left: -90,
            child: Container(
              width: 400,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: const Color(0xFFF1ECE3).withValues(alpha: 0.80),
              ),
            ),
          ),
          Positioned(
            bottom: -70,
            right: -100,
            child: Container(
              width: 420,
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                color: const Color(0xFFDDEDE6).withValues(alpha: 0.65),
              ),
            ),
          ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }

  Widget _buildAddCounterScene() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 18),
      child: Column(
        children: [
          const Spacer(),
          const Text(
            'Новый счетчик',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color(0xFF22312B),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Добавь новую привычку и начни новый отсчёт.',
            textAlign: TextAlign.center,
            style: TextStyle(
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
          const Text(
            'Свайпни обратно, чтобы вернуться к текущим счетчикам.',
            textAlign: TextAlign.center,
            style: TextStyle(
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

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 28, 18, 18),
      child: Column(
        children: [
          const Spacer(),
          const Text(
            'Твой первый счетчик',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Color(0xFF22312B),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Начни отслеживать прогресс с одной привычки.',
            textAlign: TextAlign.center,
            style: TextStyle(
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

    final hasItems = _counters.isNotEmpty;
    final totalPages = hasItems ? _counters.length + 1 : 1;

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
                          if (index == _counters.length) {
                            return _buildAddCounterScene();
                          }

                          final item = _counters[index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(14, 22, 14, 18),
                            child: CounterCard(
                              item: item,
                              onTap: () => _openDetails(item),
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
              : _buildEmptyState(),
        ),
      ),
    );
  }
}
