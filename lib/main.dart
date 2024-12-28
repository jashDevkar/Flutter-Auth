import 'package:auth_app/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRndnRpY3hmeG11b2llbWR4eGZvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUyMjIwNDAsImV4cCI6MjA1MDc5ODA0MH0.1wx7WQJt6AbBr-8Jzp3pCC_ZyhA0ETCxpQNqjyWBm7E',
    url: 'https://dgvticxfxmuoiemdxxfo.supabase.co',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}
