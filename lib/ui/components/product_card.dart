import 'package:ecommerce/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.first,
    required this.last,
    required this.onPressed,
  }) : super(key: key);

  final bool first;
  final bool last;
  final String title;
  final String imageUrl;
  final int price;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 8.0,
          bottom: 8.0,
          left: first ? 0.0 : 8.0,
          right: last ? 0.0 : 8.0,
        ),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColors.cleanWhite,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              // alignment: Alignment.center,
              height: 160.h,
              width: 220.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              "USD $price",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
