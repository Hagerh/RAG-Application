import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rag_project/ui/screens/chat_page.dart';
import 'package:rag_project/constants/colors/colors.dart';
import 'package:rag_project/ui/screens/rag.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.submitButton),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme.copyWith(bodyMedium:const TextStyle(fontSize: 15 , color: Colors.white) )),

      ),
      home: const RagPage(),
    );
  }
}
