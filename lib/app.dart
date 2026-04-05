import 'package:flutter/material.dart';

import 'features/counters/presentation/screen/counters_list_screen.dart';
import 'features/counters/presentation/screen/welcome_screen.dart';

class CleanTrackApp extends StatelessWidget {
  final bool hasSeenWelcome;

  const CleanTrackApp({
    super.key,
    required this.hasSeenWelcome,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Track',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: hasSeenWelcome
          ? const CountersListScreen()
          : const WelcomeScreen(),
    );
  }
}
