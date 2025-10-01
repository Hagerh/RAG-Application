import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rag_project/constants/colors/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../bussiness/chat_web.bussiness.dart';

class SourcesSection extends StatefulWidget {
  const SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}

class _SourcesSectionState extends State<SourcesSection> {
  List sources = [
    {
      "title": "Ind vs Aus Live Score 4th Test",
      "url": "https://www.mon..."
    },
    {
      "title": "Ind vs Aus Live Boxing Day Test",
      "url": "https://timesofind..."
    },
    {
      "title": "Ind vs Aus - 4 Australian",
      "url": "https://economicti..."
    },
  ];

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    ChatWebService().searchResultStream.listen((data) {
      setState(() {
        sources = data['data'];
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.source_outlined, color: Colors.white70),
            SizedBox(width: 10),
            Text(
              "sources",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Skeletonizer(
          enabled: isLoading,
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: sources.map((res) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 150,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        res['title'],
                        style: TextStyle(fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Text(
                        res['url'],
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
