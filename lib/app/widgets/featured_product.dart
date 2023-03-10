import 'package:audioshop/app/res/colors.dart';
import 'package:audioshop/app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String imageUrl;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.cleanWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.header0,
              ),
              const SizedBox(height: 16.0),
              InkWell(
                onTap: onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Shop now',
                      style: AppTextStyle.linkText,
                    ),
                    const SizedBox(width: 8.0),
                    Icon(
                      Icons.arrow_forward,
                      color: AppColors.green,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Image.asset(
            imageUrl,
            height: 250.h,
            width: 250.w,
          ),
        ],
      ),
    );
  }
}
