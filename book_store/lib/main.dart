import 'package:flutter/material.dart';
import 'package:book_store/screens/main_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://lpugfaewpcvfwtehneiw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxwdWdmYWV3cGN2Znd0ZWhuZWl3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTU3NzA1NDUsImV4cCI6MjA3MTM0NjU0NX0.7HL76Y8im0aVLOARbUVUoW_7wV6uq0MmXstib5b-uBw',
  );
  runApp(Abyssinia());
}

class Abyssinia extends StatelessWidget {
  const Abyssinia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MainScreen());
  }
}
