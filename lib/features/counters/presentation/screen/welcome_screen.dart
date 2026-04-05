import 'dart:async';

import 'package:flutter/material.dart';

import '../../data/counters_storage.dart';
import 'counters_list_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final CountersStorage _storage = CountersStorage();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () async {
      await _finishWelcome();
    });
  }

  Future<void> _finishWelcome() async {
    await _storage.markWelcomeSeen();

    if (!mounted) return;

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => const CountersListScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                Colors.white.withValues(alpha: 0.08),
                Colors.white.withValues(alpha: 0.14),
                Colors.white.withValues(alpha: 0.10),
              ],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.72),
                        border: Border.all(
                          color: const Color(0xFFE6ECE6),
                        ),
                      ),
                      child: const Icon(
                        Icons.spa_outlined,
                        size: 38,
                        color: Color(0xFF24A770),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Clean Track',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                        color: Color(0xFF22312B),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Спокойно наблюдай за своим прогрессом\nи возвращайся к себе без лишнего шума.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.45,
                        color: Color(0xFF607066),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
