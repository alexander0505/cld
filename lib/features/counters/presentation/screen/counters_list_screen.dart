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
  final PageController _pageController = PageController();

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
        duration: const Duration(milliseconds: 250),
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
            Color(0xFFF7F8F3),
            Color(0xFFF0F5EF),
            Color(0xFFF8F4EE),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -80,
            left: -50,
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFBEE8D6).withValues(alpha: 0.32),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            right: -70,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF0E5D8).withValues(alpha: 0.45),
              ),
            ),
          ),
          Positioned(
            top: 220,
            right: -40,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFDCEAE7).withValues(alpha: 0.35),
              ),
            ),
          ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }

  Widget _buildAddCounterPage() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white.withValues(alpha: 0.74),
          border: Border.all(
            color: const Color(0xFFE6ECE6),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: _openCreateFlow,
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add_circle_outline,
                    size: 72,
                    color: Color(0xFF55615A),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Новый счетчик',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF22322B),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Свайпни дальше или нажми здесь, чтобы добавить новую привычку.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF5E6D65),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white.withValues(alpha: 0.74),
          border: Border.all(
            color: const Color(0xFFE6ECE6),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(32),
            onTap: _openCreateFlow,
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.spa,
                    size: 72,
                    color: Color(0xFF55615A),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Создай первый счетчик',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF22322B),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Начни отслеживать прогресс с сегодняшнего дня.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF5E6D65),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: const Color(0xFFF7F8F3),
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
      backgroundColor: const Color(0xFFF7F8F3),
      body: _buildMeditativeBackground(
        child: SafeArea(
          child: hasItems
              ? Column(
                  children: [
                    const SizedBox(height: 8),
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
                            return _buildAddCounterPage();
                          }

                          final item = _counters[index];
                          return Padding(
                            padding: const EdgeInsets.all(16),
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
                            width: isActive ? 20 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? const Color(0xFF1FA971)
                                  : const Color(0xFF1FA971).withValues(alpha: 0.18),
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
