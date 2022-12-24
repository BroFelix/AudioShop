import 'package:audioshop/app/res/colors.dart';
import 'package:audioshop/app/res/styles.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class RecentSearchItem extends StatelessWidget {
  final String title;
  final VoidCallback onDelete;
  final VoidCallback onTapped;

  const RecentSearchItem({
    Key? key,
    required this.title,
    required this.onDelete,
    required this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Icon(
                FeatherIcons.clock,
                color: AppColors.lightGrey,
              ),
              SizedBox(width: 12.0),
              Text(
                title,
                style: AppTextStyle.title1,
              ),
            ]),
            IconButton(
              onPressed: onDelete,
              icon: Icon(FeatherIcons.x),
            ),
          ],
        ),
      ),
    );
  }
}
