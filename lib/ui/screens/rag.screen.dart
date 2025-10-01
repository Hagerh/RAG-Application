import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rag_project/constants/colors/colors.dart';
import 'package:rag_project/ui/widgets/sideBar.widget.dart';

import '../../bussiness/chat_web.bussiness.dart';
import '../widgets/search.widget.dart';

class RagPage extends StatefulWidget {
  const RagPage({super.key});

  @override
  State<RagPage> createState() => _RagPageState();
}

class _RagPageState extends State<RagPage> {
  late ChatWebService _chatWebService;

  @override
  void initState() {
    super.initState();
    _chatWebService = ChatWebService();
    _chatWebService.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
         kIsWeb? SideBar():SizedBox(),
          Expanded(
            child: Padding(
              padding: !kIsWeb? const EdgeInsets.all(8.0): EdgeInsets.zero,
              child: Column(
                children: [
                  Expanded(child: SearchSection()),
                  //footer
                 /*StreamBuilder(
                    stream: ChatWebService().contentStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                    },
                  ),*/
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Pro",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "EnterPrice",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Store",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Blog",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "Careers",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            "English(English)",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textGrey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
