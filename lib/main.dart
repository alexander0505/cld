import 'package:flutter/material.dart';

import 'app.dart';
import 'features/counters/data/counters_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = CountersStorage();
  final hasSeenWelcome = await storage.hasSeenWelcome();

  runApp(CleanTrackApp(hasSeenWelcome: hasSeenWelcome));
}
