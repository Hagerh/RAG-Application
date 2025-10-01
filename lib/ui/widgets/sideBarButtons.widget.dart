import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors/colors.dart';

class SideBarButtons extends StatelessWidget {
  final bool isCollapsed;

  final IconData icon;
  final String text;

  const SideBarButtons({
    super.key,
    required this.isCollapsed,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isCollapsed
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          child: Icon(icon, color: AppColors.iconGrey, size: 22),
        ),
        // isCollapsed ? const SizedBox() : Text(text),
        if (!isCollapsed)
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.ellipsis, // prevents overflow
              softWrap: false,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
      ],
    );
  }
}
