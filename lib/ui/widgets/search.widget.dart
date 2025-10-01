import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rag_project/bussiness/chat_web.bussiness.dart';
import 'package:rag_project/constants/colors/colors.dart';
import 'package:rag_project/ui/screens/chat_page.dart';
import 'package:rag_project/ui/widgets/searchButtons.widget.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final queryController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    queryController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Where Knowledge begin',
          style: GoogleFonts.ibmPlexMono(
            fontSize: 35,
            letterSpacing: -0.5,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          width: 700,
          decoration: BoxDecoration(
            color: AppColors.searchBar,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.searchBarBorder),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: queryController,
                  decoration: InputDecoration(
                    hintText: "search anything...",
                    hintStyle: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    SearchBarButton(
                      icon: Icons.auto_awesome_outlined,
                      text: "Focus",
                    ),
                    const SizedBox(width: 12),
                    SearchBarButton(
                      icon: Icons.add_circle_outline,
                      text: "Attach",
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        ChatWebService().chat(queryController.text.trim());
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChatPage(question: queryController.text.trim())));
                      },
                      child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: AppColors.submitButton,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: AppColors.background,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
