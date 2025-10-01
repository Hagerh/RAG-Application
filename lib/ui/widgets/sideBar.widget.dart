import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rag_project/constants/colors/colors.dart';
import 'package:rag_project/ui/widgets/sideBarButtons.widget.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isCollapsed ? 64 : 150 ,
      color: AppColors.sideNav,
      duration: const Duration(milliseconds: 150),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.auto_awesome_mosaic,
              color: Colors.white,
              size: isCollapsed? 30: 50 ,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: isCollapsed
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                SideBarButtons(isCollapsed: isCollapsed, icon: Icons.add, text: "Home"),
                SideBarButtons(isCollapsed: isCollapsed, icon: Icons.search, text: "Search"),
                SideBarButtons(isCollapsed: isCollapsed, icon: Icons.language, text: "Language"),
                SideBarButtons(isCollapsed: isCollapsed, icon: Icons.auto_awesome, text: "Discover"),
                SideBarButtons(isCollapsed: isCollapsed, icon: Icons.cloud_outlined, text: "Cloud"),
                const Spacer(),

                const SizedBox(height: 16),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Icon(
                isCollapsed
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,
                color: AppColors.iconGrey,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
