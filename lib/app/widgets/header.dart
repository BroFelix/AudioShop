import 'package:audioshop/app/res/colors.dart';
import 'package:audioshop/app/res/styles.dart';
import 'package:flutter/material.dart';

class Headerapp extends StatelessWidget {
  const Headerapp({
    Key? key,
    required this.title,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 100.0,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          vertical: 5.0,
          horizontal: 12.0,
        ),
        decoration: BoxDecoration(
          color: selected ? AppColors.greenTab : AppColors.whiteOne,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          title,
          style: AppTextStyle.tabTitle.copyWith(
            color: selected ? Colors.white : AppColors.darkGrey,
          ),
        ),
      ),
    );
  }
}
