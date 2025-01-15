import 'package:flutter/material.dart';
import 'package:music_app/config/theme.dart';
import 'package:music_app/pages/song_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music',
      theme: darkTheme,
      home: const SongPage(),
    );
  }
}
