import 'package:flutter/material.dart';

import 'features/counters/presentation/screens/counters_list_screen.dart';
import 'features/welcome/presentation/screens/welcome_screen.dart';

class CleanTrackApp extends StatelessWidget {
  const CleanTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Track',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
