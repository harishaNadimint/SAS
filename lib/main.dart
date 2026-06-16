import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/story_provider.dart';
import 'screens/story_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => StoryProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color:  Color.fromARGB(255, 34, 78, 52),
      debugShowCheckedModeBanner: false,
      home: const StoryScreen(),
    );
  }
}