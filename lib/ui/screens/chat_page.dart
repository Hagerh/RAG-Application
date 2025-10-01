import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rag_project/constants/colors/colors.dart';
import 'package:rag_project/ui/widgets/answer.widget.dart';
import 'package:rag_project/ui/widgets/sideBar.widget.dart';
import 'package:rag_project/ui/widgets/sources.widget.dart';

class ChatPage extends StatelessWidget {
  final String question;

  const ChatPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          kIsWeb? SideBar():SizedBox(),
          kIsWeb? const SizedBox(width: 100): SizedBox(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question,
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height:24),
                    //sources
                    SourcesSection(),
                    SizedBox(height:24),
                    //answer section
                    AnswerSection(),
                  ],
                ),
              ),
            ),
          ),
          kIsWeb? Placeholder(strokeWidth: 0, color: AppColors.background,): SizedBox(),
        ],
      ),
    );
  }
}
